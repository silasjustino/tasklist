import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tasklist/src/layers/data/datasources/local/db/queries/create_db_query.dart';

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
    await db.execute(CreateDBQuery.settings);
    await db.execute(CreateDBQuery.tasklist);
    await db.execute(CreateDBQuery.taskboard);
    await db.execute(CreateDBQuery.dateCompleted);
    await db.execute(CreateDBQuery.task);
  }
}
