import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/searching_controller.dart';

class SearchingView extends GetView<SearchingController> {
  final TextEditingController _searchController = TextEditingController();

  SearchingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _appBarWithSearch(context),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: 23,
        itemBuilder: (_, index) {
        return Container(
          color: Theme.of(context).colorScheme.primary,
          height: 100,
          margin: const EdgeInsets.all(10.0),
        );
      }),
    );
  }

  AppBar _appBarWithSearch(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor:
          Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5),
      flexibleSpace: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: SafeArea(
              child: Material(
                elevation: 6,
                borderRadius: BorderRadius.circular(15.0),
                child: TextField( 
                  controller: _searchController,
                  textInputAction: TextInputAction.search,              
                  decoration: InputDecoration(
                    hintText: 'Rechercher un pokémon...',
                    hintStyle: TextStyle(color: Theme.of(context).indicatorColor.withOpacity(0.5)),
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.secondary,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
                  ),
                  style: TextStyle(color: Theme.of(context).indicatorColor.withOpacity(0.8)),
                  onSubmitted: (value) async => await controller.searchPokemon(value),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
