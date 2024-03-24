import 'package:tasklist/layers/domain/entities/taskboard_list_entity.dart';

abstract class GetTaskListRepository {
  TaskBoardListEntity call();
}
