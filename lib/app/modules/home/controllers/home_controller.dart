import 'package:flutter/foundation.dart';
import 'package:flutter_test_getx/app/data/api_service.dart';
import 'package:flutter_test_getx/app/models/pokemon.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  int currenPage = 0;
  Rx<bool> isLoading = true.obs;
  RxList<Pokemon> pokemons = <Pokemon>[].obs;
  Rx<String> errorMessage = ''.obs;

  final ApiService apiService = ApiService();

  @override
  void onInit() async {
    await fetchDataHome();
    super.onInit();
  }

  Future<void> fetchDataHome() async {
    try {
      pokemons(await apiService.getPokemons(currenPage));
      currenPage++;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      errorMessage(e.toString());
    } finally {
      isLoading(false);
    }
  }

  Future<void> fetchMoreDataHome() async {
    try {
      pokemons.addAll(await apiService.getPokemons(currenPage));
      currenPage++;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      errorMessage(e.toString());
    }
  }

  void retryFetchDataHome() {
    isLoading(true);
    errorMessage('');
    fetchDataHome();
  }
}
