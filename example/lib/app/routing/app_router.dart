
import 'package:flutter/material.dart';
import 'package:go_modular_example/app/routing/app_page_route.dart';
import 'package:go_modular_example/app/shared/ui/app_bottom_nav_bar.dart';
import 'package:go_modular_example/app/shared/ui/boundary_widget.dart';
import 'package:go_modular_example/app/shared/ui/scaffold_with_bottom_navigation.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {

  static final goRouter = GoRouter(
    routes: [
      GoRoute(
          name: AppPageRoute.login.name,
          path: AppPageRoute.login.path,
          pageBuilder: (context,state) {
            return NoTransitionPage(
              key: state.pageKey,
              child: const LoginScreen(),
            );
          }
      ),
      ShellRoute(
        builder: (context,state,child) {
          return ScaffoldWithBottomNavigation(
              bottomNavigationBar: const AppBottomNavigationBar(),
              child: child,
          );
        },
        routes: [
          GoRoute(
              name: AppPageRoute.hub.name,
              path: AppPageRoute.hub.path,
              pageBuilder: (context,state) {
                return NoTransitionPage(
                  key: state.pageKey,
                  child: const HubScreen(),
                );
              }
          ),
          GoRoute(
              name: AppPageRoute.payments.name,
              path: AppPageRoute.payments.path,
              pageBuilder: (context,state) {
                return NoTransitionPage(
                  key: state.pageKey,
                  child: const PaymentsScreen(),
                );
              }
          ),
          GoRoute(
              name: AppPageRoute.transfers.name,
              path: AppPageRoute.transfers.path,
              pageBuilder: (context,state) {
                return NoTransitionPage(
                  key: state.pageKey,
                  child: const TransfersScreen(),
                );
              }
          ),
        ],
      ),
    ],
    debugLogDiagnostics: true,
  );
}

class HubScreen extends StatelessWidget {
  const HubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BoundaryWidget(
      child: Text('Hub'),
    );
  }
}

class PaymentsScreen extends StatelessWidget {
  const PaymentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BoundaryWidget(
        child: Text('Payments'),
    );
  }
}

class TransfersScreen extends StatelessWidget {
  const TransfersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BoundaryWidget(
        child: Text('Transfers'),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: BoundaryWidget(
        child: Text('Login'),
        ),
    );
  }
}


