import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  final VoidCallback onRetry;

  const ErrorMessage({super.key, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Une erreur est survenue, veuillez réessayer"),
          const SizedBox(height: 20),
          IconButton(
              onPressed: onRetry, icon: const Icon(CupertinoIcons.restart))
        ],
      ),
    );
  }
}
