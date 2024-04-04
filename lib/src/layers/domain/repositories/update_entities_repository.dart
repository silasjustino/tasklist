import 'package:tasklist/src/layers/domain/entities/date_completed_entity.dart';
import 'package:tasklist/src/layers/domain/entities/settings_entity.dart';
import 'package:tasklist/src/layers/domain/entities/task_entity.dart';
import 'package:tasklist/src/layers/domain/entities/tasklist_entity.dart';
import 'package:tasklist/src/layers/domain/entities/taskboard_entity.dart';

abstract class UpdateEntitiesRepository {
  Future<bool> updateSettings(SettingsEntity settings);
  Future<bool> updateTask(TaskEntity task);
  Future<bool> updateDateCompleted(DateCompletedEntity dateCompleted);
  Future<bool> updateTaskboard(TaskboardEntity taskboard);
  Future<bool> updateTasklist(TasklistEntity tasklist);
}
