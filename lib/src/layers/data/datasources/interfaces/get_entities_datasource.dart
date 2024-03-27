import 'package:tasklist/src/layers/data/dto/task_dto.dart';
import 'package:tasklist/src/layers/data/dto/taskboard_dto.dart';
import 'package:tasklist/src/layers/data/dto/task_list_dto.dart';

abstract class GetEntitiesDataSource {
  Future<List<TaskDto>> fetchTasks(int id);
  Future<TaskBoardDto> fetchTaskboard(int id);
  Future<List<TaskBoardDto>> fetchTaskboards(int id);
  Future<TaskListDto> fetchTasklist(int id);
  Future<List<TaskListDto>> fetchTasklists();
}
