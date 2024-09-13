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
    return Container(
      height: 100.0,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0))),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)))),
          ),
          Align(
            alignment: AlignmentDirectional.center,
            child: NavigationBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              destinations: const [
                NavigationDestination(label: 'Home', icon: Icon(Icons.home)),
                NavigationDestination(
                    label: 'Search', icon: Icon(Icons.search)),
                NavigationDestination(
                    label: 'Settings', icon: Icon(Icons.settings)),
              ],
              selectedIndex: currentIndex,
              onDestinationSelected: onDestinationSelected,
            ),
          )
        ],
      ),
    );
  }
}
