// ignore_for_file: avoid_print

import 'package:sqflite/sqflite.dart';
import 'package:tasklist/src/layers/data/datasources/interfaces/create_entities_datasource.dart';
import 'package:tasklist/src/layers/data/datasources/local/db/db.dart';
import 'package:tasklist/src/layers/data/datasources/local/db/queries/insert_db_query.dart';
import 'package:tasklist/src/layers/data/dto/date_completed_dto.dart';
import 'package:tasklist/src/layers/data/dto/settings_dto.dart';
import 'package:tasklist/src/layers/data/dto/task_dto.dart';
import 'package:tasklist/src/layers/data/dto/tasklist_dto.dart';
import 'package:tasklist/src/layers/data/dto/taskboard_dto.dart';

class CreateEntitiesDataSourceDB implements CreateEntitiesDataSource {
  late Database _db;

  CreateEntitiesDataSourceDB._();

  static Future<CreateEntitiesDataSourceDB> create() async {
    var entity = CreateEntitiesDataSourceDB._();

    entity._db = await DB.instance.database;

    return entity;
  }

  @override
  Future<SettingsDto> saveSettings(SettingsDto settings) async {
    final values = <dynamic>[
      settings.theme,
      settings.sort,
      settings.view,
      settings.date,
    ];

    int id = await _db.rawInsert(InsertDBQuery.settings, values);

    if (id == 0) {
      print("Settings not inserted.");
      return settings;
    }

    settings.id = id;

    return settings;
  }

  @override
  Future<TaskDto> saveTask(TaskDto task) async {
    final values = <dynamic>[
      task.idTaskboard,
      task.descriptionDto,
      task.dateCreatedDto,
      task.dateCompletedDto,
      task.completedDto,
    ];

    int id = await _db.rawInsert(InsertDBQuery.task, values);

    if (id == 0) {
      print("Task not inserted.");
      return task;
    }

    task.id = id;

    return task;
  }

  @override
  Future<DateCompletedDto> saveDateCompleted(
      DateCompletedDto dateCompleted) async {
    final values = <dynamic>[
      dateCompleted.idTaskboard,
      dateCompleted.dateCompletedDto,
    ];

    int id = await _db.rawInsert(InsertDBQuery.dateCompleted, values);

    if (id == 0) {
      print("DateCompleted not inserted.");
      return dateCompleted;
    }

    dateCompleted.id = id;

    return dateCompleted;
  }

  @override
  Future<TaskboardDto> saveTaskboard(TaskboardDto taskboard) async {
    final values = <dynamic>[
      taskboard.idTasklist,
      taskboard.nameDto,
      taskboard.dateCreatedDto,
      taskboard.enabledDto,
    ];

    if (taskboard.tasksDto.isNotEmpty) {
      for (int i = 0; i < taskboard.tasksDto.length; i++) {
        taskboard.tasksDto[i] =
            await saveTask(taskboard.tasksDto[i] as TaskDto);
      }
    }

    if (taskboard.dateCompletedDto.isNotEmpty) {
      for (int i = 0; i < taskboard.dateCompletedDto.length; i++) {
        taskboard.dateCompletedDto[i] = await saveDateCompleted(
            taskboard.dateCompletedDto[i] as DateCompletedDto);
      }
    }

    int id = await _db.rawInsert(InsertDBQuery.taskboard, values);

    if (id == 0) {
      print("Taskboard not inserted.");
      return taskboard;
    }

    taskboard.id = id;

    return taskboard;
  }

  @override
  Future<TasklistDto> saveTasklist(TasklistDto tasklist) async {
    final values = <dynamic>[
      tasklist.nameDto,
    ];

    if (tasklist.taskboardsDto.isNotEmpty) {
      for (int i = 0; i < tasklist.taskboardsDto.length; i++) {
        tasklist.taskboardsDto[i] =
            await saveTaskboard(tasklist.taskboardsDto[i] as TaskboardDto);
      }
    }

    int id = await _db.rawInsert(InsertDBQuery.tasklist, values);

    if (id == 0) {
      print("Tasklist not inserted.");
      return tasklist;
    }

    tasklist.id = id;

    return tasklist;
  }
}
