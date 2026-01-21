import 'dart:async';
import 'dart:ui';

import 'package:golden_toolkit/golden_toolkit.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  return GoldenToolkit.runWithConfiguration(
    () async {
      await loadAppFonts();
      await testMain();
    },
    config: GoldenToolkitConfiguration(
      // Use a consistent screen size for golden tests
      defaultDevices: const [
        Device(name: 'phone', size: Size(375, 667)),
      ],
    ),
  );
}
