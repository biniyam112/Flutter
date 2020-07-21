import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';

class DatabaseProvider {
  DatabaseProvider._();
  static final DatabaseProvider db = DatabaseProvider._();
  static Database _database;
  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await _initDb();
    return _database;
  }

  Future<Database> _initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'qeustionsDb.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database database, int v) async {
        await database.execute("CREATE TABLE questions ("
            "row BIGINT PRIMARY KEY AUTOINCREMENT,"
            "question TEXT"
            ")");
        // while()
        await database
            .execute("INSERT INTO questionsDb ('question') VALUES (?)", []);
      },
    );
  }
}
