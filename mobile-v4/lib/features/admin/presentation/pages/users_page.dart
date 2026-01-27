import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/empty_state.dart';
import '../../../../core/widgets/error_widget.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../providers/users_provider.dart';

/// Users Page
/// Page de gestion des utilisateurs (liste et CRUD)
class UsersPage extends ConsumerStatefulWidget {
  const UsersPage({super.key});

  @override
  ConsumerState<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends ConsumerState<UsersPage> {
  String? _selectedRole;
  bool? _selectedIsActive;
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(usersProvider.notifier).loadUsers());
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _applyFilters() {
    ref
        .read(usersProvider.notifier)
        .loadUsers(
          role: _selectedRole,
          isActive: _selectedIsActive,
          search: _searchController.text.isNotEmpty ? _searchController.text : null,
        );
  }

  void _clearFilters() {
    setState(() {
      _selectedRole = null;
      _selectedIsActive = null;
      _searchController.clear();
    });
    ref.read(usersProvider.notifier).clearFilters();
  }

  Color _getRoleColor(String role) {
    switch (role) {
      case 'admin':
        return Colors.purple;
      case 'customer':
        return Colors.blue;
      case 'deliverer':
        return Colors.green;
      case 'kitchen':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final usersAsync = ref.watch(usersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestion des Utilisateurs'),
        actions: [IconButton(icon: const Icon(Icons.filter_list), onPressed: () => _showFiltersDialog(context))],
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Rechercher un utilisateur...',
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

          // Active Filters
          if (_selectedRole != null || _selectedIsActive != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Wrap(
                spacing: 8,
                children: [
                  if (_selectedRole != null)
                    Chip(
                      label: Text(_selectedRole!),
                      onDeleted: () {
                        setState(() => _selectedRole = null);
                        _applyFilters();
                      },
                    ),
                  if (_selectedIsActive != null)
                    Chip(
                      label: Text(_selectedIsActive! ? 'Actif' : 'Inactif'),
                      onDeleted: () {
                        setState(() => _selectedIsActive = null);
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

          // Users List
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                await ref.read(usersProvider.notifier).refresh();
              },
              child: usersAsync.when(
                data: (users) {
                  if (users.isEmpty) {
                    return const EmptyState(message: 'Aucun utilisateur trouvé', icon: Icons.people_outline);
                  }

                  return ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      final user = users[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 12),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: _getRoleColor(user.role),
                            child: Text(user.initials, style: const TextStyle(color: Colors.white)),
                          ),
                          title: Text(user.fullName),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(user.email),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Chip(
                                    label: Text(user.roleDisplayName, style: const TextStyle(fontSize: 12)),
                                    backgroundColor: _getRoleColor(user.role).withOpacity(0.2),
                                    padding: EdgeInsets.zero,
                                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  ),
                                  const SizedBox(width: 8),
                                  Chip(
                                    label: Text(user.statusBadge, style: const TextStyle(fontSize: 12)),
                                    backgroundColor: user.isActive
                                        ? Colors.green.withOpacity(0.2)
                                        : Colors.red.withOpacity(0.2),
                                    padding: EdgeInsets.zero,
                                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          trailing: PopupMenuButton(
                            itemBuilder: (context) => [
                              const PopupMenuItem(
                                value: 'edit',
                                child: Row(children: [Icon(Icons.edit), SizedBox(width: 8), Text('Modifier')]),
                              ),
                              const PopupMenuItem(
                                value: 'delete',
                                child: Row(
                                  children: [
                                    Icon(Icons.delete, color: Colors.red),
                                    SizedBox(width: 8),
                                    Text('Supprimer', style: TextStyle(color: Colors.red)),
                                  ],
                                ),
                              ),
                            ],
                            onSelected: (value) async {
                              if (value == 'delete') {
                                final confirm = await _showDeleteConfirmation(context, user.fullName);
                                if (confirm ?? false) {
                                  await ref.read(userFormProvider.notifier).deleteUser(user.id);
                                  await ref.read(usersProvider.notifier).refresh();
                                }
                              }
                            },
                          ),
                          onTap: () {
                            // TODO: Navigate to user detail/edit
                          },
                        ),
                      );
                    },
                  );
                },
                loading: () => const LoadingWidget(message: 'Chargement des utilisateurs...'),
                error: (error, stack) => ErrorDisplayWidget(
                  message: 'Erreur de chargement des utilisateurs',
                  onRetry: () {
                    ref.read(usersProvider.notifier).refresh();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // TODO: Navigate to create user
        },
        icon: const Icon(Icons.person_add),
        label: const Text('Nouvel utilisateur'),
      ),
    );
  }

  Future<void> _showFiltersDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Filtres'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Rôle', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: _selectedRole,
              decoration: const InputDecoration(border: OutlineInputBorder(), hintText: 'Tous les rôles'),
              items: const [
                DropdownMenuItem(value: null, child: Text('Tous les rôles')),
                DropdownMenuItem(value: 'admin', child: Text('Administrateur')),
                DropdownMenuItem(value: 'customer', child: Text('Client')),
                DropdownMenuItem(value: 'deliverer', child: Text('Livreur')),
                DropdownMenuItem(value: 'kitchen', child: Text('Cuisine')),
              ],
              onChanged: (value) {
                setState(() => _selectedRole = value);
              },
            ),
            const SizedBox(height: 16),
            const Text('Statut', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            DropdownButtonFormField<bool?>(
              value: _selectedIsActive,
              decoration: const InputDecoration(border: OutlineInputBorder(), hintText: 'Tous'),
              items: const [
                DropdownMenuItem(value: null, child: Text('Tous')),
                DropdownMenuItem(value: true, child: Text('Actif')),
                DropdownMenuItem(value: false, child: Text('Inactif')),
              ],
              onChanged: (value) {
                setState(() => _selectedIsActive = value);
              },
            ),
          ],
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

  Future<bool?> _showDeleteConfirmation(BuildContext context, String userName) async {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirmer la suppression'),
        content: Text('Êtes-vous sûr de vouloir supprimer l\'utilisateur "$userName" ?'),
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
