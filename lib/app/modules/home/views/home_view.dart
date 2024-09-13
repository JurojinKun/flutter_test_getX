import 'package:flutter/material.dart';
import 'package:flutter_test_getx/app/routes/app_pages.dart';
import 'package:flutter_test_getx/app/widgets/app_bar_custom.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width,
                AppBar().preferredSize.height),
            child: const AppBarCustom(title: "HomeView")),
        body: ListView.builder(
            itemCount: 25,
            itemBuilder: (_, index) {
              return GestureDetector(
                onTap: () => Get.toNamed(Routes
                    .profile), //add id:number corresponds to nested key wrapper to stack navigation bottom bar,
                child: Container(
                  margin: const EdgeInsets.all(15.0),
                  height: 50.0,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              );
            }));
  }
}
