import 'package:sqflite/sqflite.dart';
//import 'package:path/path.dart';

class Sq {
  // static final Sq _instance = Sq._internal();
  // factory Sq() => _instance;

  // Sq._internal();

  Database? _db;

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        email TEXT,
        password TEXT
      )
    ''');
    print('🚀🚀🚀Table created🚀🚀🚀');
  }

  Future<Database> get database async {
  if (_db != null) return _db!;
  _db = await openDatabase(
    'my_db.db',
    version: 1,
    onCreate: _onCreate,
  );
  return _db!;
}


  Future<List<Map<String, dynamic>>> getUsers() async {
    Database db = await database;
    return await db.query('users', orderBy: 'id DESC');
  }

  Future<int> insertUser(String name, String email, String password) async {
    Database db = await database;
    return await db.insert(
      'users',
      {'name': name, 'email': email, 'password': password},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> deleteUser(int id) async {
    Database db = await database;
    return await db.delete('users', where: 'id = ?', whereArgs: [id]);
  }
}