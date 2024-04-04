import 'dart:developer';

import 'package:sqflite/sqflite.dart';
import 'package:tasklist/src/layers/data/datasources/interfaces/read_entities_datasource.dart';
import 'package:tasklist/src/layers/data/datasources/local/db/db.dart';
import 'package:tasklist/src/layers/data/dto/date_completed_dto.dart';
import 'package:tasklist/src/layers/data/dto/settings_dto.dart';
import 'package:tasklist/src/layers/data/dto/task_dto.dart';
import 'package:tasklist/src/layers/data/dto/taskboard_dto.dart';
import 'package:tasklist/src/layers/data/dto/tasklist_dto.dart';

class ReadEntitiesDataSourceDB implements ReadEntitiesDataSource {
  late Database _db;

  ReadEntitiesDataSourceDB._();

  static Future<ReadEntitiesDataSourceDB> create() async {
    var entity = ReadEntitiesDataSourceDB._();

    entity._db = await DB.instance.database;

    return entity;
  }

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
  Future<TaskboardDto?> fetchTaskboard(int id) async {
    List<Map> maps = await _db.query(
      'taskboard',
      where: 'cod = ?',
      whereArgs: [id],
      limit: 1,
    );

    try {
      return TaskboardDto.fromMap(maps.first);
    } catch (e) {
      log('$e');
      return null;
    }
  }

  @override
  Future<List<TaskboardDto>?> fetchListTaskboard(int id) async {
    var maps = await _db.query(
      'taskboard',
      where: 'cod_tasklist = ?',
      whereArgs: [id],
    );

    List<TaskboardDto> taskboards = [];

    for (int i = 0; i < maps.length; i++) {
      taskboards.add(await TaskboardDto.fromMap(maps[i]));
    }

    try {
      return taskboards;
    } catch (e) {
      log('$e');
      return null;
    }
  }

  @override
  Future<TasklistDto?> fetchTasklist(int id) async {
    List<Map> maps = await _db.query(
      'tasklist',
      where: 'cod = ?',
      whereArgs: [id],
      limit: 1,
    );

    try {
      return TasklistDto.fromMap(maps.first);
    } catch (e) {
      log('$e');
      return null;
    }
  }

  @override
  Future<List<TasklistDto>?> fetchListTasklist() async {
    var maps = await _db.query('tasklist');

    List<TasklistDto> tasklists = [];

    for (int i = 0; i < tasklists.length; i++) {
      tasklists.add(await TasklistDto.fromMap(maps[i]));
    }

    try {
      return tasklists;
    } catch (e) {
      log('$e');
      return null;
    }
  }
}
