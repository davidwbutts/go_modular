
import 'package:go_router/go_router.dart';

abstract class AppRouter {

  static final goRouter = GoRouter(
      routes: [

      ]
  );
}

enum AppPageRoute {
  root(name: 'root', path: '/'),
  login(name: 'login', path: '/login'),//pageRoute: AppPageRoute(name: 'login')),
  home(name: 'home', path: '/home'),
  error(name: 'error', path: '/error');//pageRoute: AppPageRoute(name: 'home'));

  // final AppPageRoute pageRoute;
  final String name;
  final String path;

  const AppPageRoute({
    required this.name,
    required this.path,
    // required this.pageRoute,
  });

}
