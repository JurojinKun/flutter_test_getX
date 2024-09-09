import 'dart:ui';

import 'package:flutter/material.dart';

class NavigationBarCustom extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onDestinationSelected;

  const NavigationBarCustom(
      {super.key,
      required this.currentIndex,
      required this.onDestinationSelected});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
      child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: NavigationBar(
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.white,
            indicatorColor: Theme.of(context).colorScheme.inversePrimary,
            indicatorShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 6,
            destinations: const [
              NavigationDestination(label: 'Home', icon: Icon(Icons.home)),
              NavigationDestination(label: 'Search', icon: Icon(Icons.search)),
              NavigationDestination(
                  label: 'Settings', icon: Icon(Icons.settings)),
            ],
            selectedIndex: currentIndex,
            onDestinationSelected: onDestinationSelected,
          )),
    );
  }
}
