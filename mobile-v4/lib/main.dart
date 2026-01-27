import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/config/app_config.dart';
import 'core/config/theme_config.dart';
import 'core/router/app_router.dart';
import 'core/storage/local_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize local storage
  await LocalStorage.init();

  runApp(const ProviderScope(child: AwidApp()));
}

class AwidApp extends StatelessWidget {
  const AwidApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppConfig.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeConfig.lightTheme,
      darkTheme: ThemeConfig.darkTheme,
      themeMode: ThemeMode.light,
      routerConfig: AppRouter.router,
    );
  }
}
