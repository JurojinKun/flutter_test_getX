import 'package:flutter/material.dart';
import 'package:flutter_test_getx/views/home/home_view.dart';
import 'package:flutter_test_getx/views/search/search_view.dart';
import 'package:flutter_test_getx/views/settings/settings_view.dart';
import 'package:flutter_test_getx/widgets/navigation_bar_custom.dart';

class NavigationController extends StatefulWidget {
  const NavigationController({super.key});

  @override
  State<NavigationController> createState() => _NavigationControllerState();
}

class _NavigationControllerState extends State<NavigationController> {
  int currentIndex = 0;

  void _goBranch(int index) async {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: NavigationBarCustom(
          currentIndex: currentIndex,
          onDestinationSelected: (index) => _goBranch(index)),
      body: IndexedStack(
        index: currentIndex,
        children: const [HomeView(), SearchView(), SettingsView()],
      ),
    );
  }
}
