import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:go_modular/go_modular.dart';
import 'package:go_modular_example/app/routing/app_router.dart';
import 'package:go_modular_example/app/shared/app_logger.dart';

void main() {
  FlutterError.onError = AppLogger.onFlutterError;
  PlatformDispatcher.instance.onError = AppLogger.onPlatformError;

  runApp(
    ProviderScope(
      child: GoModularApp(
        router: AppRouter.goRouter,
        child: const MobileApp(),
      ),
    ),
  );
}

class MobileApp extends StatelessWidget {
  const MobileApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: Modular.routerConfig,
    );
  }
}