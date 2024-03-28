import 'package:tasklist/src/layers/domain/entities/date_completed_entity.dart';
import 'package:tasklist/src/layers/domain/entities/task_entity.dart';

class TaskBoardEntity {
  int? id;
  int idTasklist;
  String name;
  List<TaskEntity>? tasks;
  String dateCreated;
  List<DateCompletedEntity>? dateCompleted;
  bool enabled = true;

  TaskBoardEntity({
    this.id,
    required this.idTasklist,
    required this.name,
    this.tasks,
    required this.dateCreated,
    this.dateCompleted,
  });

  resetTaskBoard() {
    if (tasks != null) {
      for (int i = 0; i < tasks!.length; i++) {
        tasks![i].completed = false;
      }
    }
  }
}
