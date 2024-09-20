import 'package:flutter/material.dart';

class FontSizes {
  static const double titleAppBar = 23.0;
  static const double titleNavBar = 15.0;

  static textStyleCustomPokemonHollow(Color color, double fontSize,
      [TextDecoration? decoration, Color? backgroundColor]) {
    return TextStyle(
        fontFamily: 'PokemonHollow',
        fontSize: fontSize,
        color: color,
        decoration: decoration,
        backgroundColor: backgroundColor);
  }

  static textStyleCustomPokemonSolid(Color color, double fontSize,
      [TextDecoration? decoration, Color? backgroundColor]) {
    return TextStyle(
        fontFamily: 'PokemonSolid',
        fontSize: fontSize,
        color: color,
        decoration: decoration,
        backgroundColor: backgroundColor);
  }
}