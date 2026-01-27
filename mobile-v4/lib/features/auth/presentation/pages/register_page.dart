import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/theme_config.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/custom_button.dart';
import '../providers/auth_provider.dart';

/// Register Page
/// Page d'inscription
class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  // TODO: Get from API
  final String _organizationId = '1';

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _handleRegister() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Les mots de passe ne correspondent pas'),
          backgroundColor: ThemeConfig.errorColor,
        ),
      );
      return;
    }

    try {
      await ref
          .read(authProvider.notifier)
          .register(
            email: _emailController.text.trim(),
            password: _passwordController.text,
            firstName: _firstNameController.text.trim(),
            lastName: _lastNameController.text.trim(),
            phone: _phoneController.text.trim(),
            organizationId: _organizationId,
          );

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
      appBar: AppBar(title: const Text('Créer un compte')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // First Name
                TextFormField(
                  controller: _firstNameController,
                  decoration: const InputDecoration(labelText: 'Prénom', prefixIcon: Icon(Icons.person_outlined)),
                  validator: (value) => Validators.required(value, 'Prénom'),
                  enabled: !authState.isLoading,
                ),
                const SizedBox(height: 16),

                // Last Name
                TextFormField(
                  controller: _lastNameController,
                  decoration: const InputDecoration(labelText: 'Nom', prefixIcon: Icon(Icons.person_outlined)),
                  validator: (value) => Validators.required(value, 'Nom'),
                  enabled: !authState.isLoading,
                ),
                const SizedBox(height: 16),

                // Email
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(labelText: 'Email', prefixIcon: Icon(Icons.email_outlined)),
                  validator: Validators.email,
                  enabled: !authState.isLoading,
                ),
                const SizedBox(height: 16),

                // Phone
                TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(labelText: 'Téléphone', prefixIcon: Icon(Icons.phone_outlined)),
                  validator: Validators.phone,
                  enabled: !authState.isLoading,
                ),
                const SizedBox(height: 16),

                // Password
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
                const SizedBox(height: 16),

                // Confirm Password
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: _obscureConfirmPassword,
                  decoration: InputDecoration(
                    labelText: 'Confirmer mot de passe',
                    prefixIcon: const Icon(Icons.lock_outlined),
                    suffixIcon: IconButton(
                      icon: Icon(_obscureConfirmPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined),
                      onPressed: () {
                        setState(() {
                          _obscureConfirmPassword = !_obscureConfirmPassword;
                        });
                      },
                    ),
                  ),
                  validator: Validators.password,
                  enabled: !authState.isLoading,
                ),
                const SizedBox(height: 24),

                // Register Button
                CustomButton(
                  label: 'S\'inscrire',
                  onPressed: authState.isLoading ? null : _handleRegister,
                  isLoading: authState.isLoading,
                ),
                const SizedBox(height: 16),

                // Login Link
                TextButton(
                  onPressed: authState.isLoading
                      ? null
                      : () {
                          context.pop();
                        },
                  child: const Text('Déjà un compte ? Se connecter'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
