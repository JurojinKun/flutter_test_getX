import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Home"),
      ),
      body: Stack(
        children: [
          GridView.builder(
      padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, MediaQuery.of(context).padding.bottom + 10.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 5.0, crossAxisSpacing: 5.0),
        itemCount: _counter,
        itemBuilder: (_, index) {
          return _itemList(index);
        }),
        Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: EdgeInsets.only(
            right: 15.0,
            bottom: MediaQuery.of(context).padding.bottom + 10.0
          ),
          child: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
                ),
        ))
        ],
      ),
    );
  }

  Widget _itemList(int index) {
    return SizedBox(
      height: 150,
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        elevation: 6,
        shadowColor: Theme.of(context).colorScheme.primary,
        child: Center(
          child: Text(index.toString()),
        ),
      ),
    );
  }
}
