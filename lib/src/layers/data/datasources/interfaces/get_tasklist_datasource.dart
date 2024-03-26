import 'package:tasklist/src/layers/data/dto/taskboard_list_dto.dart';

abstract class GetTaskListDataSource {
  Future<List<TaskListDto>> call();
}
