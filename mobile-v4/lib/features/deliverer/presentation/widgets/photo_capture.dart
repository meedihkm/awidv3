import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../providers/camera_provider.dart';

/// Widget: Photo Capture
/// Interface pour capturer des photos de preuve de livraison
class PhotoCapture extends ConsumerStatefulWidget {
  final Function(List<String> photosPaths) onPhotosTaken;
  final int maxPhotos;
  final List<String> existingPhotos;

  const PhotoCapture({
    super.key,
    required this.onPhotosTaken,
    this.maxPhotos = 5,
    this.existingPhotos = const [],
  });

  @override
  ConsumerState<PhotoCapture> createState() => _PhotoCaptureState();
}

class _PhotoCaptureState extends ConsumerState<PhotoCapture> {
  List<String> _selectedPhotos = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _selectedPhotos = List.from(widget.existingPhotos);
  }

  @override
  Widget build(BuildContext context) {
    final cameraState = ref.watch(cameraProvider);

    // Écouter les changements d'état de la caméra
    ref.listen<CameraState>(cameraProvider, (previous, next) {
      if (next is _PhotoTaken) {
        setState(() {
          if (next.imagePath != null) {
            _selectedPhotos.add(next.imagePath);
          }
          _isLoading = false;
        });
        ref.read(cameraProvider.notifier).resetState();
      } else if (next is _MultiplePhotosTaken) {
        setState(() {
          if (next.imagePaths != null) {
            _selectedPhotos.addAll(next.imagePaths);
          }
          _isLoading = false;
        });
        ref.read(cameraProvider.notifier).resetState();
      } else if (next is _Loading) {
        setState(() {
          _isLoading = true;
        });
      } else if (next is _Error) {
        setState(() {
          _isLoading = false;
        });
        _showErrorSnackBar(next.message);
        ref.read(cameraProvider.notifier).resetState();
      } else if (next is _Cancelled) {
        setState(() {
          _isLoading = false;
        });
        ref.read(cameraProvider.notifier).resetState();
      } else {
        setState(() {
          _isLoading = false;
        });
      }
    });

    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          _buildHeader(),
          Expanded(child: _buildContent()),
          _buildActions(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade200),
        ),
      ),
      child: Row(
        children: [
          const Icon(Icons.camera_alt, color: Colors.orange),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Photos de Livraison',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Ajoutez des photos du produit et du lieu de livraison (${_selectedPhotos.length}/${widget.maxPhotos})',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.close),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    if (_isLoading) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Traitement de la photo...'),
          ],
        ),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildPhotoOptions(),
          const SizedBox(height: 24),
          if (_selectedPhotos.isNotEmpty) ...[
            _buildSelectedPhotos(),
            const SizedBox(height: 24),
          ],
          _buildPhotoGuidelines(),
        ],
      ),
    );
  }

  Widget _buildPhotoOptions() {
    final canAddMore = _selectedPhotos.length < widget.maxPhotos;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Ajouter des Photos',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        
        // Option Caméra
        Card(
          child: ListTile(
            leading: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.camera_alt, color: Colors.blue),
            ),
            title: const Text('Prendre une Photo'),
            subtitle: const Text('Utiliser l\'appareil photo'),
            trailing: canAddMore 
                ? const Icon(Icons.arrow_forward_ios, size: 16)
                : const Icon(Icons.block, color: Colors.grey),
            onTap: canAddMore ? _takePhoto : null,
            enabled: canAddMore && !_isLoading,
          ),
        ),
        
        const SizedBox(height: 8),
        
        // Option Galerie
        Card(
          child: ListTile(
            leading: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.photo_library, color: Colors.green),
            ),
            title: const Text('Choisir depuis la Galerie'),
            subtitle: const Text('Sélectionner des photos existantes'),
            trailing: canAddMore 
                ? const Icon(Icons.arrow_forward_ios, size: 16)
                : const Icon(Icons.block, color: Colors.grey),
            onTap: canAddMore ? _pickFromGallery : null,
            enabled: canAddMore && !_isLoading,
          ),
        ),
        
        const SizedBox(height: 8),
        
        // Option Multiple
        if (widget.maxPhotos - _selectedPhotos.length > 1)
          Card(
            child: ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.purple.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.photo_library_outlined, color: Colors.purple),
              ),
              title: const Text('Sélection Multiple'),
              subtitle: Text('Choisir jusqu\'à ${widget.maxPhotos - _selectedPhotos.length} photos'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: !_isLoading ? _pickMultipleFromGallery : null,
              enabled: !_isLoading,
            ),
          ),
      ],
    );
  }

  Widget _buildSelectedPhotos() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Photos Sélectionnées (${_selectedPhotos.length})',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 1,
          ),
          itemCount: _selectedPhotos.length,
          itemBuilder: (context, index) {
            return _buildPhotoItem(_selectedPhotos[index], index);
          },
        ),
      ],
    );
  }

  Widget _buildPhotoItem(String photoPath, int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Stack(
        children: [
          // Image
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.file(
                File(photoPath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          
          // Bouton supprimer
          Positioned(
            top: 8,
            right: 8,
            child: GestureDetector(
              onTap: () => _removePhoto(index),
              child: Container(
                width: 28,
                height: 28,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ),
          ),
          
          // Numéro de la photo
          Positioned(
            bottom: 8,
            left: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '${index + 1}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhotoGuidelines() {
    return Card(
      color: Colors.blue.shade50,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.info, color: Colors.blue.shade700),
                const SizedBox(width: 8),
                Text(
                  'Conseils pour de Bonnes Photos',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade700,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _buildGuideline('📦', 'Photographiez clairement les produits livrés'),
            _buildGuideline('📍', 'Incluez le lieu de livraison (porte, enseigne)'),
            _buildGuideline('💡', 'Assurez-vous d\'avoir un bon éclairage'),
            _buildGuideline('📱', 'Tenez le téléphone stable pour éviter le flou'),
            _buildGuideline('🔍', 'Vérifiez que les détails sont lisibles'),
          ],
        ),
      ),
    );
  }

  Widget _buildGuideline(String emoji, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 16)),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActions() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        border: Border(
          top: BorderSide(color: Colors.grey.shade200),
        ),
      ),
      child: SafeArea(
        child: Row(
          children: [
            // Bouton Annuler
            Expanded(
              child: OutlinedButton(
                onPressed: _isLoading ? null : () => Navigator.of(context).pop(),
                child: const Text('Annuler'),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
            
            const SizedBox(width: 16),
            
            // Bouton Confirmer
            Expanded(
              flex: 2,
              child: ElevatedButton.icon(
                onPressed: _selectedPhotos.isNotEmpty && !_isLoading 
                    ? _confirmPhotos 
                    : null,
                icon: const Icon(Icons.check),
                label: Text('Confirmer (${_selectedPhotos.length})'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _takePhoto() async {
    await ref.read(cameraProvider.notifier).takePhoto(
      source: ImageSource.camera,
      imageQuality: 85,
    );
  }

  Future<void> _pickFromGallery() async {
    await ref.read(cameraProvider.notifier).pickFromGallery(
      imageQuality: 85,
    );
  }

  Future<void> _pickMultipleFromGallery() async {
    final remainingSlots = widget.maxPhotos - _selectedPhotos.length;
    await ref.read(cameraProvider.notifier).pickMultipleFromGallery(
      maxImages: remainingSlots,
      imageQuality: 85,
    );
  }

  void _removePhoto(int index) {
    setState(() {
      _selectedPhotos.removeAt(index);
    });
  }

  void _confirmPhotos() {
    widget.onPhotosTaken(_selectedPhotos);
    Navigator.of(context).pop();
  }

  void _showErrorSnackBar(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }
}

/// Widget: Photo Preview Grid
/// Affiche une grille de photos avec options d'édition
class PhotoPreviewGrid extends StatelessWidget {
  final List<String> photosPaths;
  final Function(int index)? onRemovePhoto;
  final Function(int index)? onViewPhoto;
  final int maxPhotos;

  const PhotoPreviewGrid({
    super.key,
    required this.photosPaths,
    this.onRemovePhoto,
    this.onViewPhoto,
    this.maxPhotos = 5,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.photo_library, color: Colors.orange),
            const SizedBox(width: 8),
            Text(
              'Photos (${photosPaths.length}/$maxPhotos)',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        if (photosPaths.isEmpty)
          Container(
            width: double.infinity,
            height: 120,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey.shade50,
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.photo_camera,
                  size: 32,
                  color: Colors.grey,
                ),
                SizedBox(height: 8),
                Text(
                  'Aucune photo ajoutée',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          )
        else
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 1,
            ),
            itemCount: photosPaths.length,
            itemBuilder: (context, index) {
              return _buildPhotoItem(context, photosPaths[index], index);
            },
          ),
      ],
    );
  }

  Widget _buildPhotoItem(BuildContext context, String photoPath, int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Stack(
        children: [
          // Image
          Positioned.fill(
            child: GestureDetector(
              onTap: () => onViewPhoto?.call(index),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.file(
                  File(photoPath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          
          // Bouton supprimer
          if (onRemovePhoto != null)
            Positioned(
              top: 4,
              right: 4,
              child: GestureDetector(
                onTap: () => onRemovePhoto!(index),
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
            ),
          
          // Numéro de la photo
          Positioned(
            bottom: 4,
            left: 4,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '${index + 1}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}