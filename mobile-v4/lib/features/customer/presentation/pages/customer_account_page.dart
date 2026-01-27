import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/customer_account_provider.dart';

/// Page Compte Client
class CustomerAccountPage extends ConsumerWidget {
  final String customerId;

  const CustomerAccountPage({
    super.key,
    required this.customerId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountAsync = ref.watch(customerAccountProvider(customerId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon Compte'),
        elevation: 0,
      ),
      body: accountAsync.when(
        data: (account) => ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Profile Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.blue.shade100,
                      child: Text(
                        account.name.substring(0, 1).toUpperCase(),
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade700,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      account.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      account.email,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Info Section
            const Text(
              'Informations',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.business),
                    title: const Text('Organisation'),
                    subtitle: Text(account.organizationName),
                  ),
                  if (account.phone != null)
                    ListTile(
                      leading: const Icon(Icons.phone),
                      title: const Text('Téléphone'),
                      subtitle: Text(account.phone!),
                    ),
                  if (account.address != null)
                    ListTile(
                      leading: const Icon(Icons.location_on),
                      title: const Text('Adresse'),
                      subtitle: Text(account.address!),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Settings Section
            const Text(
              'Paramètres',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Card(
              child: Column(
                children: [
                  SwitchListTile(
                    secondary: const Icon(Icons.email),
                    title: const Text('Notifications Email'),
                    value: account.settings?.emailNotifications ?? true,
                    onChanged: (value) {
                      // TODO: Update settings
                    },
                  ),
                  SwitchListTile(
                    secondary: const Icon(Icons.sms),
                    title: const Text('Notifications SMS'),
                    value: account.settings?.smsNotifications ?? true,
                    onChanged: (value) {
                      // TODO: Update settings
                    },
                  ),
                  SwitchListTile(
                    secondary: const Icon(Icons.notifications),
                    title: const Text('Notifications Push'),
                    value: account.settings?.pushNotifications ?? true,
                    onChanged: (value) {
                      // TODO: Update settings
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Erreur: $error')),
      ),
    );
  }
}
