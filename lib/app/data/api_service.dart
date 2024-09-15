import 'package:flutter_test_getx/app/models/pokemon.dart';
import 'package:get/get.dart';

class ApiService extends GetConnect {
  Future<List<Pokemon>> getPokemons() async {
    List<Pokemon> pokemons = [];

    try {
      String url = 'https://pokeapi.co/api/v2/pokemon';
      final queryParams = {
        'limit': '151',
      };

      final response = await get(url, query: queryParams);

      if (response.status.hasError) {
        throw Exception('Failed to load data: ${response.statusText}');
      } else {
        for (var pokemon in response.body["results"]) {
          pokemons.add(Pokemon.fromJSON(pokemon));
        }
        return pokemons;
      }
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }
}
