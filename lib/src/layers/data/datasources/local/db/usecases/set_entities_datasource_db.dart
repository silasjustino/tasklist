// ignore_for_file: avoid_print

import 'package:sqflite/sqflite.dart';
import 'package:tasklist/src/layers/data/datasources/interfaces/set_entities_datasource.dart';
import 'package:tasklist/src/layers/data/datasources/local/db/db.dart';
import 'package:tasklist/src/layers/data/datasources/local/db/queries/insert_db_query.dart';
import 'package:tasklist/src/layers/data/datasources/local/db/queries/update_db_query.dart';
import 'package:tasklist/src/layers/data/dto/date_completed_dto.dart';
import 'package:tasklist/src/layers/data/dto/settings_dto.dart';
import 'package:tasklist/src/layers/data/dto/task_dto.dart';
import 'package:tasklist/src/layers/data/dto/task_list_dto.dart';
import 'package:tasklist/src/layers/data/dto/taskboard_dto.dart';

class SetEntitiesDataSourceDB implements SetEntitiesDataSource {
  late Database _db;

  SetEntitiesDataSourceDB._();

  static Future<SetEntitiesDataSourceDB> create() async {
    var entity = SetEntitiesDataSourceDB._();

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

    if (settings.id == null) {
      int id = await _db.rawInsert(InsertDBQuery.settings, values);

      if (id == 0) {
        print("Settings not inserted.");
        return settings;
      }

      settings.id = id;

      return settings;
    } else {
      values.add(settings.id);

      int changes = await _db.rawUpdate(UpdateDBQuery.settings, values);

      if (changes == 0) {
        print("Settings not updated.");
      }

      return settings;
    }
  }

  @override
  Future<TaskDto> saveTask(TaskDto task) async {
    final values = <dynamic>[
      task.codTaskboard,
      task.descriptionDto,
      task.dateCreatedDto,
      task.dateCompletedDto,
      task.completedDto,
    ];

    if (task.id == null) {
      int id = await _db.rawInsert(InsertDBQuery.task, values);

      if (id == 0) {
        print("Task not inserted.");
        return task;
      }

      task.id = id;

      return task;
    } else {
      values.add(task.id);

      int changes = await _db.rawUpdate(UpdateDBQuery.task, values);

      if (changes == 0) {
        print("Task not updated.");
      }

      return task;
    }
  }

  @override
  Future<DateCompletedDto> saveDateCompleted(
      DateCompletedDto dateCompleted) async {
    final values = <dynamic>[
      dateCompleted.codTaskboard,
      dateCompleted.dateCompletedDto,
    ];

    if (dateCompleted.id == null) {
      int id = await _db.rawInsert(InsertDBQuery.dateCompleted, values);

      if (id == 0) {
        print("DateCompleted not inserted.");
        return dateCompleted;
      }

      dateCompleted.id = id;

      return dateCompleted;
    } else {
      values.add(dateCompleted.id);

      int changes = await _db.rawUpdate(UpdateDBQuery.dateCompleted, values);

      if (changes == 0) {
        print("DateCompleted not updated.");
      }

      return dateCompleted;
    }
  }

  @override
  Future<TaskBoardDto> saveTaskboard(TaskBoardDto taskboard) async {
    final values = <dynamic>[
      taskboard.codTasklist,
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

    if (taskboard.id == null) {
      int id = await _db.rawInsert(InsertDBQuery.taskboard, values);

      if (id == 0) {
        print("Taskboard not inserted.");
        return taskboard;
      }

      taskboard.id = id;

      return taskboard;
    } else {
      values.add(taskboard.id);

      int changes = await _db.rawUpdate(UpdateDBQuery.taskboard, values);

      if (changes == 0) {
        print("Taskboard not updated.");
      }

      return taskboard;
    }
  }

  @override
  Future<TaskListDto> saveTasklist(TaskListDto tasklist) async {
    final values = <dynamic>[
      tasklist.nameDto,
    ];

    if (tasklist.taskboardsDto.isNotEmpty) {
      for (int i = 0; i < tasklist.taskboardsDto.length; i++) {
        tasklist.taskboardsDto[i] =
            await saveTaskboard(tasklist.taskboardsDto[i] as TaskBoardDto);
      }
    }

    if (tasklist.id == null) {
      int id = await _db.rawInsert(InsertDBQuery.tasklist, values);

      if (id == 0) {
        print("Tasklist not inserted.");
        return tasklist;
      }

      tasklist.id = id;

      return tasklist;
    } else {
      values.add(tasklist.id);

      int changes = await _db.rawUpdate(UpdateDBQuery.tasklist, values);

      if (changes == 0) {
        print("Tasklist not updated.");
      }

      return tasklist;
    }
  }
}
