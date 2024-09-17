import 'package:flutter/material.dart';
import 'package:flutter_test_getx/app/models/pokemon.dart';
import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/navigator/bindings/navigator_binding.dart';
import '../modules/navigator/views/navigator_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/searching/bindings/searching_binding.dart';
import '../modules/searching/views/searching_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.navigator;

  static final routes = [
    GetPage(
      name: Routes.navigator,
      page: () => const NavigatorView(),
      binding: NavigatorBinding(),
    ),
    GetPage(
      name: Routes.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.settings,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: Routes.searching,
      page: () => const SearchingView(),
      binding: SearchingBinding(),
    ),
    GetPage(
      name: Routes.profile,
      page: () {
        final Pokemon pokemon = Get.arguments as Pokemon;
        return ProfileView(pokemon: pokemon);
      },
      binding: ProfileBinding(),
    ),
  ];

  static Route<dynamic>? generateRouteHome(RouteSettings routeSettings) {
    if (routeSettings.name == Routes.home) {
      return GetPageRoute(
          routeName: Routes.home,
          page: () => HomeView(),
          binding: HomeBinding());
    } else if (routeSettings.name == Routes.profile) {
      final pokemon = routeSettings.arguments as Pokemon;
      return GetPageRoute(
          routeName: Routes.profile,
          page: () => ProfileView(pokemon: pokemon),
          binding: ProfileBinding());
    }
    return null;
  }

  static Route<dynamic>? generateRouteSearching(RouteSettings routeSettings) {
    if (routeSettings.name == Routes.searching) {
      return GetPageRoute(
          routeName: Routes.home,
          page: () => const SearchingView(),
          binding: SearchingBinding());
    }
    return null;
  }

  static Route<dynamic>? generateRouteSettings(RouteSettings routeSettings) {
    if (routeSettings.name == Routes.settings) {
      return GetPageRoute(
          routeName: Routes.home,
          page: () => const SettingsView(),
          binding: SettingsBinding());
    }
    return null;
  }
}
