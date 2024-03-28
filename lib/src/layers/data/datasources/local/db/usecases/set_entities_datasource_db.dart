import 'dart:developer';

import 'package:sqflite/sqflite.dart';
import 'package:tasklist/src/layers/data/datasources/interfaces/set_entities_datasource.dart';
import 'package:tasklist/src/layers/data/datasources/local/db/queries/insert_db_query.dart';
import 'package:tasklist/src/layers/data/datasources/local/db/queries/update_db_query.dart';
import 'package:tasklist/src/layers/data/dto/date_completed_dto.dart';
import 'package:tasklist/src/layers/data/dto/settings_dto.dart';
import 'package:tasklist/src/layers/data/dto/task_dto.dart';
import 'package:tasklist/src/layers/data/dto/task_list_dto.dart';
import 'package:tasklist/src/layers/data/dto/taskboard_dto.dart';

class SetEntitiesDataSourceDB implements SetEntitiesDataSource {
  final Database _db;

  SetEntitiesDataSourceDB(this._db);

  @override
  Future<SettingsDto> saveSettings(SettingsDto settings) async {
    final values = <dynamic>[
      settings.theme,
      settings.sort,
      settings.view,
      settings.date,
    ];

    if (settings.id == null) {
      try {
        int id = await _db.rawInsert(InsertDBQuery.settings, values);

        settings.id = id;

        return settings;
      } catch (e) {
        log('$e');

        return settings;
      }
    } else {
      values.add(settings.id);
      try {
        await _db.rawUpdate(UpdateDBQuery.settings, values);
        return settings;
      } catch (e) {
        log('$e');

        return settings;
      }
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
      try {
        int id = await _db.rawInsert(InsertDBQuery.task, values);

        task.id = id;

        return task;
      } catch (e) {
        log('$e');

        return task;
      }
    } else {
      values.add(task.id);
      try {
        await _db.rawUpdate(UpdateDBQuery.task, values);

        return task;
      } catch (e) {
        log('$e');

        return task;
      }
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
      try {
        int id = await _db.rawInsert(InsertDBQuery.dateCompleted, values);

        dateCompleted.id = id;

        return dateCompleted;
      } catch (e) {
        log('$e');

        return dateCompleted;
      }
    } else {
      values.add(dateCompleted.id);
      try {
        await _db.rawUpdate(UpdateDBQuery.dateCompleted, values);

        return dateCompleted;
      } catch (e) {
        log('$e');

        return dateCompleted;
      }
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
      try {
        int id = await _db.rawInsert(InsertDBQuery.taskboard, values);

        taskboard.id = id;

        return taskboard;
      } catch (e) {
        log('$e');

        return taskboard;
      }
    } else {
      values.add(taskboard.id);
      try {
        await _db.rawUpdate(UpdateDBQuery.taskboard, values);

        return taskboard;
      } catch (e) {
        log('$e');

        return taskboard;
      }
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
      try {
        int id = await _db.rawInsert(InsertDBQuery.tasklist, values);

        tasklist.id = id;

        return tasklist;
      } catch (e) {
        log('$e');

        return tasklist;
      }
    } else {
      values.add(tasklist.id);
      try {
        await _db.rawUpdate(UpdateDBQuery.tasklist, values);

        return tasklist;
      } catch (e) {
        log('$e');

        return tasklist;
      }
    }
  }
}
