import 'dart:developer';

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
  final Database _db = DB.instance.database;

  @override
  Future<bool> saveSettings(SettingsDto settings) async {
    final values = <dynamic>[
      settings.theme,
      settings.sort,
      settings.view,
      settings.date,
    ];

    if (settings.cod == null) {
      try {
        _db.rawInsert(InsertDBQuery.settings, values);

        return true;
      } catch (e) {
        log('$e');

        return false;
      }
    } else {
      values.add(settings.cod);
      try {
        _db.rawUpdate(UpdateDBQuery.settings, values);

        return true;
      } catch (e) {
        log('$e');

        return false;
      }
    }
  }

  @override
  Future<bool> saveTask(TaskDto task) async {
    final values = <dynamic>[
      task.codTaskboard,
      task.descriptionDto,
      task.dateCreatedDto,
      task.dateCompletedDto,
      task.completedDto,
    ];

    if (task.cod == null) {
      try {
        _db.rawInsert(InsertDBQuery.task, values);

        return true;
      } catch (e) {
        log('$e');

        return false;
      }
    } else {
      values.add(task.cod);
      try {
        _db.rawUpdate(UpdateDBQuery.task, values);

        return true;
      } catch (e) {
        log('$e');

        return false;
      }
    }
  }

  @override
  Future<bool> saveDateCompleted(DateCompletedDto dateCompleted) async {
    final values = <dynamic>[
      dateCompleted.codTaskboard,
      dateCompleted.dateCompletedDto,
    ];

    if (dateCompleted.cod == null) {
      try {
        _db.rawInsert(InsertDBQuery.dateCompleted, values);

        return true;
      } catch (e) {
        log('$e');

        return false;
      }
    } else {
      values.add(dateCompleted.cod);
      try {
        _db.rawUpdate(UpdateDBQuery.dateCompleted, values);

        return true;
      } catch (e) {
        log('$e');

        return false;
      }
    }
  }

  @override
  Future<bool> saveTaskboard(TaskBoardDto taskboard) async {
    final values = <dynamic>[
      taskboard.codTasklist,
      taskboard.nameDto,
      taskboard.dateCreatedDto,
      taskboard.enabledDto,
    ];

    if (taskboard.cod == null) {
      try {
        _db.rawInsert(InsertDBQuery.taskboard, values);

        return true;
      } catch (e) {
        log('$e');

        return false;
      }
    } else {
      values.add(taskboard.cod);
      try {
        _db.rawUpdate(UpdateDBQuery.taskboard, values);

        return true;
      } catch (e) {
        log('$e');

        return false;
      }
    }
  }

  @override
  Future<bool> saveTasklist(TaskListDto tasklist) async {
    final values = <dynamic>[
      tasklist.nameDto,
    ];

    if (tasklist.cod == null) {
      try {
        _db.rawInsert(InsertDBQuery.tasklist, values);

        return true;
      } catch (e) {
        log('$e');

        return false;
      }
    } else {
      values.add(tasklist.cod);
      try {
        _db.rawUpdate(UpdateDBQuery.tasklist, values);

        return true;
      } catch (e) {
        log('$e');

        return false;
      }
    }
  }
}
