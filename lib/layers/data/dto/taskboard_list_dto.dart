import 'package:tasklist/layers/domain/entities/taskboard_entity.dart';
import 'package:tasklist/layers/domain/entities/taskboard_list_entity.dart';

class TaskBoardListDto extends TaskBoardListEntity {
  TaskBoardListDto._();

  static TaskBoardListEntity create(
    int cod,
    String name,
    List<TaskBoardEntity> taskboards,
  ) {
    final entity = TaskBoardListDto._();

    entity.id = cod;
    entity.name = name;
    entity.taskboards = taskboards;

    return entity;
  }
}
