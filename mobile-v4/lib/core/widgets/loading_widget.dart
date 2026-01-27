import 'package:flutter/material.dart';

import '../config/theme_config.dart';

/// Loading Widget
/// Widget de chargement réutilisable
class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, this.message, this.size = 40.0});
  final String? message;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: size,
            height: size,
            child: const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(ThemeConfig.primaryColor)),
          ),
          if (message != null) ...[
            const SizedBox(height: 16),
            Text(
              message!,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: ThemeConfig.textSecondaryColor),
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }
}

/// Small Loading Indicator
class SmallLoadingIndicator extends StatelessWidget {
  const SmallLoadingIndicator({super.key, this.color});
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 20,
      height: 20,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation<Color>(color ?? ThemeConfig.primaryColor),
      ),
    );
  }
}
