import 'package:tasklist/src/layers/data/dto/date_completed_dto.dart';
import 'package:tasklist/src/layers/data/dto/settings_dto.dart';
import 'package:tasklist/src/layers/data/dto/task_dto.dart';
import 'package:tasklist/src/layers/data/dto/task_list_dto.dart';
import 'package:tasklist/src/layers/data/dto/taskboard_dto.dart';

abstract class SetEntitiesDataSource {
  Future<bool> saveSettings(SettingsDto settings);
  Future<bool> saveTask(TaskDto task);
  Future<bool> saveDateCompleted(DateCompletedDto dateCompleted);
  Future<bool> saveTaskboard(TaskBoardDto taskboard);
  Future<bool> saveTasklist(TaskListDto tasklist);
}
