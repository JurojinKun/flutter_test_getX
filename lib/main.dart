import 'package:flutter/material.dart';
import 'package:flutter_test_getx/app/theme/custom_theme.dart';
import 'package:flutter_test_getx/app/theme/theme_service.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Test Getx",
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      themeMode: ThemeService().theme,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    );
  }
}
