import 'package:tasklist/src/layers/domain/entities/date_completed_entity.dart';
import 'package:tasklist/src/layers/domain/entities/settings_entity.dart';
import 'package:tasklist/src/layers/domain/entities/task_entity.dart';
import 'package:tasklist/src/layers/domain/entities/tasklist_entity.dart';
import 'package:tasklist/src/layers/domain/entities/taskboard_entity.dart';

abstract class CreateEntitiesRepository {
  Future<SettingsEntity> saveSettings(SettingsEntity settings);
  Future<TaskEntity> saveTask(TaskEntity task);
  Future<DateCompletedEntity> saveDateCompleted(
      DateCompletedEntity dateCompleted);
  Future<TaskboardEntity> saveTaskboard(TaskboardEntity taskboard);
  Future<TasklistEntity> saveTasklist(TasklistEntity tasklist);
}
