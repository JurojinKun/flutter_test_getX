import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'fr': {
          "home.title": "Accueil",
          "searching.title": "Recherche",
          "searching.search": "Rechercher un pokémon...",
          "searching.no_recents": "Pas de recherches récentes",
          "searching.no_results": "Pas de résultats",
          "settings.title": "Paramètres",
          "settings.theme.title": "Thème",
          "settings.theme.content": "Changer le thème",
          "settings.language.title": "Langue",
          "settings.language.content": "Changer la langue",
          "settings.french": "Français",
          "settings.english": "Anglais",
          "profile.title": "Profil"
        },
        'en': {
          "home.title": "Home",
          "searching.title": "Search",
          "searching.search": "Search a pokemon",
          "searching.no_recents": "No recent searches",
          "searching.no_results": "No results",
          "settings.title": "Settings",
          "settings.theme.title": "Theme",
          "settings.theme.content": "Change theme",
          "settings.language.title": "Language",
          "settings.language.content": "Change language",
          "settings.french": "Français",
          "settings.english": "English",
          "profile.title": "Profile"
        }
      };
}
