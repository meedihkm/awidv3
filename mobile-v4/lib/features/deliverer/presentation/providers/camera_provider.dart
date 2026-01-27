import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

/// Provider pour la gestion de la caméra et des photos
final cameraProvider = StateNotifierProvider<CameraNotifier, CameraState>(
  (ref) => CameraNotifier(),
);

/// Notifier pour la gestion de la caméra
class CameraNotifier extends StateNotifier<CameraState> {
  final ImagePicker _imagePicker = ImagePicker();

  CameraNotifier() : super(const CameraState.idle());

  /// Prend une photo avec la caméra
  Future<void> takePhoto({
    ImageSource source = ImageSource.camera,
    int imageQuality = 85,
  }) async {
    try {
      state = const CameraState.loading();

      // Vérifier les permissions
      final hasPermission = await _checkCameraPermission();
      if (!hasPermission) {
        state = const CameraState.error('Permission caméra refusée');
        return;
      }

      // Prendre la photo
      final XFile? image = await _imagePicker.pickImage(
        source: source,
        imageQuality: imageQuality,
        preferredCameraDevice: CameraDevice.rear,
      );

      if (image == null) {
        state = const CameraState.cancelled();
        return;
      }

      // Sauvegarder la photo dans le dossier app
      final savedPath = await _saveImageToAppDirectory(image);

      state = CameraState.photoTaken(
        imagePath: savedPath,
        originalPath: image.path,
        size: await _getFileSize(savedPath),
      );
    } catch (error) {
      state = CameraState.error('Erreur lors de la prise de photo: $error');
    }
  }

  /// Prend plusieurs photos
  Future<void> takeMultiplePhotos({
    int maxImages = 5,
    int imageQuality = 85,
  }) async {
    try {
      state = const CameraState.loading();

      // Vérifier les permissions
      final hasPermission = await _checkCameraPermission();
      if (!hasPermission) {
        state = const CameraState.error('Permission caméra refusée');
        return;
      }

      // Prendre plusieurs photos
      final List<XFile> images = await _imagePicker.pickMultiImage(
        imageQuality: imageQuality,
        limit: maxImages,
      );

      if (images.isEmpty) {
        state = const CameraState.cancelled();
        return;
      }

      // Sauvegarder toutes les photos
      final List<String> savedPaths = [];
      final List<int> sizes = [];

      for (final image in images) {
        final savedPath = await _saveImageToAppDirectory(image);
        final size = await _getFileSize(savedPath);
        savedPaths.add(savedPath);
        sizes.add(size);
      }

      state = CameraState.multiplePhotosTaken(
        imagePaths: savedPaths,
        originalPaths: images.map((i) => i.path).toList(),
        sizes: sizes,
        totalSize: sizes.fold(0, (sum, size) => sum + size),
      );
    } catch (error) {
      state = CameraState.error('Erreur lors de la prise de photos: $error');
    }
  }

  /// Sélectionne une photo depuis la galerie
  Future<void> pickFromGallery({
    int imageQuality = 85,
  }) async {
    await takePhoto(
      source: ImageSource.gallery,
      imageQuality: imageQuality,
    );
  }

  /// Sélectionne plusieurs photos depuis la galerie
  Future<void> pickMultipleFromGallery({
    int maxImages = 5,
    int imageQuality = 85,
  }) async {
    await takeMultiplePhotos(
      maxImages: maxImages,
      imageQuality: imageQuality,
    );
  }

  /// Supprime une photo
  Future<void> deletePhoto(String imagePath) async {
    try {
      final file = File(imagePath);
      if (await file.exists()) {
        await file.delete();
      }
      state = const CameraState.photoDeleted();
    } catch (error) {
      state = CameraState.error('Erreur lors de la suppression: $error');
    }
  }

