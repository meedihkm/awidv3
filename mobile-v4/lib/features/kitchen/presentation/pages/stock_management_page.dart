import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:awid_mobile/features/kitchen/presentation/providers/stock_provider.dart';
import 'package:awid_mobile/features/kitchen/domain/entities/stock_item.dart';
import 'package:awid_mobile/features/kitchen/presentation/widgets/stock_alert.dart';

/// Page de gestion du stock
class StockManagementPage extends ConsumerStatefulWidget {
  const StockManagementPage({super.key});

  @override
  ConsumerState<StockManagementPage> createState() => _StockManagementPageState();
}

class _StockManagementPageState extends ConsumerState<StockManagementPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    Future.microtask(() {
      ref.read(stockProvider.notifier).loadItems();
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final stockState = ref.watch(stockProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestion du Stock'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(stockProvider.notifier).loadItems(forceRefresh: true);
            },
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _showAddItemDialog(),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              icon: const Icon(Icons.inventory),
              text: 'Tous (${stockState.items.length})',
            ),
            Tab(
              icon: const Icon(Icons.warning),
              text: 'Stock bas (${stockState.lowStockItems.length})',
            ),
            Tab(
              icon: const Icon(Icons.notifications),
              text: 'Alertes (${stockState.activeAlerts.length})',
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Barre de recherche
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Rechercher un article...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          setState(() {
                            _searchQuery = '';
                          });
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
          ),

          // Contenu des tabs
          Expanded(
            child: stockState.isLoading
                ? const Center(child: CircularProgressIndicator())
                : stockState.error != null
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.error_outline, size: 64, color: Colors.red[300]),
                            const SizedBox(height: 16),
                            Text('Erreur: ${stockState.error}'),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () {
                                ref.read(stockProvider.notifier).loadItems(forceRefresh: true);
                              },
                              child: const Text('Réessayer'),
                            ),
                          ],
                        ),
                      )
                    : TabBarView(
                        controller: _tabController,
                        children: [
                          _buildAllItemsList(stockState.items),
                          _buildLowStockList(stockState.lowStockItems),
                          _buildAlertsList(stockState.activeAlerts),
                        ],
                      ),
          ),
        ],
      ),
    );
  }

  /// Liste de tous les articles
  Widget _buildAllItemsList(List<StockItem> items) {
    final filteredItems = _filterItems(items);

    if (filteredItems.isEmpty) {
      return const Center(
        child: Text('Aucun article en stock'),
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        await ref.read(stockProvider.notifier).loadItems(forceRefresh: true);
      },
      child: ListView.builder(
        itemCount: filteredItems.length,
        itemBuilder: (context, index) {
          final item = filteredItems[index];
          return _buildStockItemCard(item);
        },
      ),
    );
  }

  /// Liste des articles en stock bas
  Widget _buildLowStockList(List<StockItem> items) {
    final filteredItems = _filterItems(items);

    if (filteredItems.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle, size: 64, color: Colors.green),
            SizedBox(height: 16),
            Text('Aucun article en stock bas'),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        await ref.read(stockProvider.notifier).loadItems(forceRefresh: true);
      },
      child: ListView.builder(
        itemCount: filteredItems.length,
        itemBuilder: (context, index) {
          final item = filteredItems[index];
          return _buildStockItemCard(item, showAlert: true);
        },
      ),
    );
  }

  /// Liste des alertes
  Widget _buildAlertsList(List<StockAlert> alerts) {
    if (alerts.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle, size: 64, color: Colors.green),
            SizedBox(height: 16),
            Text('Aucune alerte active'),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        await ref.read(stockProvider.notifier).loadItems(forceRefresh: true);
      },
      child: ListView.builder(
        itemCount: alerts.length,
        itemBuilder: (context, index) {
          final alert = alerts[index];
          return StockAlertWidget(alert: alert);
        },
      ),
    );
  }

  /// Carte d'article de stock
  Widget _buildStockItemCard(StockItem item, {bool showAlert = false}) {
    final stockLevel = item.stockLevel;
    Color levelColor;
    IconData levelIcon;

    switch (stockLevel) {
      case StockLevel.critical:
        levelColor = Colors.red;
        levelIcon = Icons.error;
        break;
      case StockLevel.low:
        levelColor = Colors.orange;
        levelIcon = Icons.warning;
        break;
      case StockLevel.normal:
        levelColor = Colors.blue;
        levelIcon = Icons.info;
        break;
      case StockLevel.high:
        levelColor = Colors.green;
        levelIcon = Icons.check_circle;
        break;
    }

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: levelColor.withOpacity(0.2),
          child: Icon(levelIcon, color: levelColor),
        ),
        title: Text(item.productName),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text('Quantité: ${item.formattedQuantity}'),
            const SizedBox(height: 4),
            LinearProgressIndicator(
              value: item.currentQuantity / item.maximumQuantity,
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation<Color>(levelColor),
            ),
            const SizedBox(height: 4),
            Text(
              'Min: ${item.minimumQuantity} | Max: ${item.maximumQuantity}',
              style: TextStyle(fontSize: 11, color: Colors.grey[600]),
            ),
            if (item.isNearExpiration)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Row(
                  children: [
                    const Icon(Icons.schedule, size: 14, color: Colors.orange),
                    const SizedBox(width: 4),
                    Text(
                      'Expire dans ${item.daysUntilExpiration} jours',
                      style: const TextStyle(fontSize: 11, color: Colors.orange),
                    ),
                  ],
                ),
              ),
          ],
        ),
        trailing: PopupMenuButton(
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 'adjust',
              child: Row(
                children: [
                  Icon(Icons.edit, size: 20),
                  SizedBox(width: 8),
                  Text('Ajuster'),
                ],
              ),
            ),
            const PopupMenuItem(
              value: 'add',
              child: Row(
                children: [
                  Icon(Icons.add, size: 20, color: Colors.green),
                  SizedBox(width: 8),
                  Text('Ajouter'),
                ],
              ),
            ),
            const PopupMenuItem(
              value: 'remove',
              child: Row(
                children: [
                  Icon(Icons.remove, size: 20, color: Colors.orange),
                  SizedBox(width: 8),
                  Text('Retirer'),
                ],
              ),
            ),
            const PopupMenuItem(
              value: 'waste',
              child: Row(
                children: [
                  Icon(Icons.delete, size: 20, color: Colors.red),
                  SizedBox(width: 8),
                  Text('Déclarer perte'),
                ],
              ),
            ),
          ],
          onSelected: (value) {
            switch (value) {
              case 'adjust':
                _showAdjustDialog(item);
                break;
              case 'add':
                _showAddStockDialog(item);
                break;
              case 'remove':
                _showRemoveStockDialog(item);
                break;
              case 'waste':
                _showWasteDialog(item);
                break;
            }
          },
        ),
        onTap: () => _showItemDetail(item),
      ),
    );
  }

  /// Filtrer les articles
  List<StockItem> _filterItems(List<StockItem> items) {
    if (_searchQuery.isEmpty) return items;

    return items.where((item) {
      return item.productName.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          (item.category?.toLowerCase().contains(_searchQuery.toLowerCase()) ?? false);
    }).toList();
  }

  /// Afficher le détail d'un article
  void _showItemDetail(StockItem item) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(item.productName),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildDetailRow('Quantité actuelle', item.formattedQuantity),
              _buildDetailRow('Quantité minimum', '${item.minimumQuantity}'),
              _buildDetailRow('Quantité maximum', '${item.maximumQuantity}'),
              if (item.category != null) _buildDetailRow('Catégorie', item.category!),
              if (item.supplier != null) _buildDetailRow('Fournisseur', item.supplier!),
              if (item.location != null) _buildDetailRow('Emplacement', item.location!),
              if (item.unitCost != null)
                _buildDetailRow('Coût unitaire', '${item.unitCost!.toStringAsFixed(2)} €'),
              _buildDetailRow('Valeur totale', '${item.totalValue.toStringAsFixed(2)} €'),
              if (item.expirationDate != null)
                _buildDetailRow(
                  'Expiration',
                  '${item.daysUntilExpiration} jours',
                ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Fermer'),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(value),
        ],
      ),
    );
  }

  /// Dialogue d'ajustement
  void _showAdjustDialog(StockItem item) {
    final controller = TextEditingController();
    final reasonController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Ajuster ${item.productName}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Nouvelle quantité',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: reasonController,
              decoration: const InputDecoration(
                labelText: 'Raison (optionnel)',
                border: OutlineInputBorder(),
              ),
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
              final quantity = double.tryParse(controller.text);
              if (quantity != null) {
                ref.read(stockProvider.notifier).adjustQuantity(
                      itemId: item.id,
                      quantity: quantity,
                      type: StockMovementType.adjustment,
                      reason: reasonController.text.isEmpty ? null : reasonController.text,
                    );
                Navigator.pop(context);
              }
            },
            child: const Text('Confirmer'),
          ),
        ],
      ),
    );
  }

  /// Dialogue d'ajout de stock
  void _showAddStockDialog(StockItem item) {
    final controller = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Ajouter ${item.productName}'),
        content: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Quantité à ajouter',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler'),
          ),
          ElevatedButton(
            onPressed: () {
              final quantity = double.tryParse(controller.text);
              if (quantity != null && quantity > 0) {
                ref.read(stockProvider.notifier).adjustQuantity(
                      itemId: item.id,
                      quantity: quantity,
                      type: StockMovementType.stockIn,
                      reason: 'Réapprovisionnement',
                    );
                Navigator.pop(context);
              }
            },
            child: const Text('Ajouter'),
          ),
        ],
      ),
    );
  }

  /// Dialogue de retrait de stock
  void _showRemoveStockDialog(StockItem item) {
    final controller = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Retirer ${item.productName}'),
        content: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Quantité à retirer',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler'),
          ),
          ElevatedButton(
            onPressed: () {
              final quantity = double.tryParse(controller.text);
              if (quantity != null && quantity > 0) {
                ref.read(stockProvider.notifier).adjustQuantity(
                      itemId: item.id,
                      quantity: quantity,
                      type: StockMovementType.stockOut,
                      reason: 'Utilisation',
                    );
                Navigator.pop(context);
              }
            },
            child: const Text('Retirer'),
          ),
        ],
      ),
    );
  }

  /// Dialogue de déclaration de perte
  void _showWasteDialog(StockItem item) {
    final controller = TextEditingController();
    final reasonController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Déclarer perte - ${item.productName}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Quantité perdue',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: reasonController,
              decoration: const InputDecoration(
                labelText: 'Raison',
                border: OutlineInputBorder(),
              ),
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
              final quantity = double.tryParse(controller.text);
              if (quantity != null && quantity > 0 && reasonController.text.isNotEmpty) {
                ref.read(stockProvider.notifier).adjustQuantity(
                      itemId: item.id,
                      quantity: quantity,
                      type: StockMovementType.waste,
                      reason: reasonController.text,
                    );
                Navigator.pop(context);
              }
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Confirmer'),
          ),
        ],
      ),
    );
  }

  /// Dialogue d'ajout d'article
  void _showAddItemDialog() {
    // TODO: Implémenter formulaire complet d'ajout d'article
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Fonctionnalité à implémenter')),
    );
  }
}
