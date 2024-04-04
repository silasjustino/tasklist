import 'package:tasklist/src/layers/data/dto/date_completed_dto.dart';
import 'package:tasklist/src/layers/data/dto/settings_dto.dart';
import 'package:tasklist/src/layers/data/dto/task_dto.dart';
import 'package:tasklist/src/layers/data/dto/tasklist_dto.dart';
import 'package:tasklist/src/layers/data/dto/taskboard_dto.dart';

abstract class CreateEntitiesDataSource {
  Future<SettingsDto> saveSettings(SettingsDto settings);
  Future<TaskDto> saveTask(TaskDto task);
  Future<DateCompletedDto> saveDateCompleted(DateCompletedDto dateCompleted);
  Future<TaskboardDto> saveTaskboard(TaskboardDto taskboard);
  Future<TasklistDto> saveTasklist(TasklistDto tasklist);
}
