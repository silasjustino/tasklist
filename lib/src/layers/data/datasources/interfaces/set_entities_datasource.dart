import 'package:tasklist/src/layers/data/dto/date_completed_dto.dart';
import 'package:tasklist/src/layers/data/dto/settings_dto.dart';
import 'package:tasklist/src/layers/data/dto/task_dto.dart';
import 'package:tasklist/src/layers/data/dto/task_list_dto.dart';
import 'package:tasklist/src/layers/data/dto/taskboard_dto.dart';

abstract class SetEntitiesDataSource {
  Future<SettingsDto> saveSettings(SettingsDto settings);
  Future<TaskDto> saveTask(TaskDto task);
  Future<DateCompletedDto> saveDateCompleted(DateCompletedDto dateCompleted);
  Future<TaskBoardDto> saveTaskboard(TaskBoardDto taskboard);
  Future<TaskListDto> saveTasklist(TaskListDto tasklist);
}
