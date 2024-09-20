import 'package:flutter/material.dart';
import 'package:flutter_test_getx/app/modules/navigator/controllers/navigator_controller.dart';
import 'package:flutter_test_getx/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SettingsWrapper extends StatelessWidget {
  const SettingsWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsNavigatorKey =
        Get.find<NavigatorController>().settingsNavigatorKey;

    return NavigatorPopHandler(
      onPop: () {
        if (settingsNavigatorKey!
            .currentState!
            .canPop()) {
          Get.back(id: 3);
        }
      },
      child: Navigator(
        key: settingsNavigatorKey,
        initialRoute: Routes.settings,
        onGenerateRoute: (routeSettings) =>
            AppPages.generateRouteSettings(routeSettings),
      ),
    );
  }
}
