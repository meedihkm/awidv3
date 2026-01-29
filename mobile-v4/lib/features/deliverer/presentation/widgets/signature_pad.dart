import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:signature/signature.dart';

/// Widget: Signature Pad
/// Interface pour capturer une signature électronique
class SignaturePad extends StatefulWidget {
  final Function(String signaturePath) onSignatureSaved;
  final Color penColor;
  final double penStrokeWidth;
  final Color backgroundColor;

  const SignaturePad({
    super.key,
    required this.onSignatureSaved,
    this.penColor = Colors.black,
    this.penStrokeWidth = 2.0,
    this.backgroundColor = Colors.white,
  });

  @override
  State<SignaturePad> createState() => _SignaturePadState();
}

class _SignaturePadState extends State<SignaturePad> {
  late SignatureController _signatureController;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _signatureController = SignatureController(
      penStrokeWidth: widget.penStrokeWidth,
      penColor: widget.penColor,
      exportBackgroundColor: widget.backgroundColor,
    );
  }

  @override
  void dispose() {
    _signatureController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          _buildHeader(),
          Expanded(child: _buildSignatureArea()),
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
          const Icon(Icons.draw, color: Colors.purple),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Signature du Client',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Demandez au client de signer dans la zone ci-dessous',
                  style: TextStyle(
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

  Widget _buildSignatureArea() {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300, width: 2),
        borderRadius: BorderRadius.circular(12),
        color: widget.backgroundColor,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            // Zone de signature
            Signature(
              controller: _signatureController,
              backgroundColor: widget.backgroundColor,
            ),
            
            // Indicateur de zone de signature
            if (_signatureController.isEmpty)
              const Positioned.fill(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.draw,
                        size: 48,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Signez ici',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Utilisez votre doigt pour dessiner',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            
            // Indicateur de chargement
            if (_isLoading)
              Positioned.fill(
                child: Container(
                  color: Colors.black.withOpacity(0.3),
                  child: const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(color: Colors.white),
                        SizedBox(height: 16),
                        Text(
                          'Sauvegarde de la signature...',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
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
            // Bouton Effacer
            Expanded(
              child: OutlinedButton.icon(
                onPressed: _signatureController.isNotEmpty ? _clearSignature : null,
                icon: const Icon(Icons.clear),
                label: const Text('Effacer'),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
            
            const SizedBox(width: 16),
            
            // Bouton Sauvegarder
            Expanded(
              flex: 2,
              child: ElevatedButton.icon(
                onPressed: _signatureController.isNotEmpty && !_isLoading 
                    ? _saveSignature 
                    : null,
                icon: _isLoading 
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Icon(Icons.save),
                label: Text(_isLoading ? 'Sauvegarde...' : 'Sauvegarder'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
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

  void _clearSignature() {
    setState(() {
      _signatureController.clear();
    });
  }

  Future<void> _saveSignature() async {
    if (_signatureController.isEmpty) {
      _showErrorSnackBar('Veuillez d\'abord signer');
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      // Exporter la signature en image
      final Uint8List? signature = await _signatureController.toPngBytes();
      
      if (signature == null) {
        throw Exception('Impossible d\'exporter la signature');
      }

      // Sauvegarder dans le dossier de l'app
      final appDir = await getApplicationDocumentsDirectory();
      final signaturesDir = Directory('${appDir.path}/signatures');
      
      if (!await signaturesDir.exists()) {
        await signaturesDir.create(recursive: true);
      }

      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final fileName = 'signature_$timestamp.png';
      final filePath = '${signaturesDir.path}/$fileName';

      final file = File(filePath);
      await file.writeAsBytes(signature);

      // Vérifier que le fichier a été créé
      if (!await file.exists()) {
        throw Exception('Échec de la sauvegarde du fichier');
      }

      // Callback avec le chemin du fichier
      widget.onSignatureSaved(filePath);

      // Fermer le modal
      if (mounted) {
        Navigator.of(context).pop();
      }

      // Afficher un message de succès
      _showSuccessSnackBar('Signature sauvegardée avec succès');

    } catch (error) {
      _showErrorSnackBar('Erreur lors de la sauvegarde: $error');
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _showSuccessSnackBar(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.green,
          duration: const Duration(seconds: 2),
        ),
      );
    }
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

/// Widget: Signature Preview
/// Affiche un aperçu d'une signature sauvegardée
class SignaturePreview extends StatelessWidget {
  final String signaturePath;
  final double? width;
  final double? height;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const SignaturePreview({
    super.key,
    required this.signaturePath,
    this.width,
    this.height,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height ?? 150,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Stack(
        children: [
          // Image de la signature
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.file(
                File(signaturePath),
                fit: BoxFit.contain,
              ),
            ),
          ),
          
          // Actions
          if (onEdit != null || onDelete != null)
            Positioned(
              top: 8,
              right: 8,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (onEdit != null)
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: onEdit,
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 18,
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 32,
                          minHeight: 32,
                        ),
                      ),
                    ),
                  
                  if (onEdit != null && onDelete != null)
                    const SizedBox(width: 8),
                  
                  if (onDelete != null)
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: onDelete,
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.white,
                          size: 18,
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 32,
                          minHeight: 32,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          
          // Indicateur de signature valide
          Positioned(
            bottom: 8,
            left: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.check_circle,
                    color: Colors.white,
                    size: 16,
                  ),
                  SizedBox(width: 4),
                  Text(
                    'Signée',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}