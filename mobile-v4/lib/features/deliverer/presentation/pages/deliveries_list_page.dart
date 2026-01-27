import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/delivery.dart';
import '../providers/deliverer_provider.dart';
import '../widgets/delivery_card.dart';

/// Page liste complète des livraisons avec filtres
class DeliveriesListPage extends ConsumerStatefulWidget {
  const DeliveriesListPage({super.key});

  @override
  ConsumerState<DeliveriesListPage> createState() => _DeliveriesListPageState();
}

class _DeliveriesListPageState extends ConsumerState<DeliveriesListPage> {
  DeliveryStatus? _selectedStatus;
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    final deliveriesState = ref.watch(deliveriesNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Toutes les livraisons'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: _showFilters,
          ),
        ],
      ),
      body: Column(
        children: [
          // Filtres actifs
          if (_selectedStatus != null || _selectedDate != null)
            Container(
              padding: const EdgeInsets.all(8),
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              child: Wrap(
                spacing: 8,
                children: [
                  if (_selectedStatus != null)
                    Chip(
                      label: Text(_selectedStatus!.displayName),
                      onDeleted: () {
                        setState(() => _selectedStatus = null);
                        _applyFilters();
                      },
                    ),
                  if (_selectedDate != null)
                    Chip(
                      label: Text(
                        '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                      ),
                      onDeleted: () {
                        setState(() => _selectedDate = null);
                        _applyFilters();
                      },
                    ),
                ],
              ),
            ),

          // Liste
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                await ref.read(deliveriesNotifierProvider.notifier).loadDeliveries(
                      status: _selectedStatus,
                      date: _selectedDate,
                    );
              },
              child: deliveriesState.when(
                data: (deliveries) {
                  if (deliveries.isEmpty) {
                    return const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.local_shipping_outlined, size: 64),
                          SizedBox(height: 16),
                          Text('Aucune livraison trouvée'),
                        ],
                      ),
                    );
                  }

                  return ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: deliveries.length,
                    itemBuilder: (context, index) {
                      final delivery = deliveries[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: DeliveryCard(
                          delivery: delivery,
                          onTap: () {
                            // TODO: Navigation vers détails
                          },
                        ),
                      );
                    },
                  );
                },
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                error: (error, stack) => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error_outline,
                        size: 64,
                        color: Theme.of(context).colorScheme.error,
                      ),
                      const SizedBox(height: 16),
                      Text('Erreur: $error'),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          ref.read(deliveriesNotifierProvider.notifier).loadDeliveries(
                                status: _selectedStatus,
                                date: _selectedDate,
                              );
                        },
                        child: const Text('Réessayer'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showFilters() {
    showModalBottomSheet(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setModalState) => Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Filtres',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),

              // Filtre statut
              Text(
                'Statut',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: [
                  FilterChip(
                    label: const Text('Tous'),
                    selected: _selectedStatus == null,
                    onSelected: (selected) {
                      setModalState(() => _selectedStatus = null);
                    },
                  ),
                  ...DeliveryStatus.values.map((status) {
                    return FilterChip(
                      label: Text(status.displayName),
                      selected: _selectedStatus == status,
                      onSelected: (selected) {
                        setModalState(() {
                          _selectedStatus = selected ? status : null;
                        });
                      },
                    );
                  }),
                ],
              ),
              const SizedBox(height: 16),

              // Filtre date
              Text(
                'Date',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      icon: const Icon(Icons.calendar_today),
                      label: Text(
                        _selectedDate != null
                            ? '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
                            : 'Sélectionner une date',
                      ),
                      onPressed: () async {
                        final date = await showDatePicker(
                          context: context,
                          initialDate: _selectedDate ?? DateTime.now(),
                          firstDate: DateTime.now().subtract(
                            const Duration(days: 365),
                          ),
                          lastDate: DateTime.now().add(
                            const Duration(days: 365),
                          ),
                        );
                        if (date != null) {
                          setModalState(() => _selectedDate = date);
                        }
                      },
                    ),
                  ),
                  if (_selectedDate != null) ...[
                    const SizedBox(width: 8),
                    IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        setModalState(() => _selectedDate = null);
                      },
                    ),
                  ],
                ],
              ),
              const SizedBox(height: 24),

              // Boutons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        setModalState(() {
                          _selectedStatus = null;
                          _selectedDate = null;
                        });
                      },
                      child: const Text('Réinitialiser'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          // Les filtres sont déjà mis à jour
                        });
                        _applyFilters();
                        Navigator.pop(context);
                      },
                      child: const Text('Appliquer'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _applyFilters() {
    ref.read(deliveriesNotifierProvider.notifier).loadDeliveries(
          status: _selectedStatus,
          date: _selectedDate,
        );
  }
}
