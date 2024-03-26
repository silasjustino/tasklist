import 'package:tasklist/src/layers/domain/entities/task_list_entity.dart';

abstract class GetTaskListRepository {
  Future<List<TaskListEntity>> call();
}
