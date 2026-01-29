import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/config/theme_config.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/empty_state.dart';
import '../../../../core/widgets/error_widget.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../providers/products_provider.dart';
import '../widgets/product_list_item.dart';

/// Products Page
/// Page de gestion des produits (liste et CRUD)
class ProductsPage extends ConsumerStatefulWidget {
  const ProductsPage({super.key});

  @override
  ConsumerState<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends ConsumerState<ProductsPage> {
  String? _selectedCategory;
  bool? _selectedAvailability;
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Load products on init
    Future.microtask(() => ref.read(productsProvider.notifier).loadProducts());
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _applyFilters() {
    ref
        .read(productsProvider.notifier)
        .loadProducts(
          category: _selectedCategory,
          isAvailable: _selectedAvailability,
          search: _searchController.text.isNotEmpty ? _searchController.text : null,
        );
  }

  void _clearFilters() {
    setState(() {
      _selectedCategory = null;
      _selectedAvailability = null;
      _searchController.clear();
    });
    ref.read(productsProvider.notifier).clearFilters();
  }

  @override
  Widget build(BuildContext context) {
    final productsAsync = ref.watch(productsProvider);
    final categoriesAsync = ref.watch(categoriesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestion des Produits'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () => _showFiltersDialog(context, categoriesAsync),
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Rechercher un produit...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          _applyFilters();
                        },
                      )
                    : null,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onSubmitted: (_) => _applyFilters(),
            ),
          ),

          // Active Filters Chips
          if (_selectedCategory != null || _selectedAvailability != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Wrap(
                spacing: 8,
                children: [
                  if (_selectedCategory != null)
                    Chip(
                      label: Text(_selectedCategory!),
                      onDeleted: () {
                        setState(() => _selectedCategory = null);
                        _applyFilters();
                      },
                    ),
                  if (_selectedAvailability != null)
                    Chip(
                      label: Text(_selectedAvailability! ? 'Disponible' : 'Indisponible'),
                      onDeleted: () {
                        setState(() => _selectedAvailability = null);
                        _applyFilters();
                      },
                    ),
                  TextButton.icon(
                    onPressed: _clearFilters,
                    icon: const Icon(Icons.clear_all),
                    label: const Text('Effacer tout'),
                  ),
                ],
              ),
            ),

          // Products List
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                await ref.read(productsProvider.notifier).refresh();
              },
              child: productsAsync.when(
                data: (products) {
                  if (products.isEmpty) {
                    return const EmptyStateWidget(message: 'Aucun produit trouvé', icon: Icons.inventory_2_outlined);
                  }

                  return ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return ProductListItem(
                        product: product,
                        onTap: () {
                          // TODO: Navigate to product detail/edit
                        },
                        onDelete: () async {
                          final confirm = await _showDeleteConfirmation(context, product.name);
                          if (confirm ?? false) {
                            await ref.read(productFormProvider.notifier).deleteProduct(product.id);
                            await ref.read(productsProvider.notifier).refresh();
                          }
                        },
                      );
                    },
                  );
                },
                loading: () => const LoadingWidget(message: 'Chargement des produits...'),
                error: (error, stack) => ErrorDisplayWidget(
                  message: 'Erreur de chargement des produits',
                  onRetry: () {
                    ref.read(productsProvider.notifier).refresh();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // TODO: Navigate to create product
        },
        icon: const Icon(Icons.add),
        label: const Text('Nouveau produit'),
      ),
    );
  }

  Future<void> _showFiltersDialog(BuildContext context, AsyncValue<List<String>> categoriesAsync) async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Filtres'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Category Filter
              const Text('Catégorie', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              categoriesAsync.when(
                data: (categories) => DropdownButtonFormField<String>(
                  value: _selectedCategory,
                  decoration: const InputDecoration(border: OutlineInputBorder(), hintText: 'Toutes les catégories'),
                  items: [
                    const DropdownMenuItem(value: null, child: Text('Toutes les catégories')),
                    ...categories.map((category) => DropdownMenuItem(value: category, child: Text(category))),
                  ],
                  onChanged: (value) {
                    setState(() => _selectedCategory = value);
                  },
                ),
                loading: () => const CircularProgressIndicator(),
                error: (_, __) => const Text('Erreur de chargement'),
              ),
              const SizedBox(height: 16),

              // Availability Filter
              const Text('Disponibilité', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              DropdownButtonFormField<bool?>(
                value: _selectedAvailability,
                decoration: const InputDecoration(border: OutlineInputBorder(), hintText: 'Tous'),
                items: const [
                  DropdownMenuItem(value: null, child: Text('Tous')),
                  DropdownMenuItem(value: true, child: Text('Disponible')),
                  DropdownMenuItem(value: false, child: Text('Indisponible')),
                ],
                onChanged: (value) {
                  setState(() => _selectedAvailability = value);
                },
              ),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Annuler')),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _applyFilters();
            },
            child: const Text('Appliquer'),
          ),
        ],
      ),
    );
  }

  Future<bool?> _showDeleteConfirmation(BuildContext context, String productName) async {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirmer la suppression'),
        content: Text('Êtes-vous sûr de vouloir supprimer le produit "$productName" ?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Annuler')),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Supprimer'),
          ),
        ],
      ),
    );
  }
}
