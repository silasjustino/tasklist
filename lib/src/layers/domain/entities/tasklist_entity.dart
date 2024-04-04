import 'package:tasklist/src/layers/domain/entities/taskboard_entity.dart';

class TasklistEntity {
  int? id;
  String name;
  List<TaskboardEntity> taskboards;

  TasklistEntity({
    this.id,
    required this.name,
    required this.taskboards,
  });
}
