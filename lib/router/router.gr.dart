// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:food_ecom_sample/pages/animation_page/animation_page.dart'
    as _i1;
import 'package:food_ecom_sample/pages/cart_page/cart_page.dart' as _i2;
import 'package:food_ecom_sample/pages/home_page/home_page.dart' as _i3;
import 'package:food_ecom_sample/pages/landing_page/landing_page.dart' as _i4;
import 'package:food_ecom_sample/pages/login_page/login_page.dart' as _i5;
import 'package:food_ecom_sample/pages/menu_detail_page/menu_detail_page.dart'
    as _i6;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    AnimationRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AnimationPage(),
      );
    },
    CartRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.CartPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomePage(),
      );
    },
    LandingRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.LandingPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.LoginPage(),
      );
    },
    MenuDetailRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.MenuDetailPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AnimationPage]
class AnimationRoute extends _i7.PageRouteInfo<void> {
  const AnimationRoute({List<_i7.PageRouteInfo>? children})
      : super(
          AnimationRoute.name,
          initialChildren: children,
        );

  static const String name = 'AnimationRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CartPage]
class CartRoute extends _i7.PageRouteInfo<void> {
  const CartRoute({List<_i7.PageRouteInfo>? children})
      : super(
          CartRoute.name,
          initialChildren: children,
        );

  static const String name = 'CartRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute({List<_i7.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i4.LandingPage]
class LandingRoute extends _i7.PageRouteInfo<void> {
  const LandingRoute({List<_i7.PageRouteInfo>? children})
      : super(
          LandingRoute.name,
          initialChildren: children,
        );

  static const String name = 'LandingRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i5.LoginPage]
class LoginRoute extends _i7.PageRouteInfo<void> {
  const LoginRoute({List<_i7.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i6.MenuDetailPage]
class MenuDetailRoute extends _i7.PageRouteInfo<void> {
  const MenuDetailRoute({List<_i7.PageRouteInfo>? children})
      : super(
          MenuDetailRoute.name,
          initialChildren: children,
        );

  static const String name = 'MenuDetailRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}
