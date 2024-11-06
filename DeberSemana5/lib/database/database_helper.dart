import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  DatabaseHelper._internal();
  static DatabaseHelper get instance =>
      _databaseHelper ??= DatabaseHelper._internal();

  Database? _db;

  Future<Database> get db async {
    if (_db == null) {
      await init(); // Asegúrate de que la base de datos esté inicializada.
    }
    return _db!;
  }

  Future<void> init() async {
    _db = await openDatabase(
      'database.db',
      version: 1,
      onCreate: (db, version) {
        db.execute(
          'CREATE TABLE computadora (id INTEGER PRIMARY KEY AUTOINCREMENT, procesador varchar(255), disco_duro varchar(255), ram varchar(255))',
        );
      },
    );
  }
}
