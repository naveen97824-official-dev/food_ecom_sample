import 'package:auto_route/auto_route.dart';
import 'package:food_ecom_sample/router/router.gr.dart';
import 'package:food_ecom_sample/store/state/app_state.dart';
import 'package:redux/redux.dart';

@AutoRouterConfig() //needed for auto configureRoutes
class AppRouter extends $AppRouter {
  final Store<AppState>? store;
  AppRouter({this.store});

  List<AutoRoute> get routes => [
        AutoRoute(
            page: LoginRoute.page,
            initial: (store != null &&
                    store!.state.loginState != null &&
                    store!.state.loginState!.userDetail != null &&
                    store!.state.loginState!.userDetail!.emailId != null)
                ? false
                : true,
            path: '/login'),
        AutoRoute(page: HomeRoute.page, path: '/home'),
        AutoRoute(
            page: LandingRoute.page,
            initial: (store != null &&
                    store!.state.loginState != null &&
                    store!.state.loginState!.userDetail != null &&
                    store!.state.loginState!.userDetail!.emailId != null)
                ? true
                : false,
            path: '/landing'),
        AutoRoute(page: MenuDetailRoute.page, path: '/menu_detail'),
        AutoRoute(page: CartRoute.page, path: '/cart'),
      ];
}
