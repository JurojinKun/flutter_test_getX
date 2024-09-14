import 'dart:ui';

import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget {
  final Widget? leading;
  final String title;
  const AppBarCustom({super.key, this.leading, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5),
      leading: leading,
      title: Text(
        title,
      ),
      centerTitle: true,
      flexibleSpace: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            color: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
