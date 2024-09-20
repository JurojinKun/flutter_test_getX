import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_getx/app/data/api_service.dart';
import 'package:flutter_test_getx/app/models/pokemon.dart';
import 'package:flutter_test_getx/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_test_getx/app/translations/translations_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SearchingController extends GetxController {
  final _box = GetStorage();
  final _key = 'recentsSearch';

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
    recentsSearch(_loadRecentsSearchFromBox());
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
    if (name.trim().isNotEmpty) {
      try {
        isSearching.value = true;
        List<Pokemon> pokemons = Get.find<HomeController>().pokemons;
        resultsSearch(searchPokemonByPartialName(name, pokemons));
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
        errorMessage(e.toString());
      } finally {
        isSearching.value = false;
      }
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

  List<Pokemon> _loadRecentsSearchFromBox() {
    List pokemonData = _box.read(_key) ?? [];
    List<Pokemon> pokemons =
        pokemonData.map((data) => Pokemon.fromJSON(data)).toList();
    return pokemons;
  }

  void _saveRecentsSearchToBox(List<Pokemon> pokemons) {
    List<Map<String, dynamic>> pokemonJsonList =
        pokemons.map((pokemon) => pokemon.toJson()).toList();
    _box.write(_key, pokemonJsonList);
  }

  void addPokemonToRecentSearch(Pokemon pokemon) {
    if (!recentsSearch.contains(pokemon)) {
      recentsSearch.add(pokemon);
    } else {
      movePokemonToFirstIndex(recentsSearch, pokemon);
    }
    _saveRecentsSearchToBox(recentsSearch);
  }

  void removePokemonToRecentSearch(Pokemon pokemon) {
    recentsSearch.removeWhere((item) => item.id == pokemon.id);
    _saveRecentsSearchToBox(recentsSearch);
  }

  void movePokemonToFirstIndex(List<Pokemon> pokemons, Pokemon pokemonToMove) {
    if (pokemons.indexWhere((pokemon) => pokemon.id == pokemonToMove.id) != 0) {
      pokemons.remove(pokemonToMove);
      pokemons.insert(0, pokemonToMove);
    }
  }
}
