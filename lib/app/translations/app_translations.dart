import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'fr': {
          "home.title": "Accueil",
          "searching.title": "Recherche",
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
