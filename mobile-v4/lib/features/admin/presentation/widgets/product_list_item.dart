import 'package:flutter/material.dart';

import '../../../../core/utils/formatters.dart';
import '../../domain/entities/product.dart';

/// Product List Item Widget
/// Widget pour afficher un produit dans une liste
class ProductListItem extends StatelessWidget {
  const ProductListItem({required this.product, this.onTap, this.onDelete, super.key});

  final Product product;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;

  Color _getAvailabilityColor() {
    if (!product.isAvailable) return Colors.grey;
    if (product.stockQuantity == null) return Colors.green;
    if (product.stockQuantity! == 0) return Colors.red;
    if (product.isLowStock) return Colors.orange;
    return Colors.green;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: product.imageUrl != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  product.imageUrl!,
                  width: 56,
                  height: 56,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(8)),
                      child: const Icon(Icons.image_not_supported),
                    );
                  },
                ),
              )
            : Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(8)),
                child: const Icon(Icons.inventory_2),
              ),
        title: Text(product.name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(product.category),
            const SizedBox(height: 4),
            Row(
              children: [
                Text(
                  Formatters.currency(product.price),
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
                ),
                const SizedBox(width: 8),
                if (product.stockQuantity != null) ...[
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: _getAvailabilityColor().withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'Stock: ${product.stockQuantity}',
                      style: TextStyle(fontSize: 12, color: _getAvailabilityColor(), fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 4),
            Wrap(
              spacing: 4,
              children: [
                Chip(
                  label: Text(
                    product.isAvailable ? 'Disponible' : 'Indisponible',
                    style: const TextStyle(fontSize: 11),
                  ),
                  backgroundColor: product.isAvailable ? Colors.green.withOpacity(0.2) : Colors.red.withOpacity(0.2),
                  padding: EdgeInsets.zero,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                if (product.isLowStock)
                  Chip(
                    label: const Text('Stock faible', style: TextStyle(fontSize: 11)),
                    backgroundColor: Colors.orange.withOpacity(0.2),
                    padding: EdgeInsets.zero,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
              ],
            ),
          ],
        ),
        trailing: onDelete != null
            ? IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: onDelete,
              )
            : null,
        onTap: onTap,
        isThreeLine: true,
      ),
    );
  }
}
