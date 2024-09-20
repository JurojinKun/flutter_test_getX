import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_getx/app/models/pokemon.dart';
import 'package:flutter_test_getx/app/translations/translations_service.dart';
import 'package:flutter_test_getx/app/widgets/app_bar_custom.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  final Pokemon pokemon;
  const ProfileView({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
          preferredSize: Size(
              MediaQuery.of(context).size.width, AppBar().preferredSize.height),
          child: AppBarCustom(
              leading: IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(CupertinoIcons.back, size: 30.0)),
              title:
                  TranslationsService().localeLanguageApp == const Locale('fr')
                      ? pokemon.nameFr
                      : pokemon.nameEn)),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 15.0),
        child: Column(
          children: [_cardPokemon(context)],
        ),
      )),
    );
  }

  Widget _cardPokemon(BuildContext context) {
    return Material(
        elevation: 6.0,
        borderRadius: BorderRadius.circular(15.0),
        child: SizedBox(
            height: 300.0,
            child: Stack(
              children: [
                Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(0.2),
                        borderRadius: BorderRadius.circular(15.0),
                        image: DecorationImage(
                            image: NetworkImage(pokemon.imageUrl),
                            fit: BoxFit.contain))),
              ],
            )));
  }
}
