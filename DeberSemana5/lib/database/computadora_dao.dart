import 'package:sqflite_example/database/database_helper.dart';
import 'package:sqflite_example/models/computadora_model.dart';

class ComputerDao {
  Future<List<ComputadoraModel>> readAll() async {
    final db = await DatabaseHelper.instance.db;
    final data = await db.query('computadora');
    return data.map((e) => ComputadoraModel.fromMap(e)).toList();
  }

  Future<int> insert(ComputadoraModel computadora) async {
    final db = await DatabaseHelper.instance.db;
    return await db.insert('computadora', {
      'procesador': computadora.procesador,
      'disco_duro': computadora.discoDuro,
      'ram': computadora.ram,
    });
  }

  Future<void> update(ComputadoraModel computadora) async {
    final db = await DatabaseHelper.instance.db;
    await db.update(
      'computadora',
      computadora.toMap(),
      where: 'id = ?',
      whereArgs: [computadora.id],
    );
  }

  Future<void> delete(int id) async {
    final db = await DatabaseHelper.instance.db;
    await db.delete('computadora', where: 'id = ?', whereArgs: [id]);
  }
}
