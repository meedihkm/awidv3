import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/theme_config.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/custom_button.dart';
import '../providers/auth_provider.dart';

/// Login Page
/// Page de connexion
class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    try {
      await ref
          .read(authProvider.notifier)
          .login(email: _emailController.text.trim(), password: _passwordController.text);

      if (mounted) {
        final user = ref.read(authProvider).user;

        // Navigate based on role
        if (user != null) {
          if (user.isAdmin) {
            context.go(AppConstants.routeAdminDashboard);
          } else if (user.isDeliverer) {
            context.go(AppConstants.routeDelivererDashboard);
          } else if (user.isCustomer) {
            context.go(AppConstants.routeCustomerDashboard);
          } else if (user.isKitchen) {
            context.go(AppConstants.routeKitchenDashboard);
          }
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Erreur: ${e.toString()}'), backgroundColor: ThemeConfig.errorColor));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Logo
                  Icon(Icons.local_shipping, size: 80, color: ThemeConfig.primaryColor),
                  const SizedBox(height: 16),

                  // Title
                  Text(
                    'AWID',
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(color: ThemeConfig.primaryColor),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),

                  Text(
                    'Système de Livraison',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: ThemeConfig.textSecondaryColor),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 48),

                  // Email Field
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(labelText: 'Email', prefixIcon: Icon(Icons.email_outlined)),
                    validator: Validators.email,
                    enabled: !authState.isLoading,
                  ),
                  const SizedBox(height: 16),

                  // Password Field
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      labelText: 'Mot de passe',
                      prefixIcon: const Icon(Icons.lock_outlined),
                      suffixIcon: IconButton(
                        icon: Icon(_obscurePassword ? Icons.visibility_outlined : Icons.visibility_off_outlined),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                    ),
                    validator: Validators.password,
                    enabled: !authState.isLoading,
                  ),
                  const SizedBox(height: 24),

                  // Login Button
                  CustomButton(
                    label: 'Se connecter',
                    onPressed: authState.isLoading ? null : _handleLogin,
                    isLoading: authState.isLoading,
                  ),
                  const SizedBox(height: 16),

                  // Register Link
                  TextButton(
                    onPressed: authState.isLoading
                        ? null
                        : () {
                            context.push(AppConstants.routeRegister);
                          },
                    child: const Text('Créer un compte'),
                  ),

                  // Demo Accounts
                  const SizedBox(height: 32),
                  Text('Comptes de test', style: Theme.of(context).textTheme.bodySmall, textAlign: TextAlign.center),
                  const SizedBox(height: 8),
                  _buildDemoAccount('Admin', 'admin@pizzeria.dz'),
                  _buildDemoAccount('Livreur', 'deliverer@pizzeria.dz'),
                  _buildDemoAccount('Client', 'client@cafe.dz'),
                  _buildDemoAccount('Cuisine', 'kitchen@pizzeria.dz'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDemoAccount(String role, String email) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        '$role: $email',
        style: Theme.of(context).textTheme.bodySmall?.copyWith(color: ThemeConfig.textSecondaryColor),
        textAlign: TextAlign.center,
      ),
    );
  }
}
