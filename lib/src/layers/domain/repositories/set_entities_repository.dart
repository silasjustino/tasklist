import 'package:tasklist/src/layers/domain/entities/date_completed_entity.dart';
import 'package:tasklist/src/layers/domain/entities/task_entity.dart';
import 'package:tasklist/src/layers/domain/entities/task_list_entity.dart';
import 'package:tasklist/src/layers/domain/entities/taskboard_entity.dart';

abstract class SetEntitiesRepository {
  Future<bool> saveTask(TaskEntity task);
  Future<bool> saveDateCompleted(DateCompletedEntity dateCompleted);
  Future<bool> saveTaskboard(TaskBoardEntity taskboard);
  Future<bool> saveTasklist(TaskListEntity tasklist);
}
