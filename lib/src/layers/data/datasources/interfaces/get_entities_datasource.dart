import 'package:tasklist/src/layers/data/dto/date_completed_dto.dart';
import 'package:tasklist/src/layers/data/dto/settings_dto.dart';
import 'package:tasklist/src/layers/data/dto/task_dto.dart';
import 'package:tasklist/src/layers/data/dto/taskboard_dto.dart';
import 'package:tasklist/src/layers/data/dto/task_list_dto.dart';

abstract class GetEntitiesDataSource {
  Future<SettingsDto?> fetchSettings(int id);
  Future<TaskDto?> fetchTask(int id);
  Future<List<TaskDto>?> fetchListTask(int id);
  Future<DateCompletedDto?> fetchDateCompleted(int id);
  Future<List<DateCompletedDto>?> fetchListDateCompleted(int id);
  Future<TaskBoardDto?> fetchTaskboard(int id);
  Future<List<TaskBoardDto>?> fetchListTaskboard(int id);
  Future<TaskListDto?> fetchTasklist(int id);
  Future<List<TaskListDto>?> fetchListTasklist();
}
