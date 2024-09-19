import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_getx/app/models/pokemon.dart';
import 'package:flutter_test_getx/app/routes/app_pages.dart';
import 'package:flutter_test_getx/app/translations/translations_service.dart';
import 'package:flutter_test_getx/app/widgets/loading_custom.dart';

import 'package:get/get.dart';

import '../controllers/searching_controller.dart';

class SearchingView extends GetView<SearchingController> {
  const SearchingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: _appBarWithSearch(context),
        body: _body());
  }

  AppBar _appBarWithSearch(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor:
          Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5),
      flexibleSpace: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: SafeArea(
              child: Material(
                elevation: 6,
                borderRadius: BorderRadius.circular(15.0),
                child: TextField(
                  controller: controller.searchController,
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                      hintText: 'Rechercher un pokémon...',
                      hintStyle: TextStyle(
                          color: Theme.of(context)
                              .indicatorColor
                              .withOpacity(0.5)),
                      filled: true,
                      fillColor: Theme.of(context).colorScheme.secondary,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 0.0, horizontal: 20.0),
                      suffixIcon: IconButton(
                          onPressed: () async => await controller
                              .searchPokemon(controller.searchText.value),
                          icon: Icon(
                            CupertinoIcons.search,
                            color: Theme.of(context)
                                .indicatorColor
                                .withOpacity(0.5),
                          ))),
                  style: TextStyle(
                      color: Theme.of(context).indicatorColor.withOpacity(0.8)),
                  onSubmitted: (value) async =>
                      await controller.searchPokemon(value),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _body() {
    return Obx(() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: controller.searchText.value.trim().isEmpty
            ? _recentsSearch()
            : _resultsSearch()));
  }

  Widget _recentsSearch() {
    return controller.recentsSearch.isEmpty
        ? const Center(
            child:
                Text("Pas de recherches récentes", textAlign: TextAlign.center),
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: controller.recentsSearch.length,
            itemBuilder: (_, index) {
              Pokemon pokemon = controller.recentsSearch[index];
              return _itemLisTile(pokemon, true);
            });
  }

  Widget _resultsSearch() {
    return controller.isSearching.value
        ? const LoadingCustom()
        : controller.resultsSearch.isEmpty
            ? const Center(
                child: Text("Pas de résultats", textAlign: TextAlign.center),
              )
            : ListView.builder(
                shrinkWrap: true,
                itemCount: controller.resultsSearch.length,
                itemBuilder: (_, index) {
                  Pokemon pokemon = controller.resultsSearch[index];
                  return _itemLisTile(pokemon, false);
                });
  }

  Widget _itemLisTile(Pokemon pokemon, bool trailing) {
    return ListTile(
      onTap: () {
        controller.addPokemonToRecentSearch(pokemon);
        Get.toNamed(Routes.profile, arguments: pokemon);
      },
      leading: Image.network(pokemon.imageUrl),
      title: Text(TranslationsService().localeLanguageApp == const Locale('fr')
          ? pokemon.nameFr
          : pokemon.nameEn),
      subtitle: Text("Pokédex #${pokemon.id.toString()}"),
      trailing: trailing
          ? IconButton(
              onPressed: () => controller.removePokemonToRecentSearch(pokemon),
              icon: const Icon(CupertinoIcons.clear))
          : const SizedBox(),
    );
  }
}
