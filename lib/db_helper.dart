import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  _initDB() async {
    String path = join(await getDatabasesPath(), 'key_value.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE key_value (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        key TEXT,
        value TEXT
      )
    ''');
  }

  Future<void> insertKeyValue(String key, String value) async {
    final db = await database;
    await db.insert('key_value', {'key': key, 'value': value});
  }

  Future<List<Map<String, dynamic>>> getKeyValues() async {
    final db = await database;
    return await db.query('key_value');
  }
}
