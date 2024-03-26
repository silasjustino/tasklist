import 'package:sqflite/sqflite.dart';
import 'package:tasklist/layers/data/datasources/interfaces/get_tasklist_datasource.dart';
import 'package:tasklist/layers/data/datasources/local/db/db.dart';

class GetTaskListDataSourceDB implements GetTaskListDataSource {
  final Database _db = DB.instance.database;

  Future<List<Map>> fetchTasks(int id) async {
    String sql = '''
    SELECT *
    FROM task
    WHERE cod_taskboard = $id
    ''';

    return await _db.rawQuery(sql);
  }

  Future<List<Map>> fetchDateCompleted(int id) async {
    String sql = '''
    SELECT *
    FROM date_completed
    WHERE cod_taskboard = $id
    ''';

    return await _db.rawQuery(sql);
  }

  Future<Map> fetchTaskBoard(int id) async {
    List<Map> maps = await _db.query('taskboard', where: 'cod = $id', limit: 1);

    return maps.first;
  }

  Future<List<Map>> fetchTaskBoards(int id) async {
    return await _db.query('taskboard', where: 'cod_tasklist = $id');
  }

  Future<Map> fetchTaskList(int id) async {
    List<Map> maps = await _db.query('tasklist', where: 'cod = $id', limit: 1);

    return maps.first;
  }

  Future<List<Map>> fetchTaskLists() async {
    return await _db.query('tasklist');
  }

  @override
  Future<List<Map>> call() {
    final tasklists = fetchTaskLists();

    return tasklists;
  }
}
