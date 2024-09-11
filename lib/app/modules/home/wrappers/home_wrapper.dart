import 'package:flutter/material.dart';
import 'package:flutter_test_getx/app/modules/navigator/controllers/navigator_controller.dart';
import 'package:flutter_test_getx/app/routes/app_pages.dart';
import 'package:get/get.dart';

class HomeWrapper extends StatelessWidget {
  const HomeWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final homeNavigatorKey = Get.find<NavigatorController>()
              .homeNavigatorKey;

    return NavigatorPopHandler(
        onPop: () {
          if (homeNavigatorKey!
              .currentState!
              .canPop()) {
            Get.back(id: 1);
          }
        },
        child: Navigator(
          key: homeNavigatorKey,
          initialRoute: Routes.home,
          onGenerateRoute: (routeSettings) =>
              AppPages.generateRouteHome(routeSettings),
        ));
  }
}
