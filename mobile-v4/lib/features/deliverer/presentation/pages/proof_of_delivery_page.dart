import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../domain/usecases/complete_delivery_usecase.dart';
import '../providers/delivery_actions_provider.dart';
import '../providers/camera_provider.dart';
import '../widgets/signature_pad.dart';
import '../widgets/photo_capture.dart';

/// Page: Preuve de Livraison
/// Interface pour enregistrer la preuve de livraison complète
class ProofOfDeliveryPage extends ConsumerStatefulWidget {
  final String deliveryId;
  final String delivererId;
  final String customerId;
  final String customerName;

  const ProofOfDeliveryPage({
    super.key,
    required this.deliveryId,
    required this.delivererId,
    required this.customerId,
    required this.customerName,
  });

  @override
  ConsumerState<ProofOfDeliveryPage> createState() => _ProofOfDeliveryPageState();
}

class _ProofOfDeliveryPageState extends ConsumerState<ProofOfDeliveryPage> {
  final _formKey = GlobalKey<FormState>();
  final _signatoryController = TextEditingController();
  final _notesController = TextEditingController();
  final _feedbackController = TextEditingController();

  String? _signaturePath;
  List<String> _photosPaths = [];
  Position? _currentPosition;
  bool _isGettingLocation = false;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  void dispose() {
    _signatoryController.dispose();
    _notesController.dispose();
    _feedbackController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final actionsState = ref.watch(deliveryActionsProvider);
    final cameraState = ref.watch(cameraProvider);

    // Écouter les changements d'état
    ref.listen<DeliveryActionsState>(deliveryActionsProvider, (previous, next) {
      if (next is DeliveryCompleted) {
        _showSuccessDialog(next.proofId, next.completedAt);
      } else if (next is DeliveryActionsError) {
        _showErrorDialog(next.message);
      }
    });

    ref.listen<CameraState>(cameraProvider, (previous, next) {
      if (next is _PhotoTaken) {
        setState(() {
          if (next.imagePath != null) {
            _photosPaths.add(next.imagePath);
          }
        });
        ref.read(cameraProvider.notifier).resetState();
      } else if (next is _MultiplePhotosTaken) {
        setState(() {
          if (next.imagePaths != null) {
            _photosPaths.addAll(next.imagePaths);
          }
        });
        ref.read(cameraProvider.notifier).resetState();
      } else if (next is _Error) {
        _showErrorSnackBar(next.message);
        ref.read(cameraProvider.notifier).resetState();
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Preuve de Livraison'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: actionsState is Loading
          ? const LoadingWidget(message: 'Finalisation de la livraison...')
          : _buildBody(),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDeliveryInfo(),
            const SizedBox(height: 24),
            _buildLocationSection(),
            const SizedBox(height: 24),
            _buildSignatorySection(),
            const SizedBox(height: 24),
            _buildSignatureSection(),
            const SizedBox(height: 24),
            _buildPhotosSection(),
            const SizedBox(height: 24),
            _buildNotesSection(),
            const SizedBox(height: 24),
            _buildFeedbackSection(),
            const SizedBox(height: 100), // Espace pour le bottom bar
          ],
        ),
      ),
    );
  }

  Widget _buildDeliveryInfo() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Informations de Livraison',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            _buildInfoRow('Client', widget.customerName),
            _buildInfoRow('Livraison', '#${widget.deliveryId}'),
            _buildInfoRow('Livreur', widget.delivererId),
            _buildInfoRow('Date', DateTime.now().toString().substring(0, 16)),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              '$label:',
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }

  Widget _buildLocationSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.location_on, color: Colors.red),
                const SizedBox(width: 8),
                Text(
                  'Géolocalisation',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                if (_isGettingLocation)
                  const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                else
                  IconButton(
                    icon: const Icon(Icons.refresh),
                    onPressed: _getCurrentLocation,
                  ),
              ],
            ),
            const SizedBox(height: 12),
            if (_currentPosition != null) ...[
              Text('Latitude: ${_currentPosition!.latitude.toStringAsFixed(6)}'),
              Text('Longitude: ${_currentPosition!.longitude.toStringAsFixed(6)}'),
              Text('Précision: ${_currentPosition!.accuracy.toStringAsFixed(1)}m'),
            ] else ...[
              const Text(
                'Position non disponible',
                style: TextStyle(color: Colors.orange),
              ),
              const SizedBox(height: 8),
              TextButton.icon(
                onPressed: _getCurrentLocation,
                icon: const Icon(Icons.location_searching),
                label: const Text('Obtenir la position'),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildSignatorySection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.person, color: Colors.blue),
                const SizedBox(width: 8),
                Text(
                  'Signataire',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _signatoryController,
              decoration: const InputDecoration(
                labelText: 'Nom du signataire *',
                hintText: 'Nom de la personne qui reçoit',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person_outline),
              ),
              validator: (value) {
                if (value?.trim().isEmpty ?? true) {
                  return 'Le nom du signataire est requis';
                }
                return null;
              },
              textCapitalization: TextCapitalization.words,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSignatureSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.draw, color: Colors.purple),
                const SizedBox(width: 8),
                Text(
                  'Signature',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                if (_signaturePath != null)
                  const Icon(Icons.check_circle, color: Colors.green),
              ],
            ),
            const SizedBox(height: 12),
            if (_signaturePath != null) ...[
              Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.file(
                    File(_signaturePath!),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  TextButton.icon(
                    onPressed: _clearSignature,
                    icon: const Icon(Icons.clear),
                    label: const Text('Effacer'),
                  ),
                  const Spacer(),
                  TextButton.icon(
                    onPressed: _captureSignature,
                    icon: const Icon(Icons.edit),
                    label: const Text('Modifier'),
                  ),
                ],
              ),
            ] else ...[
              Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey.shade50,
                ),
                child: InkWell(
                  onTap: _captureSignature,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.draw,
                        size: 48,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Appuyez pour signer',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildPhotosSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.camera_alt, color: Colors.orange),
                const SizedBox(width: 8),
                Text(
                  'Photos',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Text(
                  '${_photosPaths.length}/5',
                  style: TextStyle(
                    color: _photosPaths.isEmpty ? Colors.red : Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (_photosPaths.isNotEmpty) ...[
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _photosPaths.length + 1,
                  itemBuilder: (context, index) {
                    if (index == _photosPaths.length) {
                      return _buildAddPhotoButton();
                    }
                    return _buildPhotoItem(_photosPaths[index], index);
                  },
                ),
              ),
            ] else ...[
              Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey.shade50,
                ),
                child: InkWell(
                  onTap: _showPhotoOptions,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_a_photo,
                        size: 32,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Ajouter des photos *',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
            const SizedBox(height: 8),
            const Text(
              'Minimum 2 photos requises (produit + lieu)',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddPhotoButton() {
    return Container(
      width: 100,
      height: 100,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey.shade50,
      ),
      child: InkWell(
        onTap: _photosPaths.length < 5 ? _showPhotoOptions : null,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add,
              size: 24,
              color: Colors.grey,
            ),
            SizedBox(height: 4),
            Text(
              'Ajouter',
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhotoItem(String photoPath, int index) {
    return Container(
      width: 100,
      height: 100,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.file(
              File(photoPath),
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 4,
            right: 4,
            child: GestureDetector(
              onTap: () => _removePhoto(index),
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
        ],
      ),
    );
  }

  Widget _buildNotesSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.note, color: Colors.teal),
                const SizedBox(width: 8),
                Text(
                  'Notes (optionnel)',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _notesController,
              decoration: const InputDecoration(
                labelText: 'Notes de livraison',
                hintText: 'Remarques particulières...',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.note_outlined),
              ),
              maxLines: 3,
              textCapitalization: TextCapitalization.sentences,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeedbackSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.feedback, color: Colors.indigo),
                const SizedBox(width: 8),
                Text(
                  'Feedback Client (optionnel)',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _feedbackController,
              decoration: const InputDecoration(
                labelText: 'Commentaire du client',
                hintText: 'Satisfaction, remarques...',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.feedback_outlined),
              ),
              maxLines: 2,
              textCapitalization: TextCapitalization.sentences,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomBar() {
    final isValid = _isFormValid();
    
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: CustomButton(
          text: 'Finaliser la Livraison',
          onPressed: isValid ? _completeDelivery : null,
          backgroundColor: Colors.green,
          icon: Icons.check_circle,
        ),
      ),
    );
  }

  bool _isFormValid() {
    return _signatoryController.text.trim().isNotEmpty &&
           _signaturePath != null &&
           _photosPaths.length >= 2 &&
           _currentPosition != null;
  }

  Future<void> _getCurrentLocation() async {
    setState(() {
      _isGettingLocation = true;
    });

    try {
      final permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        final requestedPermission = await Geolocator.requestPermission();
        if (requestedPermission == LocationPermission.denied) {
          _showErrorSnackBar('Permission de localisation refusée');
          return;
        }
      }

      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      setState(() {
        _currentPosition = position;
      });
    } catch (error) {
      _showErrorSnackBar('Erreur lors de la géolocalisation: $error');
    } finally {
      setState(() {
        _isGettingLocation = false;
      });
    }
  }

  void _captureSignature() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => SignaturePad(
        onSignatureSaved: (signaturePath) {
          setState(() {
            _signaturePath = signaturePath;
          });
        },
      ),
    );
  }

  void _clearSignature() {
    setState(() {
      _signaturePath = null;
    });
  }

  void _showPhotoOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) => PhotoCapture(
        maxPhotos: 5 - _photosPaths.length,
        onPhotosTaken: (photosPaths) {
          setState(() {
            _photosPaths.addAll(photosPaths);
          });
        },
      ),
    );
  }

  void _removePhoto(int index) {
    setState(() {
      _photosPaths.removeAt(index);
    });
  }

  Future<void> _completeDelivery() async {
    if (!_formKey.currentState!.validate() || !_isFormValid()) {
      return;
    }

    final params = CompleteDeliveryParams(
      deliveryId: widget.deliveryId,
      delivererId: widget.delivererId,
      customerId: widget.customerId,
      latitude: _currentPosition!.latitude,
      longitude: _currentPosition!.longitude,
      signatoryName: _signatoryController.text.trim(),
      signatureImagePath: _signaturePath!,
      photosPaths: _photosPaths,
      notes: _notesController.text.trim().isNotEmpty 
          ? _notesController.text.trim() 
          : null,
      customerFeedback: _feedbackController.text.trim().isNotEmpty 
          ? _feedbackController.text.trim() 
          : null,
    );

    await ref.read(deliveryActionsProvider.notifier).completeDelivery(params);
  }

  void _showSuccessDialog(String proofId, DateTime completedAt) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.check_circle,
          color: Colors.green,
          size: 64,
        ),
        title: const Text('Livraison Finalisée'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('La preuve de livraison a été enregistrée avec succès.'),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Text('ID Preuve: $proofId'),
                  Text('Heure: ${completedAt.toString().substring(11, 16)}'),
                ],
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              context.pop();
            },
            child: const Text('Retour'),
          ),
        ],
      ),
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 48,
        ),
        title: const Text('Erreur'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }
}