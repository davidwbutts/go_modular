
enum AppPageRoute {
  root(name: 'root', path: '/'),
  login(name: 'login', path: '/login'),//pageRoute: AppPageRoute(name: 'login')),
  hub(name: 'hub', path: '/customer/hub'),
  payments(name: 'payments', path: '/customer/payments'),
  transfers(name: 'transfers', path: '/customer/transfers'),
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