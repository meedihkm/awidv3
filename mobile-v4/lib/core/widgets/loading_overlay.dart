import 'package:flutter/material.dart';

/// Overlay de chargement
class LoadingOverlay extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  final String? message;
  final Color? backgroundColor;

  const LoadingOverlay({
    super.key,
    required this.isLoading,
    required this.child,
    this.message,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading)
          Container(
            color: (backgroundColor ?? Colors.black).withOpacity(0.5),
            child: Center(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CircularProgressIndicator(),
                      if (message != null) ...[
                        const SizedBox(height: 16),
                        Text(
                          message!,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

/// Overlay de chargement avec progression
class ProgressLoadingOverlay extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  final double? progress;
  final String? message;

  const ProgressLoadingOverlay({
    super.key,
    required this.isLoading,
    required this.child,
    this.progress,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading)
          Container(
            color: Colors.black.withOpacity(0.5),
            child: Center(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (progress != null)
                        CircularProgressIndicator(value: progress)
                      else
                        const CircularProgressIndicator(),
                      if (message != null) ...[
                        const SizedBox(height: 16),
                        Text(
                          message!,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                      if (progress != null) ...[
                        const SizedBox(height: 8),
                        Text(
                          '${(progress! * 100).toInt()}%',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

/// Fonction helper pour afficher un loading overlay
void showLoadingOverlay(
  BuildContext context, {
  String? message,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => WillPopScope(
      onWillPop: () async => false,
      child: Center(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(),
                if (message != null) ...[
                  const SizedBox(height: 16),
                  Text(message),
                ],
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

/// Fonction helper pour cacher le loading overlay
void hideLoadingOverlay(BuildContext context) {
  Navigator.of(context).pop();
}
