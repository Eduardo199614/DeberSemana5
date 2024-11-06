import 'package:flutter/material.dart';
import 'package:sqflite_example/database/computadora_dao.dart';
import '../models/computadora_model.dart';

class EditComputerScreen extends StatefulWidget {
  final ComputadoraModel computadora;

  EditComputerScreen({required this.computadora});

  @override
  _EditComputerScreenState createState() => _EditComputerScreenState();
}

class _EditComputerScreenState extends State<EditComputerScreen> {
  final _formKey = GlobalKey<FormState>();
  final _procesadorController = TextEditingController();
  final _discoDuroController = TextEditingController();
  final _ramController = TextEditingController();
  final computerDao = ComputerDao();

  @override
  void initState() {
    super.initState();
    _procesadorController.text = widget.computadora.procesador;
    _discoDuroController.text = widget.computadora.discoDuro;
    _ramController.text = widget.computadora.ram;
  }

  @override
  void dispose() {
    _procesadorController.dispose();
    _discoDuroController.dispose();
    _ramController.dispose();
    super.dispose();
  }

  Future<void> _updateComputer() async {
    if (_formKey.currentState!.validate()) {
      final updatedComputer = ComputadoraModel(
        id: widget.computadora.id,
        procesador: _procesadorController.text,
        discoDuro: _discoDuroController.text,
        ram: _ramController.text,
      );
      await computerDao.update(updatedComputer);
      Navigator.pop(context, updatedComputer);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Editar Computadora')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _procesadorController,
                decoration: InputDecoration(labelText: 'Procesador'),
                validator: (value) =>
                    value!.isEmpty ? 'Ingrese el procesador' : null,
              ),
              TextFormField(
                controller: _discoDuroController,
                decoration: InputDecoration(labelText: 'Disco Duro'),
                validator: (value) =>
                    value!.isEmpty ? 'Ingrese el disco duro' : null,
              ),
              TextFormField(
                controller: _ramController,
                decoration: InputDecoration(labelText: 'RAM'),
                validator: (value) => value!.isEmpty ? 'Ingrese la RAM' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _updateComputer,
                child: Text('Guardar cambios'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
