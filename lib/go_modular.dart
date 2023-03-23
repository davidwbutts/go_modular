library go_modular;

import 'package:flutter/material.dart';
import 'package:go_modular/src/navigator.dart';
import 'package:go_router/go_router.dart';

GoModular? _modular;

// ignore: non_constant_identifier_names
GoModular get Modular =>
    _modular ??= GoModularImpl();


abstract class GoModular {

  /// Responsible for setting up routing for app
  /// Should only be called once and before any navigator or di lookup
  void init(GoRouter router);

  /// Navigator 2.0 initializer: GoRouter implementation of RouterConfig
  GoRouter get routerConfig;

  GoModularNavigator get to;
}


class GoModularApp extends StatefulWidget {
  final GoRouter router;
  final Widget child;

  const GoModularApp({
    super.key,
    required this.router,
    required this.child,
  });

  @override
  State<GoModularApp> createState() => _GoModularAppState();
}

class _GoModularAppState extends State<GoModularApp> {
  @override
  void initState() {
    super.initState();
    Modular.init(widget.router);
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class GoModularImpl implements GoModular {
  late final GoRouter _router;
  late final GoModularNavigator _navigator;

  GoModularImpl();

  @override
  void init(GoRouter router) {
    _router = router;
    _navigator = GoNavigatorImpl(router: router);
  }

  @override
  GoModularNavigator get to => _navigator;

  @override
  GoRouter get routerConfig => _router;

}

