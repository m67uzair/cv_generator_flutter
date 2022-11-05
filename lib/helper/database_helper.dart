import 'dart:convert';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/user_model.dart';

class DatabaseHelper {
  static late Database _database;

  final String _databaseName = 'name.db';

  DatabaseHelper._();
  static DatabaseHelper db = DatabaseHelper._();

  Future<Database> get database async {
    //  if (_database != null) return _database;

    _database = await _initDatabase();
    return _database;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _databaseName);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
CREATE TABLE UserData(id INTEGER PRIMARY KEY AUTOINCREMENT, data TEXT)
''');
  }

  Future<int> insert(UserModel data) async {
    final db = await database;
    final String dataAsString = jsonEncode(data.toMap());
    return db.insert('UserData', {'data': dataAsString});
  }

  Future<int> update(UserModel data) async {
    final db = await database;
    final String dataAsString = jsonEncode(data.toMap());
    return db.update('UserData', {'data': dataAsString},
        where: 'id = ?', whereArgs: [data.id]);
  }

  Future<List<UserModel>> retriveAll() async {
    final db = await database;
    final List<Map<String, dynamic>> map = await db.query('UserData');
    List<UserModel> list = List.generate(map.length, (i) {
      return UserModel(
          id: map[i]['id'],
          name: jsonDecode(map[i]['data'])['name'],
          linkList: jsonDecode(map[i]['data'])['link'],
          skillList: jsonDecode(map[i]['data'])['skill'],
          educationList: jsonDecode(map[i]['data'])['education'],
          experienceList: jsonDecode(map[i]['data'])['experience'],
          designation: jsonDecode(map[i]['data'])['designation'],
          email: jsonDecode(map[i]['data'])['email'],
          contact: jsonDecode(map[i]['data'])['contact'],
          language: jsonDecode(map[i]['data'])['language'],
          location: jsonDecode(map[i]['data'])['location'],
          workList: jsonDecode(map[i]['data'])['work'],
          image: jsonDecode(map[i]['data'])['image']);
    });

    return list;
  }

  Future<UserModel> retriveById(int id) async {
    final db = await database;
    List<Map<String, dynamic>> map =
        await db.query('UserData', where: 'id = ?', whereArgs: [id]);
    print(map.length);
    return UserModel(
        id: map[0]['id'],
        name: jsonDecode(map[0]['data'])['name'],
        linkList: jsonDecode(map[0]['data'])['link'],
        skillList: jsonDecode(map[0]['data'])['skill'],
        educationList: jsonDecode(map[0]['data'])['education'],
        experienceList: jsonDecode(map[0]['data'])['experience'],
        designation: jsonDecode(map[0]['data'])['designation'],
        email: jsonDecode(map[0]['data'])['email'],
        contact: jsonDecode(map[0]['data'])['contact'],
        language: jsonDecode(map[0]['data'])['language'],
        location: jsonDecode(map[0]['data'])['location'],
        workList: jsonDecode(map[0]['data'])['work'],
        image: jsonDecode(map[0]['data']['image']));
  }

  Future delete(int id) async {
    final db = await database;
    await db.delete('UserData', where: 'Id = ?', whereArgs: [id]);
  }

  deleteAll() async {
    Database db = await database;
    return await db.rawDelete("Delete from UserData");
  }
}