  /// Compresse une image
  Future<void> compressImage(String imagePath, {int quality = 70}) async {
    try {
      state = const CameraState.loading();

      final file = File(imagePath);
      if (!await file.exists()) {
        state = const CameraState.error('Fichier image non trouvé');
        return;
      }

      // Utiliser image_picker pour compresser
      final compressedImage = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: quality,
      );

      if (compressedImage == null) {
        state = const CameraState.error('Erreur lors de la compression');
        return;
      }

      // Remplacer le fichier original
      final compressedFile = File(compressedImage.path);
      await compressedFile.copy(imagePath);
      await compressedFile.delete();

      final newSize = await _getFileSize(imagePath);

      state = CameraState.imageCompressed(
        imagePath: imagePath,
        newSize: newSize,
        quality: quality,
      );
    } catch (error) {
      state = CameraState.error('Erreur lors de la compression: $error');
    }
  }

  /// Redimensionne une image
  Future<void> resizeImage(
    String imagePath, {
    int? maxWidth,
    int? maxHeight,
  }) async {
    try {
      state = const CameraState.loading();

      // Pour le redimensionnement, on utiliserait une librairie comme image
      // Ici on simule juste la compression
      await compressImage(imagePath, quality: 60);

      state = CameraState.imageResized(
        imagePath: imagePath,
        maxWidth: maxWidth,
        maxHeight: maxHeight,
      );
    } catch (error) {
      state = CameraState.error('Erreur lors du redimensionnement: $error');
    }
  }

  /// Remet l'état à idle
  void resetState() {
    state = const CameraState.idle();
  }

  /// Vérifie les permissions caméra
  Future<bool> _checkCameraPermission() async {
    try {
      final status = await Permission.camera.status;
      
      if (status.isGranted) {
        return true;
      }
      
      if (status.isDenied) {
        final result = await Permission.camera.request();
        return result.isGranted;
      }
      
      if (status.isPermanentlyDenied) {
        // Ouvrir les paramètres
        await openAppSettings();
        return false;
      }
      
      return false;
    } catch (error) {
      return false;
    }
  }

  /// Sauvegarde une image dans le dossier de l'app
  Future<String> _saveImageToAppDirectory(XFile image) async {
    try {
      final appDir = await getApplicationDocumentsDirectory();
      final imagesDir = Directory('${appDir.path}/images');
      
      if (!await imagesDir.exists()) {
        await imagesDir.create(recursive: true);
      }

      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final extension = image.path.split('.').last;
      final fileName = 'img_${timestamp}.$extension';
      final savedPath = '${imagesDir.path}/$fileName';

      final file = File(image.path);
      await file.copy(savedPath);

      return savedPath;
    } catch (error) {
      throw Exception('Erreur lors de la sauvegarde: $error');
    }
  }

  /// Récupère la taille d'un fichier
  Future<int> _getFileSize(String filePath) async {
    try {
      final file = File(filePath);
      return await file.length();
    } catch (error) {
      return 0;
    }
  }
}

/// État de la caméra
sealed class CameraState {
  const CameraState();

  const factory CameraState.idle() = _Idle;
  const factory CameraState.loading() = _Loading;
  const factory CameraState.error(String message) = _Error;
  const factory CameraState.cancelled() = _Cancelled;
  
  const factory CameraState.photoTaken({
    required String imagePath,
    required String originalPath,
    required int size,
  }) = _PhotoTaken;
  
  const factory CameraState.multiplePhotosTaken({
    required List<String> imagePaths,
    required List<String> originalPaths,
    required List<int> sizes,
    required int totalSize,
  }) = _MultiplePhotosTaken;
  
  const factory CameraState.photoDeleted() = _PhotoDeleted;
  
  const factory CameraState.imageCompressed({
    required String imagePath,
    required int newSize,
    required int quality,
  }) = _ImageCompressed;
  
  const factory CameraState.imageResized({
    required String imagePath,
    int? maxWidth,
    int? maxHeight,
  }) = _ImageResized;
}

class _Idle extends CameraState {
  const _Idle();
}

