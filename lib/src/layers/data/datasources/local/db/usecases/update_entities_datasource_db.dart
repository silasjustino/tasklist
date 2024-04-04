import 'package:sqflite/sqflite.dart';
import 'package:tasklist/src/layers/data/datasources/interfaces/update_entities_datasource.dart';
import 'package:tasklist/src/layers/data/datasources/local/db/db.dart';
import 'package:tasklist/src/layers/data/datasources/local/db/queries/update_db_query.dart';
import 'package:tasklist/src/layers/data/dto/date_completed_dto.dart';
import 'package:tasklist/src/layers/data/dto/settings_dto.dart';
import 'package:tasklist/src/layers/data/dto/task_dto.dart';
import 'package:tasklist/src/layers/data/dto/tasklist_dto.dart';
import 'package:tasklist/src/layers/data/dto/taskboard_dto.dart';

class UpdateEntitiesDataSourceDB implements UpdateEntitiesDataSource {
  late Database _db;

  UpdateEntitiesDataSourceDB._();

  static Future<UpdateEntitiesDataSourceDB> create() async {
    var entity = UpdateEntitiesDataSourceDB._();

    entity._db = await DB.instance.database;

    return entity;
  }

  @override
  Future<bool> updateSettings(SettingsDto settings) async {
    final values = <dynamic>[
      settings.theme,
      settings.sort,
      settings.view,
      settings.date,
      settings.id,
    ];

    int changes = await _db.rawUpdate(UpdateDBQuery.settings, values);

    if (changes == 0) {
      return false;
    }

    return true;
  }

  @override
  Future<bool> updateTask(TaskDto task) async {
    final values = <dynamic>[
      task.idTaskboard,
      task.descriptionDto,
      task.dateCreatedDto,
      task.dateCompletedDto,
      task.completedDto,
      task.id,
    ];

    int changes = await _db.rawUpdate(UpdateDBQuery.task, values);

    if (changes == 0) {
      return false;
    }

    return true;
  }

  @override
  Future<bool> updateDateCompleted(DateCompletedDto dateCompleted) async {
    final values = <dynamic>[
      dateCompleted.idTaskboard,
      dateCompleted.dateCompletedDto,
      dateCompleted.id,
    ];

    int changes = await _db.rawUpdate(UpdateDBQuery.dateCompleted, values);

    if (changes == 0) {
      return false;
    }

    return true;
  }

  @override
  Future<bool> updateTaskboard(TaskboardDto taskboard) async {
    final values = <dynamic>[
      taskboard.idTasklist,
      taskboard.nameDto,
      taskboard.dateCreatedDto,
      taskboard.enabledDto,
      taskboard.id,
    ];

    if (taskboard.tasksDto.isNotEmpty) {
      for (int i = 0; i < taskboard.tasksDto.length; i++) {
        await updateTask(taskboard.tasksDto[i] as TaskDto);
      }
    }

    if (taskboard.dateCompletedDto.isNotEmpty) {
      for (int i = 0; i < taskboard.dateCompletedDto.length; i++) {
        await updateDateCompleted(
            taskboard.dateCompletedDto[i] as DateCompletedDto);
      }
    }

    int changes = await _db.rawUpdate(UpdateDBQuery.taskboard, values);

    if (changes == 0) {
      return false;
    }

    return true;
  }

  @override
  Future<bool> updateTasklist(TasklistDto tasklist) async {
    final values = <dynamic>[
      tasklist.nameDto,
      tasklist.id,
    ];

    if (tasklist.taskboardsDto.isNotEmpty) {
      for (int i = 0; i < tasklist.taskboardsDto.length; i++) {
        await updateTaskboard(tasklist.taskboardsDto[i] as TaskboardDto);
      }
    }

    int changes = await _db.rawUpdate(UpdateDBQuery.tasklist, values);

    if (changes == 0) {
      return false;
    }

    return true;
  }
}
