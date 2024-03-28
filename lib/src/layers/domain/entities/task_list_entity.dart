import 'package:tasklist/src/layers/domain/entities/taskboard_entity.dart';

class TaskListEntity {
  int? id;
  String name;
  List<TaskBoardEntity> taskboards;

  TaskListEntity({
    this.id,
    required this.name,
    required this.taskboards,
  });
}
