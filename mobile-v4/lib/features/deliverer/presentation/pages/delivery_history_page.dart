import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../providers/delivery_actions_provider.dart';

/// Page d'historique des livraisons
class DeliveryHistoryPage extends ConsumerStatefulWidget {
  final String delivererId;

  const DeliveryHistoryPage({
    super.key,
    required this.delivererId,
  });

  @override
  ConsumerState<DeliveryHistoryPage> createState() => _DeliveryHistoryPageState();
}

class _DeliveryHistoryPageState extends ConsumerState<DeliveryHistoryPage> {
  DateTime? _startDate;
  DateTime? _endDate;
  String? _selectedStatus;
  String? _selectedCustomerId;

  final List<String> _statusOptions = [
    'Tous',
    'completed',
    'cancelled',
    'failed',
  ];

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
      delivererId: widget.delivererId,
      startDate: _startDate,
      endDate: _endDate,
      status: _selectedStatus,
      customerId: _selectedCustomerId,
      limit: 50,
      offset: 0,
    );

    final historyAsync = ref.watch(deliveryHistoryProvider(historyParams));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Historique Livraisons'),
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
          if (_startDate != null || _endDate != null || _selectedStatus != null)
            Container(
              padding: const EdgeInsets.all(12),
              color: Colors.blue.shade50,
              child: Row(
                children: [
                  const Icon(Icons.filter_alt, size: 20, color: Colors.blue),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      _buildFilterSummary(),
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
                      onPressed: () => ref.refresh(deliveryHistoryProvider(historyParams)),
                      child: const Text('Réessayer'),
                    ),
                  ],
                ),
              ),
              data: (history) {
                if (history.isEmpty) {
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

                return RefreshIndicator(
                  onRefresh: () async {
                    ref.refresh(deliveryHistoryProvider(historyParams));
                  },
                  child: ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: history.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final item = history[index];
                      return _buildHistoryCard(item);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHistoryCard(DeliveryHistoryItem item) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: () => _showDeliveryDetails(item),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Livraison #${item.deliveryNumber}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  _buildStatusChip(item.status),
                ],
              ),
              const SizedBox(height: 12),

              // Customer
              Row(
                children: [
                  const Icon(Icons.person, size: 18, color: Colors.grey),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      item.customerName,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Date
              Row(
                children: [
                  const Icon(Icons.calendar_today, size: 18, color: Colors.grey),
                  const SizedBox(width: 8),
                  Text(DateFormat('dd/MM/yyyy HH:mm').format(item.deliveryDate)),
                ],
              ),
              const SizedBox(height: 8),

              // Address
              Row(
                children: [
                  const Icon(Icons.location_on, size: 18, color: Colors.grey),
                  const SizedBox(width: 8),
                  Expanded(child: Text(item.deliveryAddress)),
                ],
              ),
              const SizedBox(height: 12),

              // Stats
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStatItem(
                    Icons.shopping_bag,
                    '${item.orderCount}',
                    'Commandes',
                  ),
                  _buildStatItem(
                    Icons.euro,
                    NumberFormat.currency(symbol: '€', decimalDigits: 0).format(item.totalAmount),
                    'Montant',
                  ),
                  if (item.paymentCollected != null)
                    _buildStatItem(
                      Icons.payment,
                      NumberFormat.currency(symbol: '€', decimalDigits: 0).format(item.paymentCollected),
                      'Encaissé',
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusChip(String status) {
    Color color;
    String label;

    switch (status.toLowerCase()) {
      case 'completed':
        color = Colors.green;
        label = 'Livrée';
        break;
      case 'cancelled':
        color = Colors.orange;
        label = 'Annulée';
        break;
      case 'failed':
        color = Colors.red;
        label = 'Échec';
        break;
      default:
        color = Colors.grey;
        label = status;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _buildStatItem(IconData icon, String value, String label) {
    return Column(
      children: [
        Icon(icon, size: 20, color: Colors.blue),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }

  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Filtres'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Date Range
              const Text('Période', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      icon: const Icon(Icons.calendar_today, size: 18),
                      label: Text(
                        _startDate != null
                            ? DateFormat('dd/MM/yyyy').format(_startDate!)
                            : 'Début',
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
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: OutlinedButton.icon(
                      icon: const Icon(Icons.calendar_today, size: 18),
                      label: Text(
                        _endDate != null
                            ? DateFormat('dd/MM/yyyy').format(_endDate!)
                            : 'Fin',
                      ),
                      onPressed: () async {
                        final date = await showDatePicker(
                          context: context,
                          initialDate: _endDate ?? DateTime.now(),
                          firstDate: DateTime(2020),
                          lastDate: DateTime.now(),
                        );
                        if (date != null) {
                          setState(() => _endDate = date);
                        }
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Status
              const Text('Statut', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: _selectedStatus,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
                items: _statusOptions.map((status) {
                  return DropdownMenuItem(
                    value: status == 'Tous' ? null : status,
                    child: Text(status),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() => _selectedStatus = value);
                },
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {}); // Trigger rebuild with new filters
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
      _selectedStatus = null;
      _selectedCustomerId = null;
    });
  }

  String _buildFilterSummary() {
    final parts = <String>[];

    if (_startDate != null && _endDate != null) {
      parts.add('${DateFormat('dd/MM').format(_startDate!)} - ${DateFormat('dd/MM').format(_endDate!)}');
    }

    if (_selectedStatus != null) {
      parts.add('Statut: $_selectedStatus');
    }

    return parts.join(' • ');
  }

  void _showDeliveryDetails(DeliveryHistoryItem item) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        expand: false,
        builder: (context, scrollController) => Container(
          padding: const EdgeInsets.all(24),
          child: ListView(
            controller: scrollController,
            children: [
              Text(
                'Détails Livraison',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const Divider(height: 32),
              _buildDetailRow('Numéro', '#${item.deliveryNumber}'),
              _buildDetailRow('Client', item.customerName),
              _buildDetailRow('Date', DateFormat('dd/MM/yyyy HH:mm').format(item.deliveryDate)),
              _buildDetailRow('Adresse', item.deliveryAddress),
              _buildDetailRow('Commandes', '${item.orderCount}'),
              _buildDetailRow('Montant total', NumberFormat.currency(symbol: '€').format(item.totalAmount)),
              if (item.paymentCollected != null)
                _buildDetailRow('Paiement encaissé', NumberFormat.currency(symbol: '€').format(item.paymentCollected)),
              if (item.packagingDeposited != null)
                _buildDetailRow('Consignes déposées', NumberFormat.currency(symbol: '€').format(item.packagingDeposited)),
              if (item.packagingReturned != null)
                _buildDetailRow('Consignes retournées', NumberFormat.currency(symbol: '€').format(item.packagingReturned)),
              if (item.notes != null && item.notes!.isNotEmpty)
                _buildDetailRow('Notes', item.notes!),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
