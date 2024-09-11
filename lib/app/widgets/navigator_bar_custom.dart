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
    return NavigationBar(
      elevation: 6,
      destinations: const [
        NavigationDestination(label: 'Home', icon: Icon(Icons.home)),
        NavigationDestination(label: 'Search', icon: Icon(Icons.search)),
        NavigationDestination(label: 'Settings', icon: Icon(Icons.settings)),
      ],
      selectedIndex: currentIndex,
      onDestinationSelected: onDestinationSelected,
    );
  }
}
