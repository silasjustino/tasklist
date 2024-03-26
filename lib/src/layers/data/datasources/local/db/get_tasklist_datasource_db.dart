import 'package:sqflite/sqflite.dart';
import 'package:tasklist/src/layers/data/datasources/interfaces/get_tasklist_datasource.dart';
import 'package:tasklist/src/layers/data/datasources/local/db/db.dart';
import 'package:tasklist/src/layers/data/dto/taskboard_list_dto.dart';

class GetTaskListDataSourceDB implements GetTaskListDataSource {
  final Database _db = DB.instance.database;

  Future<List<Map>> fetchTasks(int id) async {
    return await _db.query('task', where: 'cod_taskboard = ?', whereArgs: [id]);
  }

  Future<List<Map>> fetchDateCompleted(int id) async {
    return await _db
        .query('date_completed', where: 'cod_taskboard = ?', whereArgs: [id]);
  }

  Future<Map> fetchTaskBoard(int id) async {
    List<Map> maps = await _db.query('taskboard',
        where: 'cod = ?', whereArgs: [id], limit: 1);

    return maps.first;
  }

  Future<List<Map>> fetchTaskBoards(int id) async {
    return await _db
        .query('taskboard', where: 'cod_tasklist = ?', whereArgs: [id]);
  }

  Future<Map> fetchTaskList(int id) async {
    List<Map> maps = await _db.query('tasklist',
        where: 'cod = ?', whereArgs: [id], limit: 1);

    return maps.first;
  }

  Future<List<Map>> fetchTaskLists() async {
    return await _db.query('tasklist');
  }

  @override
  Future<List<TaskListDto>> call() async {
    var maps = await fetchTaskLists();

    List<TaskListDto> tasklists = [];

    for (int i = 0; i < tasklists.length; i++) {
      tasklists.add(await TaskListDto.fromMap(maps[i]));
    }

    return tasklists;
  }
}
