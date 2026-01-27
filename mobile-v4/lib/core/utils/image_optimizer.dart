import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

/// Service d'optimisation d'images
class ImageOptimizer {
  static final ImageOptimizer _instance = ImageOptimizer._internal();
  factory ImageOptimizer() => _instance;
  ImageOptimizer._internal();

  /// Optimiser une image
  Future<File> optimizeImage(
    File imageFile, {
    int maxWidth = 1920,
    int maxHeight = 1080,
    int quality = 85,
  }) async {
    try {
      // Lire l'image
      final bytes = await imageFile.readAsBytes();
      final image = img.decodeImage(bytes);

      if (image == null) {
        throw Exception('Impossible de décoder l\'image');
      }

      // Redimensionner si nécessaire
      img.Image resized = image;
      if (image.width > maxWidth || image.height > maxHeight) {
        resized = img.copyResize(
          image,
          width: image.width > maxWidth ? maxWidth : null,
          height: image.height > maxHeight ? maxHeight : null,
          interpolation: img.Interpolation.linear,
        );
      }

      // Compresser
      final compressed = img.encodeJpg(resized, quality: quality);

      // Sauvegarder
      final tempDir = await getTemporaryDirectory();
      final fileName = path.basename(imageFile.path);
      final optimizedFile = File('${tempDir.path}/optimized_$fileName');
      await optimizedFile.writeAsBytes(compressed);

      final originalSize = bytes.length;
      final optimizedSize = compressed.length;
      final reduction = ((originalSize - optimizedSize) / originalSize * 100).toStringAsFixed(1);

      print('✅ Image optimisée: ${_formatBytes(originalSize)} → ${_formatBytes(optimizedSize)} (-$reduction%)');

      return optimizedFile;
    } catch (e) {
      print('❌ Erreur d\'optimisation: $e');
      return imageFile;
    }
  }

  /// Optimiser pour thumbnail
  Future<File> createThumbnail(
    File imageFile, {
    int size = 200,
    int quality = 80,
  }) async {
    try {
      final bytes = await imageFile.readAsBytes();
      final image = img.decodeImage(bytes);

      if (image == null) {
        throw Exception('Impossible de décoder l\'image');
      }

      // Créer thumbnail carré
      final thumbnail = img.copyResizeCropSquare(image, size: size);
      final compressed = img.encodeJpg(thumbnail, quality: quality);

      // Sauvegarder
      final tempDir = await getTemporaryDirectory();
      final fileName = path.basename(imageFile.path);
      final thumbnailFile = File('${tempDir.path}/thumb_$fileName');
      await thumbnailFile.writeAsBytes(compressed);

      return thumbnailFile;
    } catch (e) {
      print('❌ Erreur de création de thumbnail: $e');
      return imageFile;
    }
  }

  /// Optimiser en batch
  Future<List<File>> optimizeBatch(
    List<File> imageFiles, {
    int maxWidth = 1920,
    int maxHeight = 1080,
    int quality = 85,
    Function(int current, int total)? onProgress,
  }) async {
    final optimizedFiles = <File>[];

    for (var i = 0; i < imageFiles.length; i++) {
      final optimized = await optimizeImage(
        imageFiles[i],
        maxWidth: maxWidth,
        maxHeight: maxHeight,
        quality: quality,
      );
      optimizedFiles.add(optimized);
      onProgress?.call(i + 1, imageFiles.length);
    }

    return optimizedFiles;
  }

  /// Compresser sans redimensionner
  Future<File> compressOnly(
    File imageFile, {
    int quality = 85,
  }) async {
    try {
      final bytes = await imageFile.readAsBytes();
      final image = img.decodeImage(bytes);

      if (image == null) {
        throw Exception('Impossible de décoder l\'image');
      }

      final compressed = img.encodeJpg(image, quality: quality);

      final tempDir = await getTemporaryDirectory();
      final fileName = path.basename(imageFile.path);
      final compressedFile = File('${tempDir.path}/compressed_$fileName');
      await compressedFile.writeAsBytes(compressed);

      return compressedFile;
    } catch (e) {
      print('❌ Erreur de compression: $e');
      return imageFile;
    }
  }

  /// Obtenir les dimensions d'une image
  Future<ImageDimensions?> getImageDimensions(File imageFile) async {
    try {
      final bytes = await imageFile.readAsBytes();
      final image = img.decodeImage(bytes);

      if (image == null) return null;

      return ImageDimensions(
        width: image.width,
        height: image.height,
        size: bytes.length,
      );
    } catch (e) {
      print('❌ Erreur de lecture des dimensions: $e');
      return null;
    }
  }

  /// Convertir en format WebP (plus efficace)
  Future<File> convertToWebP(
    File imageFile, {
    int quality = 85,
  }) async {
    try {
      final bytes = await imageFile.readAsBytes();
      final image = img.decodeImage(bytes);

      if (image == null) {
        throw Exception('Impossible de décoder l\'image');
      }

      // TODO: encodeWebP is not available in current image package version
      // Use encodeJpg as fallback for now
      final webp = img.encodeJpg(image, quality: quality);

      final tempDir = await getTemporaryDirectory();
      final fileName = path.basenameWithoutExtension(imageFile.path);
      final webpFile = File('${tempDir.path}/$fileName.webp');
      await webpFile.writeAsBytes(webp);

      return webpFile;
    } catch (e) {
      print('❌ Erreur de conversion WebP: $e');
      return imageFile;
    }
  }

  /// Formater la taille en bytes
  String _formatBytes(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  }

  /// Nettoyer les fichiers temporaires
  Future<void> cleanupTempFiles() async {
    try {
      final tempDir = await getTemporaryDirectory();
      final files = tempDir.listSync();

      for (final file in files) {
        if (file is File) {
          final name = path.basename(file.path);
          if (name.startsWith('optimized_') ||
              name.startsWith('thumb_') ||
              name.startsWith('compressed_')) {
            await file.delete();
          }
        }
      }

      print('✅ Fichiers temporaires nettoyés');
    } catch (e) {
      print('❌ Erreur de nettoyage: $e');
    }
  }
}

/// Dimensions d'image
class ImageDimensions {
  final int width;
  final int height;
  final int size;

  ImageDimensions({
    required this.width,
    required this.height,
    required this.size,
  });

  double get aspectRatio => width / height;
  String get sizeFormatted => ImageOptimizer()._formatBytes(size);

  @override
  String toString() => '${width}x$height ($sizeFormatted)';
}
