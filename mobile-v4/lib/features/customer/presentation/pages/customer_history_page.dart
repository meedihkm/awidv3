import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../providers/customer_tracking_provider.dart';

/// Page Historique Client
class CustomerHistoryPage extends ConsumerStatefulWidget {
  final String customerId;

  const CustomerHistoryPage({
    super.key,
    required this.customerId,
  });

  @override
  ConsumerState<CustomerHistoryPage> createState() => _CustomerHistoryPageState();
}

class _CustomerHistoryPageState extends ConsumerState<CustomerHistoryPage> {
  DateTime? _startDate;
  DateTime? _endDate;

  @override
  void initState() {
    super.initState();
    // Default: last 30 days
    _endDate = DateTime.now();
    _startDate = _endDate!.subtract(const Duration(days: 30));
  }

  @override
  Widget build(BuildContext context) {
    final historyParams = DeliveryHistoryParams(
      customerId: widget.customerId,
      startDate: _startDate,
      endDate: _endDate,
      limit: 50,
    );

    final historyAsync = ref.watch(deliveriesHistoryProvider(historyParams));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Historique'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: _showFilterDialog,
          ),
        ],
      ),
      body: Column(
        children: [
          // Filter Summary
          if (_startDate != null || _endDate != null)
            Container(
              padding: const EdgeInsets.all(12),
              color: Colors.blue.shade50,
              child: Row(
                children: [
                  const Icon(Icons.date_range, size: 20, color: Colors.blue),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      '${DateFormat('dd/MM/yyyy').format(_startDate!)} - ${DateFormat('dd/MM/yyyy').format(_endDate!)}',
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                  TextButton(
                    onPressed: _clearFilters,
                    child: const Text('Effacer'),
                  ),
                ],
              ),
            ),

          // History List
          Expanded(
            child: historyAsync.when(
              data: (deliveries) {
                if (deliveries.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.history, size: 64, color: Colors.grey.shade400),
                        const SizedBox(height: 16),
                        Text(
                          'Aucune livraison trouvée',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: deliveries.length,
                  itemBuilder: (context, index) {
                    final delivery = deliveries[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: _getStatusColor(delivery.status),
                          child: Icon(
                            _getStatusIcon(delivery.status),
                            color: Colors.white,
                          ),
                        ),
                        title: Text('Livraison #${delivery.deliveryNumber}'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(DateFormat('dd/MM/yyyy HH:mm').format(delivery.scheduledDate)),
                            Text('${delivery.ordersCount} commande${delivery.ordersCount > 1 ? 's' : ''}'),
                          ],
                        ),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              delivery.totalAmountFormatted,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: _getStatusColor(delivery.status).withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                delivery.status.displayName,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: _getStatusColor(delivery.status),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          // TODO: Show delivery details
                        },
                      ),
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error_outline, size: 64, color: Colors.red),
                    const SizedBox(height: 16),
                    Text('Erreur: $error'),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        ref.refresh(deliveriesHistoryProvider(historyParams));
                      },
                      child: const Text('Réessayer'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Filtrer par période'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            OutlinedButton.icon(
              icon: const Icon(Icons.calendar_today),
              label: Text(
                _startDate != null
                    ? 'Début: ${DateFormat('dd/MM/yyyy').format(_startDate!)}'
                    : 'Sélectionner date début',
              ),
              onPressed: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: _startDate ?? DateTime.now(),
                  firstDate: DateTime(2020),
                  lastDate: DateTime.now(),
                );
                if (date != null) {
                  setState(() => _startDate = date);
                }
              },
            ),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              icon: const Icon(Icons.calendar_today),
              label: Text(
                _endDate != null
                    ? 'Fin: ${DateFormat('dd/MM/yyyy').format(_endDate!)}'
                    : 'Sélectionner date fin',
              ),
              onPressed: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: _endDate ?? DateTime.now(),
                  firstDate: _startDate ?? DateTime(2020),
                  lastDate: DateTime.now(),
                );
                if (date != null) {
                  setState(() => _endDate = date);
                }
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {}); // Trigger rebuild
            },
            child: const Text('Appliquer'),
          ),
        ],
      ),
    );
  }

  void _clearFilters() {
    setState(() {
      _startDate = DateTime.now().subtract(const Duration(days: 30));
      _endDate = DateTime.now();
    });
  }

  IconData _getStatusIcon(status) {
    switch (status.toString()) {
      case 'DeliveryStatus.completed':
        return Icons.check_circle;
      case 'DeliveryStatus.failed':
        return Icons.error;
      case 'DeliveryStatus.cancelled':
        return Icons.cancel;
      default:
        return Icons.local_shipping;
    }
  }

  Color _getStatusColor(status) {
    switch (status.toString()) {
      case 'DeliveryStatus.completed':
        return Colors.green;
      case 'DeliveryStatus.failed':
        return Colors.red;
      case 'DeliveryStatus.cancelled':
        return Colors.orange;
      default:
        return Colors.blue;
    }
  }
}
