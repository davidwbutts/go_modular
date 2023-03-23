
import 'package:flutter/material.dart';

class ScaffoldWithBottomNavigation extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget child;
  final Widget bottomNavigationBar;

  const ScaffoldWithBottomNavigation({
    super.key,
    this.appBar,
    required this.child,
    required this.bottomNavigationBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: child,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}

