import 'package:flutter/material.dart';
import 'package:rd/widgets/input_dog.dart';

class ListDogs extends StatefulWidget {
  const ListDogs({super.key});

  @override
  State<ListDogs> createState() => _ListDogsState();
}

class _ListDogsState extends State<ListDogs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("List dogs")),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => const InputDog()),
        ),
      ),
    );
  }
}
