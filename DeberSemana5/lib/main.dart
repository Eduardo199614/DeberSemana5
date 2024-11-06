import 'package:flutter/material.dart';
import 'package:sqflite_example/database/database_helper.dart';
import 'package:sqflite_example/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper.instance.init(); // Inicializar la base de datos
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Computadora CRUD',
      home: HomeScreen(),
    );
  }
}
