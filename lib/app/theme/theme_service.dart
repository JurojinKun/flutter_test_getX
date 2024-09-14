import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeService {
  final _box = GetStorage(); // Stockage local avec GetStorage
  final _key = 'isDarkMode';

  // Récupère le thème actuel (si c'est sombre ou clair)
  ThemeMode get theme => _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  // Bascule le thème et sauvegarde dans le stockage local
  void switchTheme() {
    Get.changeThemeMode(_loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    _saveThemeToBox(!_loadThemeFromBox());
  }

  // Charge le thème depuis le stockage local
  bool _loadThemeFromBox() => _box.read(_key) ?? false;

  // Sauvegarde le thème dans le stockage local
  void _saveThemeToBox(bool isDarkMode) => _box.write(_key, isDarkMode);
}
