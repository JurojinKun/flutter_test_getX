import 'package:flutter/material.dart';
import 'package:flutter_test_getx/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
                children: [
        const Text(
          'HomeView is working',
          style: TextStyle(fontSize: 20),
        ),
        TextButton(
            onPressed: () => Get.toNamed(Routes.profile), //add id:number corresponds to nested key wrapper to stack navigation bottom bar
            child: const Text(
              "Go to profile",
              style: TextStyle(fontSize: 15),
            ))
                ],
              ),
      ),
    );
  }
}
