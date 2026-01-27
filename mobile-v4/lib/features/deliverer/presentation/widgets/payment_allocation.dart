import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../domain/usecases/collect_payment_usecase.dart';

/// Widget pour l'allocation manuelle des paiements
class PaymentAllocationWidget extends StatefulWidget {
  final List<UnpaidOrder> unpaidOrders;
  final double totalAmount;
  final Function(List<ManualAllocation>) onAllocationsChanged;

  const PaymentAllocationWidget({
    super.key,
    required this.unpaidOrders,
    required this.totalAmount,
    required this.onAllocationsChanged,
  });

  @override
  State<PaymentAllocationWidget> createState() => _PaymentAllocationWidgetState();
}

class _PaymentAllocationWidgetState extends State<PaymentAllocationWidget> {
  final Map<String, TextEditingController> _controllers = {};
  final Map<String, bool> _selectedOrders = {};

  @override
  void initState() {
    super.initState();
    for (var order in widget.unpaidOrders) {
      _controllers[order.orderId] = TextEditingController();
      _selectedOrders[order.orderId] = false;
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final allocatedAmount = _calculateAllocatedAmount();
    final remainingAmount = widget.totalAmount - allocatedAmount;

    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Allocation Manuelle',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Montant à allouer:'),
                    Text(
                      NumberFormat.currency(symbol: '€').format(widget.totalAmount),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Montant alloué:'),
                    Text(
                      NumberFormat.currency(symbol: '€').format(allocatedAmount),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: allocatedAmount > widget.totalAmount ? Colors.red : Colors.green,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Reste à allouer:'),
                    Text(
                      NumberFormat.currency(symbol: '€').format(remainingAmount),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: remainingAmount < 0 ? Colors.red : Colors.orange,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.unpaidOrders.length,
            separatorBuilder: (context, index) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final order = widget.unpaidOrders[index];
              return _buildOrderTile(order);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildOrderTile(UnpaidOrder order) {
    final isSelected = _selectedOrders[order.orderId] ?? false;
    final controller = _controllers[order.orderId]!;

    return CheckboxListTile(
      value: isSelected,
      onChanged: (value) {
        setState(() {
          _selectedOrders[order.orderId] = value ?? false;
          if (!value!) {
            controller.clear();
          }
          _notifyAllocationsChanged();
        });
      },
      title: Text('Commande #${order.orderNumber}'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Date: ${DateFormat('dd/MM/yyyy').format(order.orderDate)}'),
          Text(
            'Montant dû: ${NumberFormat.currency(symbol: '€').format(order.remainingAmount)}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          if (isSelected) ...[
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller,
                    decoration: InputDecoration(
                      labelText: 'Montant à payer',
                      suffixText: '€',
                      border: const OutlineInputBorder(),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                    ),
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    onChanged: (value) {
                      setState(() {
                        _notifyAllocationsChanged();
                      });
                    },
                  ),
                ),
                const SizedBox(width: 8),
                TextButton(
                  onPressed: () {
                    controller.text = order.remainingAmount.toStringAsFixed(2);
                    setState(() {
                      _notifyAllocationsChanged();
                    });
                  },
                  child: const Text('Total'),
                ),
              ],
            ),
          ],
        ],
      ),
      controlAffinity: ListTileControlAffinity.leading,
    );
  }

  double _calculateAllocatedAmount() {
    double total = 0;
    for (var entry in _selectedOrders.entries) {
      if (entry.value) {
        final controller = _controllers[entry.key]!;
        final amount = double.tryParse(controller.text) ?? 0;
        total += amount;
      }
    }
    return total;
  }

  void _notifyAllocationsChanged() {
    final allocations = <ManualAllocation>[];
    
    for (var entry in _selectedOrders.entries) {
      if (entry.value) {
        final orderId = entry.key;
        final controller = _controllers[orderId]!;
        final amount = double.tryParse(controller.text) ?? 0;
        
        if (amount > 0) {
          allocations.add(ManualAllocation(
            orderId: orderId,
            amount: amount,
          ));
        }
      }
    }
    
    widget.onAllocationsChanged(allocations);
  }
}
