import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_getx/app/theme/custom_font_sizes.dart';
import 'package:flutter_test_getx/app/widgets/app_bar_custom.dart';

import 'package:get/get.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width,
                AppBar().preferredSize.height),
            child: const AppBarCustom(title: "SettingsView")),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _changeTheme(context),
              ],
            ),
          ),
        ));
  }

  Widget _changeTheme(BuildContext context) {
    return ListTile(
      iconColor: Theme.of(context).indicatorColor,
      titleTextStyle: FontSizes.textStyleCustomPokemonSolid(
          Theme.of(context).indicatorColor, 20.0),
      subtitleTextStyle: FontSizes.textStyleCustomPokemonSolid(
          Theme.of(context).indicatorColor, 15.0),
      leading: const Icon(
        CupertinoIcons.brightness,
        size: 30,
      ),
      title: const Text("Thème"),
      subtitle: const Text("Changer le thème"),
      trailing: Obx(
        () => Switch(
          value: controller.currentTheme.value == ThemeMode.dark,
          onChanged: (value) {
            controller.switchTheme();
          },
        ),
      ),
    );
  }
}
