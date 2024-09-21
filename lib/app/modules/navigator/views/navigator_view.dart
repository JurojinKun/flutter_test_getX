import 'package:flutter/material.dart';
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
          children: [
            controller.homeWrapper.value ?? const SizedBox(),
            controller.searchWrapper.value ?? const SizedBox(),
            controller.settingsWrapper.value ?? const SizedBox(),
          ],
        ),
        bottomNavigationBar: NavigationBarCustom(
            currentIndex: controller.currentIndex.value,
            onDestinationSelected: (index) => controller.changeIndex(index)),
      ),
    );
  }
}
