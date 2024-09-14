import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_getx/app/widgets/app_bar_custom.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width,
                AppBar().preferredSize.height),
            child: AppBarCustom(
              leading: IconButton(onPressed: () => Get.back(), icon: const Icon(CupertinoIcons.back, size: 30.0)),
              title: "ProfileView")),
      body: const Center(
        child: Text(
          'ProfileView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
