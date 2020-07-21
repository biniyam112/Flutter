import 'dart:async';
import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'contact.dart';

class SqlProvider {
  static Database _database;
  static int lastId = 1;
  Future<Database> get database async {
    if (database == null) _database = await initDatabase();
    return _database;
  }

  initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.absolute.path, 'contacts.db');
    return await openDatabase(
      path,
      version: 2,
      onCreate: (database, version) async {
        String sql = "CREATE TABLE  contacts ("
            "id INTEGER PRIMARY KEY,"
            "firstname TEXT,"
            "lastname TEXT,"
            "phonenumber INTEGER,"
            "email TEXT,"
            ")";
        database.execute(sql);
        String insertSql =
            "INSERT INTO contacts ('id','firstname','lastname','phonenumber','email') VALUES (?,?,?,?,?)";
        database.execute(insertSql, [
          1,
          'Biniyam',
          'ma men',
          0941726567,
          'biniyamdemissew112@gmail.com'
        ]);
        lastId++;
      },
    );
  }

  insertContact(Contact contact) async {
    final db = await database;
    var contactMap = contact.toMap();
    contactMap['id'] = lastId;
    var lastIdUpdate = await db.insert('contacts', contactMap);
    lastId = lastIdUpdate;
  }

  deleteContact(int id) async {
    final db = await database;
    await db.delete(
      'contacts',
      where: 'id = ',
      whereArgs: [id],
    );
  }

  Future<List<Map<String, dynamic>>> getContacts() async {
    final db = await database;
    var contacts = await db.query(
      'contacts',
      orderBy: 'firstname',
    );
    return contacts;
  }
}
