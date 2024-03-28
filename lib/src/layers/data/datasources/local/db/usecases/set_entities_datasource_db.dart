import 'dart:developer';

import 'package:sqflite/sqflite.dart';
import 'package:tasklist/src/layers/data/datasources/interfaces/set_entities_datasource.dart';
import 'package:tasklist/src/layers/data/datasources/local/db/db.dart';
import 'package:tasklist/src/layers/data/dto/date_completed_dto.dart';
import 'package:tasklist/src/layers/data/dto/task_dto.dart';
import 'package:tasklist/src/layers/data/dto/task_list_dto.dart';
import 'package:tasklist/src/layers/data/dto/taskboard_dto.dart';

class SetEntitiesDataSourceDB implements SetEntitiesDataSource {
  final Database _db = DB.instance.database;

  @override
  Future<bool> saveDateCompleted(DateCompletedDto dateCompleted) async {
    try {
      await _db.insert(
        'date_completed',
        dateCompleted.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      return true;
    } catch (e) {
      log('$e');
      return false;
    }
  }

  @override
  Future<bool> saveTask(TaskDto task) async {
    try {
      await _db.insert(
        'task',
        task.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      return true;
    } catch (e) {
      log('$e');
      return false;
    }
  }

  @override
  Future<bool> saveTaskboard(TaskBoardDto taskboard) async {
    try {
      await _db.insert(
        'taskboard',
        taskboard.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      return true;
    } catch (e) {
      log('$e');
      return false;
    }
  }

  @override
  Future<bool> saveTasklist(TaskListDto tasklist) async {
    try {
      await _db.insert(
        'tasklist',
        tasklist.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      return true;
    } catch (e) {
      log('$e');
      return false;
    }
  }
}
