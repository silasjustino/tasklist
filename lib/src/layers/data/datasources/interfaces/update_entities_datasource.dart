import 'package:tasklist/src/layers/data/dto/date_completed_dto.dart';
import 'package:tasklist/src/layers/data/dto/settings_dto.dart';
import 'package:tasklist/src/layers/data/dto/task_dto.dart';
import 'package:tasklist/src/layers/data/dto/tasklist_dto.dart';
import 'package:tasklist/src/layers/data/dto/taskboard_dto.dart';

abstract class UpdateEntitiesDataSource {
  Future<bool> updateSettings(SettingsDto settings);
  Future<bool> updateTask(TaskDto task);
  Future<bool> updateDateCompleted(DateCompletedDto dateCompleted);
  Future<bool> updateTaskboard(TaskboardDto taskboard);
  Future<bool> updateTasklist(TasklistDto tasklist);
}
