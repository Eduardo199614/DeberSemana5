import 'package:flutter/material.dart';
import 'package:sqflite_example/screens/AddComputerScreen.dart';
import 'package:sqflite_example/screens/ViewComputersScreen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Gestión de Computadoras')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddComputerScreen()),
                );
              },
              child: Text('Agregar Computadora'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ViewComputersScreen()),
                );
              },
              child: Text('Ver Computadoras'),
            ),
          ],
        ),
      ),
    );
  }
}
