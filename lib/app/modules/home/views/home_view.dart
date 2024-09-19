import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_test_getx/app/models/pokemon.dart';
import 'package:flutter_test_getx/app/routes/app_pages.dart';
import 'package:flutter_test_getx/app/translations/translations_service.dart';
import 'package:flutter_test_getx/app/widgets/app_bar_custom.dart';
import 'package:flutter_test_getx/app/widgets/error_message.dart';
import 'package:flutter_test_getx/app/widgets/loading_custom.dart';

import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final appBar = AppBar();
  final RefreshController _refreshController = RefreshController();

  HomeView({super.key});

  void _onLoading() async {
    await controller.fetchMoreDataHome();
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width,
                AppBar().preferredSize.height),
            child: AppBarCustom(title: "home.title".tr)),
        body: Obx(() {
          if (controller.isLoading.value) {
            return const LoadingCustom();
          } else if (controller.errorMessage.isNotEmpty) {
            return ErrorMessage(onRetry: controller.retryFetchDataHome);
          } else {
            return SmartRefresher(
              enablePullDown: false,
              enablePullUp: true,
              controller: _refreshController,
              footer: CustomFooter(
                  height: MediaQuery.of(context).padding.bottom + 55.0,
                  builder: (_, mode) {
                    Widget body;
                    if (mode == LoadStatus.loading) {
                      body = const SizedBox(
                        height: 25.0,
                        width: 25.0,
                        child: LoadingCustom(),
                      );
                    } else if (mode == LoadStatus.noMore) {
                      body = const SizedBox();
                    } else {
                      body = const SizedBox();
                    }
                    return SizedBox(
                      height: 55.0,
                      child: Center(child: body),
                    );
                  }),
              onLoading: () => _onLoading(),
              child: GridView.builder(
                  padding: EdgeInsets.fromLTRB(
                      15.0,
                      appBar.preferredSize.height +
                          MediaQuery.of(context).padding.top +
                          25.0,
                      15.0,
                      15.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15.0,
                      crossAxisSpacing: 15.0),
                  shrinkWrap: false,
                  itemCount: controller.pokemons.length,
                  itemBuilder: (_, index) {
                    Pokemon pokemon = controller.pokemons[index];
                    return _itemGridView(context, pokemon);
                  }),
            );
          }
        }));
  }

  _itemGridView(BuildContext context, Pokemon pokemon) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.profile,
          arguments:
              pokemon), //add id:number corresponds to nested key wrapper to stack navigation bottom bar,
      child: Card(
        color: Theme.of(context).colorScheme.secondary.withOpacity(0.9),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        elevation: 6,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text("#${pokemon.id.toString()}"),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(pokemon.imageUrl),
                  Text(TranslationsService().localeLanguageApp ==
                          const Locale('fr')
                      ? pokemon.nameFr
                      : pokemon.nameEn)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
