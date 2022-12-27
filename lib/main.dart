import 'package:flutter/material.dart';
import 'package:rd/widgets/list_dogs.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite/sqflite.dart';

import 'dart:io' show Platform;

void main() {
  if (Platform.isWindows || Platform.isLinux) {
    // Initialize FFI
    sqfliteFfiInit();
  }
  databaseFactory = databaseFactoryFfi;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sick doggos',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const ListDogs(),
    );
  }
}
