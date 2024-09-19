import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_getx/app/data/api_service.dart';
import 'package:flutter_test_getx/app/models/pokemon.dart';
import 'package:flutter_test_getx/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_test_getx/app/translations/translations_service.dart';
import 'package:get/get.dart';

class SearchingController extends GetxController {
  Rx<String> errorMessage = ''.obs;

  late TextEditingController searchController;
  Rx<String> searchText = ''.obs;

  RxList<Pokemon> recentsSearch = <Pokemon>[].obs;
  RxList<Pokemon> resultsSearch = <Pokemon>[].obs;
  Rx<bool> isSearching = false.obs;

  final ApiService apiService = ApiService();

  @override
  void onInit() async {
    searchController = TextEditingController();
    searchController.addListener(() async {
      searchText.value = searchController.text.trim();
      await searchPokemon(searchText.value);
    });
    super.onInit();
  }

  @override
  void onClose() {
    searchController.removeListener(() {
      searchText.value = searchController.text.trim();
    });
    searchController.dispose();
    super.onClose();
  }

  Future<void> searchPokemon(String name) async {
    try {
      if (name.trim().isNotEmpty) {
        List<Pokemon> pokemons = Get.find<HomeController>().pokemons;
        resultsSearch(searchPokemonByPartialName(name, pokemons));
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      errorMessage(e.toString());
    }
  }

  List<Pokemon> searchPokemonByPartialName(
      String name, List<Pokemon> pokemonList) {
    name = name.toLowerCase();
    return pokemonList.where((pokemon) {
      return TranslationsService().localeLanguageApp == const Locale('fr')
          ? pokemon.nameFr.toLowerCase().contains(name)
          : pokemon.nameEn.toLowerCase().contains(name);
    }).toList();
  }

  void addPokemonToRecentSearch(Pokemon pokemon) {
    recentsSearch.add(pokemon);
  }

  void removePokemonToRecentSearch(Pokemon pokemon) {
    recentsSearch.removeWhere((item) => item.id == pokemon.id);
  }
}
