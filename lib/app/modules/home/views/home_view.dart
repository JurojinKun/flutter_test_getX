import 'package:flutter/material.dart';
import 'package:flutter_test_getx/app/models/pokemon.dart';
import 'package:flutter_test_getx/app/routes/app_pages.dart';
import 'package:flutter_test_getx/app/widgets/app_bar_custom.dart';
import 'package:flutter_test_getx/app/widgets/error_message.dart';
import 'package:flutter_test_getx/app/widgets/loading_custom.dart';

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
            child: AppBarCustom(title: "home.title".tr)),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Obx(() {
            if (controller.isLoading.value) {
              return const LoadingCustom();
            } else if (controller.errorMessage.isNotEmpty) {
              return ErrorMessage(onRetry: controller.retryFetchDataHome);
            } else {
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15.0,
                      crossAxisSpacing: 15.0),
                  shrinkWrap: true,
                  itemCount: controller.pokemons.length,
                  itemBuilder: (_, index) {
                    Pokemon pokemon = controller.pokemons[index];
                    return _itemGridView(context, pokemon);
                  });
            }
          }),
        ));
  }

  _itemGridView(BuildContext context, Pokemon pokemon) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes
          .profile), //add id:number corresponds to nested key wrapper to stack navigation bottom bar,
      child: Card(
        color: Theme.of(context).colorScheme.secondary.withOpacity(0.9),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        elevation: 6,
        shadowColor: Theme.of(context).colorScheme.primary,
        child: Center(
          child: Text(pokemon.name),
        ),
      ),
    );
  }
}
