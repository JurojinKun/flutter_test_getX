import 'package:flutter/foundation.dart';
import 'package:flutter_test_getx/app/data/api_service.dart';
import 'package:get/get.dart';

class SearchingController extends GetxController {
  Rx<String> errorMessage = ''.obs;

  final ApiService apiService = ApiService();

  Future<void> searchPokemon(String name) async {
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
