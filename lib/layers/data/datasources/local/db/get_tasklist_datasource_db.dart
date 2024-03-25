import 'package:sqflite/sqflite.dart';
import 'package:tasklist/layers/data/datasources/interfaces/get_tasklist_datasource.dart';
import 'package:tasklist/layers/data/datasources/local/db/db.dart';
import 'package:tasklist/layers/data/dto/task_dto.dart';
import 'package:tasklist/layers/data/dto/taskboard_dto.dart';
import 'package:tasklist/layers/data/dto/taskboard_list_dto.dart';
import 'package:tasklist/layers/domain/entities/task_entity.dart';
import 'package:tasklist/layers/domain/entities/taskboard_entity.dart';
import 'package:tasklist/layers/domain/entities/taskboard_list_entity.dart';

class GetTaskListDataSourceDB implements GetTaskListDataSource {
  final Database _db = DB.instance.database;

  Future<List<TaskEntity>> _fetchTasks(int id) async {
    String sql = '''
    SELECT *
    FROM task
    WHERE cod_taskboard = $id
    ''';

    List<Map> maps = await _db.rawQuery(sql);

    var tasks = List.generate(maps.length, (i) {
      return TaskDto.create(
        maps[i]['cod'],
        maps[i]['cod_taskboard'],
        maps[i]['description'],
        maps[i]['date_created'],
        maps[i]['date_completed'],
        maps[i]['completed'],
      );
    });

    return tasks;
  }

  Future<List<String>> _fetchDateCompleted(int id) async {
    String sql = '''
    SELECT *
    FROM date_completed
    WHERE cod_taskboard = $id
    ''';

    List<Map> maps = await _db.rawQuery(sql);

    List<String> datesCompleted = List.generate(maps.length, (i) {
      return maps[i]['date_completed'];
    });

    return datesCompleted;
  }

  Future<TaskBoardEntity> _fetchTaskBoard(int id) async {
    var tasks = await _fetchTasks(id);
    var datesCompleted = await _fetchDateCompleted(id);

    List<Map> maps = await _db.query('taskboard', where: 'cod = $id', limit: 1);

    var taskboard = List.generate(maps.length, (i) {
      return TaskBoardDto.create(
        maps[i]['cod'],
        maps[i]['cod_tasklist'],
        maps[i]['name'],
        maps[i]['date_created'],
        maps[i]['enabled'],
        tasks,
        datesCompleted,
      );
    }).first;

    return taskboard;
  }

  Future<List<TaskBoardEntity>> _fetchTaskBoards(int id) async {
    String sql = '''
    SELECT *
    FROM taskboard
    WHERE cod_tasklist = $id
    ''';

    List<Map> maps = await _db.rawQuery(sql);

    List<int> codTaskboards = List.generate(maps.length, (i) {
      return maps[i]['cod'];
    });

    List<TaskBoardEntity> taskboards = [];

    for (int i in codTaskboards) {
      taskboards.add(await _fetchTaskBoard(i));
    }

    return taskboards;
  }

  Future<TaskBoardListEntity> _fetchTaskList(int id) async {
    var taskboards = await _fetchTaskBoards(id);

    List<Map> maps = await _db.query('tasklist', where: 'cod = $id', limit: 1);

    var tasklist = List.generate(maps.length, (i) {
      return TaskBoardListDto.create(
        maps[i]['cod'],
        maps[i]['name'],
        taskboards,
      );
    }).first;

    return tasklist;
  }

  Future<List<TaskBoardListEntity>> fetchTaskLists() async {
    String sql = '''
    SELECT cod
    FROM tasklist
    ''';

    List<Map> codTaskListsMaps = await _db.rawQuery(sql);

    List<int> codTaskLists = List.generate(codTaskListsMaps.length, (i) {
      return codTaskListsMaps[i]['cod'];
    });

    List<TaskBoardListEntity> tasklists = [];

    for (int i in codTaskLists) {
      tasklists.add(await _fetchTaskList(codTaskLists[i]));
    }

    return tasklists;
  }

  @override
  Future<List<TaskBoardListEntity>> call() {
    final tasklists = fetchTaskLists();

    return tasklists;
  }
}
