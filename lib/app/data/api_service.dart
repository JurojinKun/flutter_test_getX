import 'package:flutter_test_getx/app/models/pokemon.dart';
import 'package:get/get.dart';

class ApiService extends GetConnect {
  Future<List<Pokemon>> getPokemons(int page) async {
    int limit = 20;
    int offset = page * limit;
    String baseUrl = 'https://pokeapi.co/api/v2';
    try {
      final response = await get('$baseUrl/pokemon?limit=$limit&offset=$offset');
      List results = response.body['results'];

      return Future.wait(results.map((pokemon) async {
        String pokemonUrl = pokemon['url'];
        int id = int.parse(pokemonUrl.split('/').reversed.toList()[1]);

        // Fetch species for the name in the desired language
        final speciesResponse = await get('$baseUrl/pokemon-species/$id');
        final speciesData = speciesResponse.body;
        String nameFr = '';
        String nameEn = '';
        for (var name in speciesData['names']) {
          if (name['language']['name'] == 'fr') {
            nameFr = name['name'];
          } else if (name['language']['name'] == 'en') {
            nameEn = name['name'];
          }

          // Sortir de la boucle si les deux noms ont été trouvés
          if (nameFr.isNotEmpty && nameEn.isNotEmpty) break;
        }

        // Fetch image from the pokemon details
        final detailResponse = await get('$baseUrl/pokemon/$id');
        final sprites = detailResponse.body['sprites'];
        String imageUrl = sprites['front_default'];

        return Pokemon(
            id: id, nameFr: nameFr, nameEn: nameEn, imageUrl: imageUrl);
      }).toList());
    } catch (e) {
      throw Exception('Failed to load Pokémon: $e');
    }
  }
}
