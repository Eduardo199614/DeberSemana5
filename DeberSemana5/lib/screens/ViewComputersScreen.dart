import 'package:flutter/material.dart';
import 'package:sqflite_example/database/computadora_dao.dart';
import 'package:sqflite_example/models/computadora_model.dart';
import 'package:sqflite_example/screens/edit_computer_screen.dart';

class ViewComputersScreen extends StatefulWidget {
  @override
  _ViewComputersScreenState createState() => _ViewComputersScreenState();
}

class _ViewComputersScreenState extends State<ViewComputersScreen> {
  final computerDao = ComputerDao();
  late Future<List<ComputadoraModel>> computers;

  @override
  void initState() {
    super.initState();
    computers = computerDao.readAll();
  }

  Future<void> _refreshComputers() async {
    setState(() {
      computers = computerDao.readAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Computadoras')),
      body: FutureBuilder<List<ComputadoraModel>>(
        future: computers,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No hay computadoras registradas.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final computadora = snapshot.data![index];
                return ListTile(
                  title: Text(computadora.procesador),
                  subtitle: Text(
                      'RAM: ${computadora.ram}, Disco Duro: ${computadora.discoDuro}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () async {
                          final updatedComputer = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  EditComputerScreen(computadora: computadora),
                            ),
                          );
                          if (updatedComputer != null) {
                            _refreshComputers();
                          }
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () async {
                          await computerDao.delete(computadora.id!);
                          _refreshComputers();
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
