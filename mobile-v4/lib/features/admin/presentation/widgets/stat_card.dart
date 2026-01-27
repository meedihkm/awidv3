import 'package:flutter/material.dart';

import '../../../../core/config/theme_config.dart';

/// Stat Card Widget
/// Carte de statistique pour le dashboard
class StatCard extends StatelessWidget {
  const StatCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
    super.key,
    this.subtitle,
    this.onTap,
  });
  final String title;
  final String value;
  final IconData icon;
  final Color color;
  final String? subtitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(icon, color: color, size: 32),
                  if (onTap != null) Icon(Icons.arrow_forward_ios, size: 16, color: ThemeConfig.textSecondaryColor),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: ThemeConfig.textSecondaryColor),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: Theme.of(context).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold, color: color),
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 4),
                Text(
                  subtitle!,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(color: ThemeConfig.textSecondaryColor),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
