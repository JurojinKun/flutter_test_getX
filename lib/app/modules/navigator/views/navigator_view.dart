import 'package:flutter/material.dart';
import 'package:flutter_test_getx/app/modules/home/wrappers/home_wrapper.dart';
import 'package:flutter_test_getx/app/modules/searching/wrappers/searching_wrapper.dart';
import 'package:flutter_test_getx/app/modules/settings/wrappers/settings_wrapper.dart';
import 'package:flutter_test_getx/app/widgets/navigator_bar_custom.dart';

import 'package:get/get.dart';

import '../controllers/navigator_controller.dart';

class NavigatorView extends GetView<NavigatorController> {
  const NavigatorView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        extendBody: true,
        body: IndexedStack(
          index: controller.currentIndex.value,
          children: const [
            HomeWrapper(),
            SearchingWrapper(),
            SettingsWrapper()
          ],
        ),
        bottomNavigationBar: NavigationBarCustom(
            currentIndex: controller.currentIndex.value,
            onDestinationSelected: (index) => controller.changeIndex(index)),
      ),
    );
  }
}
