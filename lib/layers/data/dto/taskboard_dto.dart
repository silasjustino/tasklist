// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:tasklist/layers/domain/entities/task_entity.dart';
import 'package:tasklist/layers/domain/entities/taskboard_entity.dart';

class TaskBoardDto extends TaskBoardEntity {
  late int codTasklist;

  TaskBoardDto._();

  static TaskBoardEntity create(
    int cod,
    int codTasklist,
    String name,
    String dateCreated,
    int enabled,
    List<TaskEntity> tasks,
    List<String> dateCompleted,
  ) {
    final entity = TaskBoardDto._();

    entity.codTasklist = codTasklist;

    entity.id = cod;
    entity.name = name;
    entity.tasks = tasks;
    entity.dateCreated = dateCreated;
    entity.dateCompleted = dateCompleted;

    enabled == 0 ? entity.enabled = false : entity.enabled = true;

    return entity;
  }
}