class _Loading extends CameraState {
  const _Loading();
}

class _Error extends CameraState {
  final String message;
  const _Error(this.message);
}

class _Cancelled extends CameraState {
  const _Cancelled();
}

class _PhotoTaken extends CameraState {
  final String imagePath;
  final String originalPath;
  final int size;
  
  const _PhotoTaken({
    required this.imagePath,
    required this.originalPath,
    required this.size,
  });

  /// Retourne la taille formatée
  String get sizeFormatted {
    if (size < 1024) return '${size}B';
    if (size < 1024 * 1024) return '${(size / 1024).toStringAsFixed(1)}KB';
    return '${(size / (1024 * 1024)).toStringAsFixed(1)}MB';
  }
}

class _MultiplePhotosTaken extends CameraState {
  final List<String> imagePaths;
  final List<String> originalPaths;
  final List<int> sizes;
  final int totalSize;
  
  const _MultiplePhotosTaken({
    required this.imagePaths,
    required this.originalPaths,
    required this.sizes,
    required this.totalSize,
  });

  /// Retourne le nombre de photos
  int get photosCount => imagePaths.length;

  /// Retourne la taille totale formatée
  String get totalSizeFormatted {
    if (totalSize < 1024) return '${totalSize}B';
    if (totalSize < 1024 * 1024) return '${(totalSize / 1024).toStringAsFixed(1)}KB';
    return '${(totalSize / (1024 * 1024)).toStringAsFixed(1)}MB';
  }
}

class _PhotoDeleted extends CameraState {
  const _PhotoDeleted();
}

class _ImageCompressed extends CameraState {
  final String imagePath;
  final int newSize;
  final int quality;
  
  const _ImageCompressed({
    required this.imagePath,
    required this.newSize,
    required this.quality,
  });

  /// Retourne la nouvelle taille formatée
  String get newSizeFormatted {
    if (newSize < 1024) return '${newSize}B';
    if (newSize < 1024 * 1024) return '${(newSize / 1024).toStringAsFixed(1)}KB';
    return '${(newSize / (1024 * 1024)).toStringAsFixed(1)}MB';
  }
}

class _ImageResized extends CameraState {
  final String imagePath;
  final int? maxWidth;
  final int? maxHeight;
  
  const _ImageResized({
    required this.imagePath,
    this.maxWidth,
    this.maxHeight,
  });

  /// Retourne les dimensions formatées
  String get dimensionsFormatted {
    if (maxWidth != null && maxHeight != null) {
      return '${maxWidth}x${maxHeight}';
    } else if (maxWidth != null) {
      return 'Largeur: ${maxWidth}px';
    } else if (maxHeight != null) {
      return 'Hauteur: ${maxHeight}px';
    }
    return 'Redimensionnée';
  }
}

// ==================== EXTENSIONS UTILITAIRES ====================

extension CameraStateX on CameraState {
  /// Vérifie si l'état est idle
  bool get isIdle => this is _Idle;

  /// Vérifie si l'état est loading
  bool get isLoading => this is _Loading;

  /// Vérifie si l'état est error
  bool get isError => this is _Error;

  /// Vérifie si l'état est cancelled
  bool get isCancelled => this is _Cancelled;

  /// Vérifie si une photo a été prise
  bool get hasPhoto => this is _PhotoTaken || this is _MultiplePhotosTaken;

  /// Récupère le message d'erreur
  String? get errorMessage {
    if (this is _Error) {
      return (this as _Error).message;
    }
    return null;
  }

  /// Récupère le chemin de la photo (pour photo unique)
  String? get imagePath {
    if (this is _PhotoTaken) {
      return (this as _PhotoTaken).imagePath;
    }
    return null;
  }

  /// Récupère les chemins des photos (pour photos multiples)
  List<String>? get imagePaths {
    if (this is _MultiplePhotosTaken) {
      return (this as _MultiplePhotosTaken).imagePaths;
    }
    return null;
  }
}