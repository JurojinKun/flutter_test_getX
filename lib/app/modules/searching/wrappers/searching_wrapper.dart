import 'package:flutter/material.dart';
import 'package:flutter_test_getx/app/modules/navigator/controllers/navigator_controller.dart';
import 'package:flutter_test_getx/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SearchingWrapper extends StatelessWidget {
  const SearchingWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final searchingNavigatorKey = Get.find<NavigatorController>()
              .searchingNavigatorKey;

    return NavigatorPopHandler(
      onPop: () {
        if (searchingNavigatorKey!
            .currentState!
            .canPop()) {
          Get.back(id: 2);
        }
      },
      child: Navigator(
        key: searchingNavigatorKey,
        initialRoute: Routes.searching,
        onGenerateRoute: (routeSettings) =>
            AppPages.generateRouteSearching(routeSettings),
      ),
    );
  }
}
