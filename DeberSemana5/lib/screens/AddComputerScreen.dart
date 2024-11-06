import 'package:flutter/material.dart';
import 'package:sqflite_example/database/computadora_dao.dart';
import 'package:sqflite_example/models/computadora_model.dart';

class AddComputerScreen extends StatelessWidget {
  final _procesadorController = TextEditingController();
  final _discoDuroController = TextEditingController();
  final _ramController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Agregar Computadora')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _procesadorController,
              decoration: InputDecoration(labelText: 'Procesador'),
            ),
            TextField(
              controller: _discoDuroController,
              decoration: InputDecoration(labelText: 'Disco Duro'),
            ),
            TextField(
              controller: _ramController,
              decoration: InputDecoration(labelText: 'RAM'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final computer = ComputadoraModel(
                  procesador: _procesadorController.text,
                  discoDuro: _discoDuroController.text,
                  ram: _ramController.text,
                );
                await ComputerDao().insert(computer);
                Navigator.pop(context);
              },
              child: Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}
