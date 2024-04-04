import 'package:tasklist/src/layers/domain/entities/date_completed_entity.dart';
import 'package:tasklist/src/layers/domain/entities/settings_entity.dart';
import 'package:tasklist/src/layers/domain/entities/task_entity.dart';
import 'package:tasklist/src/layers/domain/entities/tasklist_entity.dart';
import 'package:tasklist/src/layers/domain/entities/taskboard_entity.dart';

abstract class ReadEntitiesRepository {
  Future<SettingsEntity?> fetchSettings(int id);
  Future<TaskEntity?> fetchTask(int id);
  Future<List<TaskEntity>?> fetchListTask(int id);
  Future<DateCompletedEntity?> fetchDateCompleted(int id);
  Future<List<DateCompletedEntity>?> fetchListDateCompleted(int id);
  Future<TaskboardEntity?> fetchTaskboard(int id);
  Future<List<TaskboardEntity>?> fetchListTaskboard(int id);
  Future<TasklistEntity?> fetchTasklist(int id);
  Future<List<TasklistEntity>?> fetchListTasklist();
}
