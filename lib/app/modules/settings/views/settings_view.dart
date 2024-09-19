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
            child: AppBarCustom(title: "settings.title".tr)),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Column(
              children: [_changeTheme(context), _changeTranslations(context)],
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
      title: Text("settings.theme.title".tr),
      subtitle: Text("settings.theme.content".tr),
      trailing: Obx(
        () => CupertinoSwitch(
          activeColor: Theme.of(context).colorScheme.primary,
          trackColor: Theme.of(context).colorScheme.primary,
          thumbColor: Theme.of(context).colorScheme.secondary,
          value: controller.currentTheme.value == ThemeMode.dark,
          onChanged: (value) {
            controller.switchTheme();
          },
        ),
      ),
    );
  }

  Widget _changeTranslations(BuildContext context) {
    return ListTile(
      iconColor: Theme.of(context).indicatorColor,
      titleTextStyle: FontSizes.textStyleCustomPokemonSolid(
          Theme.of(context).indicatorColor, 20.0),
      subtitleTextStyle: FontSizes.textStyleCustomPokemonSolid(
          Theme.of(context).indicatorColor, 15.0),
      leading: const Icon(
        Icons.language,
        size: 30,
      ),
      title: Text("settings.language.title".tr),
      subtitle: Text("settings.language.content".tr),
      trailing: Obx(
        () => Padding(
          padding: const EdgeInsets.only(right: 5.0),
          child: DropdownButton<Locale>(
            iconSize: 20.0,
            icon: const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Icon(CupertinoIcons.chevron_down),
            ),
            dropdownColor: Theme.of(context).colorScheme.secondary,
            elevation: 6,
            items: [
              DropdownMenuItem(
                value: const Locale("fr"),
                child: Text("settings.french".tr),
              ),
              DropdownMenuItem(
                value: const Locale("en"),
                child: Text("settings.english".tr),
              ),
            ],
            value: controller.currentLocale.value,
            onChanged: (locale) {
              // Assurez-vous que vous appelez la fonction correctement
              if (locale != null) {
                controller.switchLocaleLanguage(locale);
              }
            },
          ),
        ),
      ),
    );
  }
}
