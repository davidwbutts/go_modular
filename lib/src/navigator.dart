

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class GoModularNavigator {
  ///  Actual path
  String get path;

  List get navigateHistory;

  /// Navigate to a new screen
  /// Modular.to.push(MaterialPageRoute(builder: (context) => HomePage()),);
  Future<T?> push<T extends Object?>(Route<T> route);

  /// Pop the current route off the navigator and navigate to a route.
  /// Modular.to.popAndPushNamed('/home', arguments: 10);
  Future<T?> popAndPushNamed<T extends Object?, TO extends Object?>(
      String routeName, {
        TO? result,
        Object? arguments,
        bool forRoot = false,
      });

  /// Navigate to a route.
  /// Modular.to.pushNamed('/home', arguments: 10);
  Future<T?> pushNamed<T extends Object?>(String routeName, {
    Object? arguments,
    bool forRoot = false,
  });

  /// Push the route with the given name and remove all the previous
  /// routes until the predicate returns true.
  /// Modular.to.pushNamedAndRemoveUntil('/home', ModalRoute.withName('/'), arguments: 10);
  Future<T?> pushNamedAndRemoveUntil<T extends Object?>(
      String newRouteName, bool Function(Route<dynamic>) predicate,
      {Object? arguments, bool forRoot = false});

  ///Replace the current route by pushing the route named routeName .
  /// Modular.to.pushReplacementNamed('/home', arguments: 10);
  Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
      String routeName,
      {TO? result,
        Object? arguments,
        bool forRoot = false});

  /// Removes the current Route from the stack of routes.
  /// Modular.to.pop();
  void pop<T extends Object?>([T result]);

  /// Returns true only if popping the navigator would not remove the initial route.
  /// Modular.to.canPop();
  bool canPop();

  /// Removes the current Route from the stack of routes if it can pop.
  /// Modular.to.maybePop();
  Future<bool> maybePop<T extends Object?>([T result]);

  ///Calls pop repeatedly until predicate is satisfied.
  /// Modular.to.popUntil(ModalRoute.withName('/login'));
  void popUntil(bool Function(Route<dynamic>) predicate);

  /// Navigate to a new screen, replacing all past routes.
  /// Modular.to.navigate('/home');
  void navigate(String path, {dynamic arguments});

void setObservers(List<NavigatorObserver> navigatorObservers);

void setNavigatorKey(GlobalKey<NavigatorState>? navigatorkey);

}

class GoNavigatorImpl implements GoModularNavigator {
  final GoRouter router;

  const GoNavigatorImpl({required this.router});

  @override
  void navigate(String path, {arguments}) {
    router.go(path);
  }

  @override
  String get path => router.location;

  @override
  Future<T?> popAndPushNamed<T extends Object?, TO extends Object?>(String routeName, {
    TO? result,
    Object? arguments,
    bool forRoot = false,
  }) async {
    router.goNamed(routeName);
    return null;
  }

  @override
  Future<T?> push<T extends Object?>(Route<T> route) {
    throw UnimplementedError();
  }

  @override
  Future<T?> pushNamed<T extends Object?>(String routeName, {Object? arguments, bool forRoot = false}) async {
    router.goNamed(routeName, extra: arguments);
    return null;
  }

  @override
  bool canPop() {
    // TODO: implement canPop
    throw UnimplementedError();
  }

  @override
  Future<bool> maybePop<T extends Object?>([T? result]) async {
    // TODO: implement maybePop
    return true;
  }

  @override
  // TODO: implement navigateHistory
  List get navigateHistory => throw UnimplementedError();

  @override
  void pop<T extends Object?>([T? result]) {
    // TODO: implement pop
  }

  @override
  void popUntil(bool Function(Route p1) predicate) {
    // TODO: implement popUntil
  }

  @override
  Future<T?> pushNamedAndRemoveUntil<T extends Object?>(String newRouteName, bool Function(Route p1) predicate, {Object? arguments, bool forRoot = false}) {
    throw UnimplementedError();
  }

  @override
  Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(String routeName, {TO? result, Object? arguments, bool forRoot = false}) {
    // TODO: implement pushReplacementNamed
    throw UnimplementedError();
  }

  @override
  void setNavigatorKey(GlobalKey<NavigatorState>? navigatorkey) {
    // TODO: implement setNavigatorKey
  }

  @override
  void setObservers(List<NavigatorObserver> navigatorObservers) {
    // TODO: implement setObservers
  }
}