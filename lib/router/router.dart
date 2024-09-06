import 'package:auto_route/auto_route.dart';
import 'package:food_ecom_sample/router/router.gr.dart';

@AutoRouterConfig() //needed for auto configureRoutes
class AppRouter extends $AppRouter {
  AppRouter();

  List<AutoRoute> get routes => [
        AutoRoute(page: LoginRoute.page, initial: true, path: '/login'),
        AutoRoute(page: HomeRoute.page, path: '/home'),
      ];
}
