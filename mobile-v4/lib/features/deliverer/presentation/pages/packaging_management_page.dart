import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/packaging_transaction.dart';
import '../../domain/usecases/manage_packaging_usecase.dart';
import '../providers/delivery_actions_provider.dart';

/// Page de gestion des consignes
class PackagingManagementPage extends ConsumerStatefulWidget {
  final String customerId;
  final String customerName;
  final String deliveryId;

  const PackagingManagementPage({
    super.key,
    required this.customerId,
    required this.customerName,
    required this.deliveryId,
  });

  @override
  ConsumerState<PackagingManagementPage> createState() => _PackagingManagementPageState();
}

class _PackagingManagementPageState extends ConsumerState<PackagingManagementPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final Map<String, int> _depositQuantities = {};
  final Map<String, int> _returnQuantities = {};

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final packagingTypesAsync = ref.watch(packagingTypesProvider);
    final packagingBalanceAsync = ref.watch(packagingBalanceProvider(widget.customerId));
    final actionsState = ref.watch(deliveryActionsProvider);

    ref.listen<DeliveryActionsState>(deliveryActionsProvider, (previous, next) {
      if (next is _PackagingTransactionRecorded) {
        _showSuccessDialog(next);
      } else if (next is _Error) {
        _showErrorSnackBar(next.message);
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestion Consignes'),
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.add_circle), text: 'Dépôt'),
            Tab(icon: Icon(Icons.remove_circle), text: 'Retour'),
          ],
        ),
      ),
      body: packagingTypesAsync.when(
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
                onPressed: () => ref.refresh(packagingTypesProvider),
                child: const Text('Réessayer'),
              ),
            ],
          ),
        ),
        data: (packagingTypes) => TabBarView(
          controller: _tabController,
          children: [
            _buildDepositTab(packagingTypes, packagingBalanceAsync, actionsState),
            _buildReturnTab(packagingTypes, packagingBalanceAsync, actionsState),
          ],
        ),
      ),
    );
  }

  Widget _buildDepositTab(
    List<PackagingType> packagingTypes,
    AsyncValue<PackagingBalance> balanceAsync,
    DeliveryActionsState state,
  ) {
    final isLoading = state is _Loading;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Customer Info
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.customerName,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                balanceAsync.when(
                  loading: () => const CircularProgressIndicator(),
                  error: (error, stack) => Text('Erreur: $error'),
                  data: (balance) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Solde actuel: ${NumberFormat.currency(symbol: '€').format(balance.totalValue)}'),
                      Text('${balance.items.length} type(s) de consignes'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Packaging Types
        Text(
          'Consignes déposées',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 8),
        ...packagingTypes.map((type) => _buildPackagingTypeCard(
              type,
              _depositQuantities,
              isLoading,
            )),
        const SizedBox(height: 24),

        // Submit Button
        ElevatedButton(
          onPressed: isLoading ? null : () => _submitDeposit(packagingTypes),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
          child: isLoading
              ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                )
              : const Text('Enregistrer Dépôt', style: TextStyle(fontSize: 16)),
        ),
      ],
    );
  }

  Widget _buildReturnTab(
    List<PackagingType> packagingTypes,
    AsyncValue<PackagingBalance> balanceAsync,
    DeliveryActionsState state,
  ) {
    final isLoading = state is _Loading;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Customer Info
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.customerName,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                balanceAsync.when(
                  loading: () => const CircularProgressIndicator(),
                  error: (error, stack) => Text('Erreur: $error'),
                  data: (balance) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Solde actuel: ${NumberFormat.currency(symbol: '€').format(balance.totalValue)}'),
                      const SizedBox(height: 8),
                      const Text('Détail par type:', style: TextStyle(fontWeight: FontWeight.bold)),
                      ...balance.items.map((item) => Padding(
                            padding: const EdgeInsets.only(left: 16, top: 4),
                            child: Text('${item.packagingName}: ${item.quantity} (${NumberFormat.currency(symbol: '€').format(item.totalValue)})'),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Packaging Types
        Text(
          'Consignes retournées',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 8),
        ...packagingTypes.map((type) => _buildPackagingTypeCard(
              type,
              _returnQuantities,
              isLoading,
            )),
        const SizedBox(height: 24),

        // Submit Button
        ElevatedButton(
          onPressed: isLoading ? null : () => _submitReturn(packagingTypes),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
          ),
          child: isLoading
              ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                )
              : const Text('Enregistrer Retour', style: TextStyle(fontSize: 16)),
        ),
      ],
    );
  }

  Widget _buildPackagingTypeCard(
    PackagingType type,
    Map<String, int> quantities,
    bool isLoading,
  ) {
    final quantity = quantities[type.id] ?? 0;

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    type.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Valeur: ${NumberFormat.currency(symbol: '€').format(type.value)}',
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove_circle_outline),
                  onPressed: isLoading || quantity == 0
                      ? null
                      : () {
                          setState(() {
                            quantities[type.id] = quantity - 1;
                          });
                        },
                ),
                Container(
                  width: 40,
                  alignment: Alignment.center,
                  child: Text(
                    quantity.toString(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add_circle_outline),
                  onPressed: isLoading
                      ? null
                      : () {
                          setState(() {
                            quantities[type.id] = quantity + 1;
                          });
                        },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _submitDeposit(List<PackagingType> packagingTypes) {
    final items = <PackagingItem>[];
    
    for (var entry in _depositQuantities.entries) {
      if (entry.value > 0) {
        final type = packagingTypes.firstWhere((t) => t.id == entry.key);
        items.add(PackagingItem(
          packagingTypeId: type.id,
          quantity: entry.value,
        ));
      }
    }

    if (items.isEmpty) {
      _showErrorSnackBar('Veuillez sélectionner au moins une consigne');
      return;
    }

    final params = PackagingDepositParams(
      deliveryId: widget.deliveryId,
      customerId: widget.customerId,
      items: items,
    );

    ref.read(deliveryActionsProvider.notifier).recordPackagingDeposit(params);
  }

  void _submitReturn(List<PackagingType> packagingTypes) {
    final items = <PackagingItem>[];
    
    for (var entry in _returnQuantities.entries) {
      if (entry.value > 0) {
        final type = packagingTypes.firstWhere((t) => t.id == entry.key);
        items.add(PackagingItem(
          packagingTypeId: type.id,
          quantity: entry.value,
        ));
      }
    }

    if (items.isEmpty) {
      _showErrorSnackBar('Veuillez sélectionner au moins une consigne');
      return;
    }

    final params = PackagingReturnParams(
      deliveryId: widget.deliveryId,
      customerId: widget.customerId,
      items: items,
    );

    ref.read(deliveryActionsProvider.notifier).recordPackagingReturn(params);
  }

  void _showSuccessDialog(_PackagingTransactionRecorded state) {
    final typeLabel = state.type == PackagingTransactionType.deposit ? 'Dépôt' : 'Retour';
    
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 32),
            const SizedBox(width: 12),
            Text('$typeLabel Enregistré'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Valeur: ${NumberFormat.currency(symbol: '€').format(state.totalValue)}'),
            const SizedBox(height: 8),
            Text('Client: ${widget.customerName}'),
            const SizedBox(height: 8),
            Text('Nouveau solde: ${NumberFormat.currency(symbol: '€').format(state.newBalance.totalValue)}'),
            const SizedBox(height: 8),
            Text('Date: ${DateFormat('dd/MM/yyyy HH:mm').format(state.transactionDate)}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close dialog
              Navigator.of(context).pop(); // Close page
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
