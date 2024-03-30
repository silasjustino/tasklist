import 'dart:developer';

import 'package:sqflite/sqflite.dart';
import 'package:tasklist/src/layers/data/datasources/interfaces/get_entities_datasource.dart';
import 'package:tasklist/src/layers/data/dto/date_completed_dto.dart';
import 'package:tasklist/src/layers/data/dto/settings_dto.dart';
import 'package:tasklist/src/layers/data/dto/task_dto.dart';
import 'package:tasklist/src/layers/data/dto/taskboard_dto.dart';
import 'package:tasklist/src/layers/data/dto/task_list_dto.dart';

class GetEntitiesDataSourceDB implements GetEntitiesDataSource {
  final Database _db;

  GetEntitiesDataSourceDB(this._db);

  @override
  Future<SettingsDto?> fetchSettings(int id) async {
    var maps = await _db.query(
      'settings',
      where: 'cod = ?',
      whereArgs: [id],
      limit: 1,
    );

    try {
      return SettingsDto.fromMap(maps.first);
    } catch (e) {
      log('$e');
      return null;
    }
  }

  @override
  Future<TaskDto?> fetchTask(int id) async {
    var maps = await _db.query(
      'task',
      where: 'cod = ?',
      whereArgs: [id],
      limit: 1,
    );

    try {
      return TaskDto.fromMap(maps.first);
    } catch (e) {
      log('$e');
      return null;
    }
  }

  @override
  Future<List<TaskDto>?> fetchListTask(int id) async {
    var maps = await _db.query(
      'task',
      where: 'cod_taskboard = ?',
      whereArgs: [id],
    );

    List<TaskDto> tasks = [];

    for (int i = 0; i < maps.length; i++) {
      tasks.add(TaskDto.fromMap(maps[i]));
    }

    try {
      return tasks;
    } catch (e) {
      log('$e');
      return null;
    }
  }

  @override
  Future<DateCompletedDto?> fetchDateCompleted(int id) async {
    var maps = await _db.query(
      'date_completed',
      where: 'cod = ?',
      whereArgs: [id],
      limit: 1,
    );

    try {
      return DateCompletedDto.fromMap(maps.first);
    } catch (e) {
      log('$e');
      return null;
    }
  }

  @override
  Future<List<DateCompletedDto>?> fetchListDateCompleted(int id) async {
    var maps = await _db.query(
      'date_completed',
      where: 'cod_taskboard = ?',
      whereArgs: [id],
    );

    List<DateCompletedDto> datesCompleted = [];

    for (int i = 0; i < maps.length; i++) {
      datesCompleted.add(DateCompletedDto.fromMap(maps[i]));
    }

    try {
      return datesCompleted;
    } catch (e) {
      log('$e');
      return null;
    }
  }

  @override
  Future<TaskBoardDto?> fetchTaskboard(int id) async {
    List<Map> maps = await _db.query(
      'taskboard',
      where: 'cod = ?',
      whereArgs: [id],
      limit: 1,
    );

    try {
      return TaskBoardDto.fromMap(maps.first);
    } catch (e) {
      log('$e');
      return null;
    }
  }

  @override
  Future<List<TaskBoardDto>?> fetchListTaskboard(int id) async {
    var maps = await _db.query(
      'taskboard',
      where: 'cod_tasklist = ?',
      whereArgs: [id],
    );

    List<TaskBoardDto> taskboards = [];

    for (int i = 0; i < maps.length; i++) {
      taskboards.add(await TaskBoardDto.fromMap(maps[i]));
    }

    try {
      return taskboards;
    } catch (e) {
      log('$e');
      return null;
    }
  }

  @override
  Future<TaskListDto?> fetchTasklist(int id) async {
    List<Map> maps = await _db.query(
      'tasklist',
      where: 'cod = ?',
      whereArgs: [id],
      limit: 1,
    );

    try {
      return TaskListDto.fromMap(maps.first);
    } catch (e) {
      log('$e');
      return null;
    }
  }

  @override
  Future<List<TaskListDto>?> fetchListTasklist() async {
    var maps = await _db.query('tasklist');

    List<TaskListDto> tasklists = [];

    for (int i = 0; i < tasklists.length; i++) {
      tasklists.add(await TaskListDto.fromMap(maps[i]));
    }

    try {
      return tasklists;
    } catch (e) {
      log('$e');
      return null;
    }
  }
}
