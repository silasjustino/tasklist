import 'package:tasklist/src/layers/domain/entities/date_completed_entity.dart';
import 'package:tasklist/src/layers/domain/entities/settings_entity.dart';
import 'package:tasklist/src/layers/domain/entities/task_entity.dart';
import 'package:tasklist/src/layers/domain/entities/task_list_entity.dart';
import 'package:tasklist/src/layers/domain/entities/taskboard_entity.dart';

abstract class SetEntitiesRepository {
  Future<SettingsEntity> saveSettings(SettingsEntity settings);
  Future<TaskEntity> saveTask(TaskEntity task);
  Future<DateCompletedEntity> saveDateCompleted(
      DateCompletedEntity dateCompleted);
  Future<TaskBoardEntity> saveTaskboard(TaskBoardEntity taskboard);
  Future<TaskListEntity> saveTasklist(TaskListEntity tasklist);
}
