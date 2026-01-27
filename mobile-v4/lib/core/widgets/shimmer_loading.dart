import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

/// Widget de chargement avec effet shimmer
class ShimmerLoading extends StatelessWidget {
  final double width;
  final double height;
  final BorderRadius? borderRadius;

  const ShimmerLoading({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: borderRadius ?? BorderRadius.circular(4),
        ),
      ),
    );
  }
}

/// Shimmer pour une carte
class ShimmerCard extends StatelessWidget {
  const ShimmerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ShimmerLoading(width: 150, height: 20),
            const SizedBox(height: 8),
            const ShimmerLoading(width: double.infinity, height: 16),
            const SizedBox(height: 8),
            const ShimmerLoading(width: double.infinity, height: 16),
            const SizedBox(height: 8),
            Row(
              children: [
                const ShimmerLoading(width: 80, height: 30),
                const Spacer(),
                ShimmerLoading(
                  width: 40,
                  height: 40,
                  borderRadius: BorderRadius.circular(20),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Shimmer pour une liste
class ShimmerList extends StatelessWidget {
  final int itemCount;

  const ShimmerList({super.key, this.itemCount = 5});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemCount,
      itemBuilder: (context, index) => const ShimmerCard(),
    );
  }
}

/// Shimmer pour un ListTile
class ShimmerListTile extends StatelessWidget {
  const ShimmerListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ShimmerLoading(
        width: 48,
        height: 48,
        borderRadius: BorderRadius.circular(24),
      ),
      title: const ShimmerLoading(width: 150, height: 16),
      subtitle: const Padding(
        padding: EdgeInsets.only(top: 8),
        child: ShimmerLoading(width: 100, height: 14),
      ),
    );
  }
}
