import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DB {
  //Constructor with private access
  DB._();

  //Create a instance of DB (singleton)
  static final DB instance = DB._();

  //SQLite variable
  static Database? _database;

  // DB getter, if not null return the database, if null create with init method
  get database async {
    if (_database != null) {
      return _database;
    } else {
      return await _initDatabase();
    }
  }

  // init method, return openDatabase getting the path
  //where the DB is, has method onCreate
  _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'tasklist_app.db'),
      version: 1,
      onCreate: _onCreate,
    );
  }

  // Method onCreate executes DDLs of create tables
  _onCreate(db, version) async {
    await db.execute(_settings);
    await db.execute(_tasklist);
    await db.execute(_taskboard);
    await db.execute(_dateCompleted);
    await db.execute(_task);
  }

  // getter for the variables that has the create table strings

  String get _settings => '''
    CREATE TABLE settings (
      cod INTEGER PRIMARY KEY AUTOINCREMENT,
      theme_mode TEXT,
      sort_mode TEXT,
      view_mode TEXT,
      date_sync TEXT
    );

  ''';

  String get _tasklist => '''
    CREATE TABLE tasklist (
      cod INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT
    );

  ''';

  String get _taskboard => '''
    CREATE TABLE taskboard (
      cod INTEGER PRIMARY KEY AUTOINCREMENT,
      FOREIGN KEY(cod_tasklist) REFERENCES tasklist(cod),
      name TEXT,
      date_created TEXT,
      enabled INTEGER DEFAULT 0
    );

  ''';

  String get _dateCompleted => '''
    CREATE TABLE date_completed (
        cod INTEGER PRIMARY KEY AUTOINCREMENT,
        FOREIGN KEY(cod_taskboard) REFERENCES taskboard(cod),
        date_completed TEXT
    );

  ''';

  String get _task => '''
    CREATE TABLE task (
      cod INTEGER PRIMARY KEY AUTOINCREMENT,
      FOREIGN KEY(cod_taskboard) REFERENCES taskboard(cod),
      description TEXT,
      date_created TEXT,
      date_completed TEXT,
      completed INTEGER DEFAULT 0
    );
  
  ''';
}
