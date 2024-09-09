import 'package:flutter/material.dart';
import 'package:flutter_test_getx/rooter/navigation_controller.dart';
import 'package:flutter_test_getx/views/home/home_view.dart';
import 'package:flutter_test_getx/views/search/search_view.dart';
import 'package:flutter_test_getx/views/settings/settings_view.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter test getx',
      defaultTransition: Transition.fade,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const NavigationController()),
        GetPage(name: '/home', page: () => const HomeView()),
        GetPage(name: '/search', page: () => const SearchView()),
        GetPage(name: '/settings', page: () => const SettingsView()),
      ],
    );
  }
}
