import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/storage/secure_storage.dart';
import 'features/auth/providers/auth_provider.dart';
import 'features/auth/presentation/pages/login_page.dart';
import 'features/admin/presentation/pages/admin_dashboard.dart';
import 'features/cafeteria/presentation/pages/cafeteria_dashboard.dart';
import 'features/deliverer/presentation/pages/deliverer_dashboard.dart';
import 'features/kitchen/presentation/pages/kitchen_dashboard.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MaterialApp(
        title: 'Awid',
        theme: ThemeData(
          primarySwatch: Colors.green,
          primaryColor: Color(0xFF2E7D32),
          colorScheme: ColorScheme.fromSeed(
            seedColor: Color(0xFF2E7D32),
            brightness: Brightness.light,
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: AppBarTheme(
            backgroundColor: Color(0xFF2E7D32),
            foregroundColor: Colors.white,
            elevation: 0,
          ),
        ),
        home: AuthWrapper(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class AuthWrapper extends StatefulWidget {
  @override
  _AuthWrapperState createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  final SecureStorage _storage = SecureStorage();
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _checkAuthStatus();
  }

  Future<void> _checkAuthStatus() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final isLoggedIn = await _storage.isLoggedIn();
    
    if (isLoggedIn) {
      final user = await _storage.getUser();
      if (user != null) {
        authProvider.setUser(user);
      }
    }
    
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
        if (!authProvider.isAuthenticated) {
          return LoginPage();
        }

        switch (authProvider.user!['role']) {
          case 'admin':
            return AdminDashboard();
          case 'cafeteria':
            return CafeteriaDashboard();
          case 'deliverer':
            return DelivererDashboard();
          case 'kitchen':
            return KitchenDashboard();
          default:
            return LoginPage();
        }
      },
    );
  }
}