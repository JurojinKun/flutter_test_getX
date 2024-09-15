import 'package:flutter/material.dart';
import 'package:flutter_test_getx/app/widgets/app_bar_custom.dart';

import 'package:get/get.dart';

import '../controllers/searching_controller.dart';

class SearchingView extends GetView<SearchingController> {
  const SearchingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width,
                AppBar().preferredSize.height),
            child: AppBarCustom(title: "searching.title".tr)),
      body: const Center(
        child: Text(
          'SearchingView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
