import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/user.dart';

class DatabaseConnect {
  Database? _database;

  Future<Database> get database async {
    final dbpath = await getDatabasesPath();
    const dbname = 'user.db';
    final path = join(dbpath, dbname);
    // Conectando
    _database = await openDatabase(path, version: 1, onCreate: _createDB);
    return _database!;
  }

  FutureOr<void> _createDB(Database db, int version) async {
    await db.execute(
        'CREATE TABLE user(id INTEGER PRIMARY KEY AUTOINCREMENT,todoText TEXT,creationDate TEXT, isChecked INTEGER)');
  }

  Future<void> insertTodo(User user) async {
    final db = await database;

    await db.insert(
      'user',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deleteToDo(User user) async {
    final db = await database;

    await db.delete('User', where: 'id == ?', whereArgs: [user.id]);
  }

  Future<List<User>> getTodo() async {
    final db = await database;

    List<Map<String, dynamic>> items =
        await db.query('User', orderBy: 'id DESC');

    return List.generate(
      items.length,
      (i) => User(
          id: items[i]['id'],
          name: items[i]['name'],
          email: items[i]['email'],
          password: items[i]['password'],
          token: items[i]['toekn']),
    );
  }
}
