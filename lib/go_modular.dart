library go_modular;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

GoModular? _modular;

// ignore: non_constant_identifier_names
GoModular get Modular =>
    _modular ??= GoModularImpl.defaults();


abstract class GoModular {

  /// Responsible for setting up routing for app
  /// Should only be called once and before any navigator or di lookup
  void init(GoRouter router);

  /// Navigator 2.0 initializator: RouteInformationParser
  RouteInformationParser<Object> get routeInformationParser;

  /// Navigator 2.0 initializator: RouterDelegate
  RouterDelegate<Object> get routerDelegate;

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
  late final GoModularNavigator? navigator;

  GoModularImpl({
    this.navigator,
  }) : super();

  @override
  void init(GoRouter router) {
    _router = router;
  }

  @override
  RouteInformationParser get routeInformationParser => throw UnimplementedError();

  @override
  RouterDelegate get routerDelegate => throw UnimplementedError();

  @override
  GoModularNavigator get to => throw UnimplementedError();

  factory GoModularImpl.defaults() => GoModularImpl(
      navigator: GoModularNavigatorImpl(),
  );

}

abstract class GoModularNavigator {
  ///  Actual path
  String get path;
  // List<ParallelRoute> get navigateHistory;  TODO: FIX

  /// Navigate to a new screen.
  ///
  /// ```
  /// Modular.to.push(MaterialPageRoute(builder: (context) => HomePage()),);
  /// ```
  Future<T?> push<T extends Object?>(Route<T> route);

  /// Pop the current route off the navigator and navigate to a route.
  ///
  /// ```
  /// Modular.to.popAndPushNamed('/home');
  /// ```
  /// You could give parameters
  /// ```
  /// Modular.to.popAndPushNamed('/home', arguments: 10);
  /// ```
  Future<T?> popAndPushNamed<T extends Object?, TO extends Object?>(
      String routeName,
      {TO? result,
        Object? arguments,
        bool forRoot = false});

  /// Navigate to a route.
  ///
  /// ```
  /// Modular.to.pushNamed('/home/10');
  /// ```
  /// You could give parameters
  /// ```
  /// Modular.to.pushNamed('/home', arguments: 10);
  /// ```
  Future<T?> pushNamed<T extends Object?>(String routeName,
      {Object? arguments, bool forRoot = false});

  // /// Push the route with the given name onto the navigator that most tightly
  // /// encloses the given context, and then remove all the previous routes until
  // /// the predicate returns true.
  // ///
  // /// ```
  // /// Modular.to.pushNamedAndRemoveUntil('/home/10', ModalRoute.withName('/'));
  // /// ```
  // /// You could give parameters
  // /// ```
  // /// Modular.to.pushNamedAndRemoveUntil('/home', ModalRoute.withName('/'), arguments: 10);
  // /// ```
  // Future<T?> pushNamedAndRemoveUntil<T extends Object?>(
  //     String newRouteName, bool Function(Route<dynamic>) predicate,
  //     {Object? arguments, bool forRoot = false});
  //
  // ///Replace the current route of the navigator that most tightly encloses the
  // ///given context by pushing the route named routeName and then disposing the
  // ///previous route once the new route has finished animating in.
  // ///
  // /// ```
  // /// Modular.to.pushReplacementNamed('/home/10');
  // /// ```
  // /// You could give parameters
  // /// ```
  // /// Modular.to.pushReplacementNamed('/home', arguments: 10);
  // /// ```
  // Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
  //     String routeName,
  //     {TO? result,
  //       Object? arguments,
  //       bool forRoot = false});

  // /// Removes the current Route from the stack of routes.
  // ///
  // /// ```
  // /// Modular.to.pop();
  // /// ```
  // void pop<T extends Object?>([T result]);
  //
  // /// The initial route cannot be popped off the navigator, which implies that
  // /// this function returns true only if popping the navigator would not remove
  // /// the initial route.
  // ///
  // /// ```
  // /// Modular.to.canPop();
  // /// ```
  // bool canPop();
  //
  // ///Consults the current route's Route.willPop method, and acts accordingly,
  // ///potentially popping the route as a result; returns whether the pop request
  // ///should be considered handled.
  // ///
  // /// ```
  // /// Modular.to.maybePop();
  // /// ```
  // Future<bool> maybePop<T extends Object?>([T result]);
  //
  // ///Calls pop repeatedly on the navigator that most tightly encloses the given
  // ///context until the predicate returns true.
  // ///
  // /// ```
  // /// Modular.to.popUntil(ModalRoute.withName('/login'));
  // /// ```
  // void popUntil(bool Function(Route<dynamic>) predicate);

  /// Navigate to a new screen.
  /// This action replaces all past routes.
  ///
  /// ```
  /// Modular.to.navigate('/home');
  /// ```
  void navigate(String path, {dynamic arguments});

  // void setObservers(List<NavigatorObserver> navigatorObservers);
  //
  // void setNavigatorKey(GlobalKey<NavigatorState>? navigatorkey);

}

class GoModularNavigatorImpl implements GoModularNavigator {
  final GoRouter goRouter;

  const GoModularNavigatorImpl({required this.goRouter});

  @override
  void navigate(String path, {arguments}) {
    goRouter.go(path);
  }

  @override
  String get path => goRouter.location;

  @override
  Future<T?> popAndPushNamed<T extends Object?, TO extends Object?>(String routeName, {
    TO? result,
    Object? arguments,
    bool forRoot = false,
  }) async {
    goRouter.goNamed(routeName);
    return null;
  }cd..

  @override
  Future<T?> push<T extends Object?>(Route<T> route) {
    // TODO: implement push
    throw UnimplementedError();
  }

  @override
  Future<T?> pushNamed<T extends Object?>(String routeName, {Object? arguments, bool forRoot = false}) {
    // TODO: implement pushNamed
    throw UnimplementedError();
  }
}