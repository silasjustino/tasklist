import 'package:tasklist/src/layers/domain/entities/date_completed_entity.dart';
import 'package:tasklist/src/layers/domain/entities/task_entity.dart';

class TaskBoardEntity {
  int id;
  String name;
  List<TaskEntity> tasks;
  String dateCreated;
  List<DateCompletedEntity> dateCompleted;
  bool enabled = true;

  TaskBoardEntity({
    required this.id,
    required this.name,
    required this.tasks,
    required this.dateCreated,
    required this.dateCompleted,
  });

  resetTaskBoard() {
    final completedTasks = tasks.where((task) => task.completed).toList();
    for (var i = 0; i < completedTasks.length; i++) {
      completedTasks[i].completed = false;
    }
  }
}
