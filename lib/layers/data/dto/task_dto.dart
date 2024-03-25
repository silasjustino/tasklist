import 'package:tasklist/layers/domain/entities/task_entity.dart';

class TaskDto extends TaskEntity {
  late int codTaskboard;
  late int completedDto;

  TaskDto._();

  static TaskEntity create(
    int cod,
    int codTaskboard,
    String description,
    String dateCreated,
    String dateCompleted,
    int completed,
  ) {
    final entity = TaskDto._();
    entity.codTaskboard = codTaskboard;

    entity.id = cod;
    entity.description = description;
    entity.dateCreated = dateCreated;
    entity.dateCompleted = dateCompleted;

    completed == 0 ? entity.completed = false : entity.completed = true;

    return entity;
  }
}
