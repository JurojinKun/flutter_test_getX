import 'package:flutter/foundation.dart';
import 'package:flutter_test_getx/app/data/api_service.dart';
import 'package:flutter_test_getx/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

class SearchingController extends GetxController {
  Rx<String> errorMessage = ''.obs;

  final ApiService apiService = ApiService();

  Future<void> searchPokemon(String name) async {
    print(Get.find<HomeController>().pokemons.length);
    try {
      await apiService.searchPokemonByName(name);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      errorMessage(e.toString());
    }
  }
}
