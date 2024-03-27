import 'package:tasklist/src/layers/domain/entities/task_entity.dart';
import 'package:tasklist/src/layers/domain/entities/task_list_entity.dart';
import 'package:tasklist/src/layers/domain/entities/taskboard_entity.dart';

abstract class GetEntitiesRepository {
  Future<List<TaskEntity>> fetchTasks(int id);
  Future<TaskBoardEntity> fetchTaskboard(int id);
  Future<List<TaskBoardEntity>> fetchTaskboards(int id);
  Future<TaskListEntity> fetchTasklist(int id);
  Future<List<TaskListEntity>> fetchTasklists();
}
