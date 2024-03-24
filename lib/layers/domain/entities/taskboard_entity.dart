import 'package:tasklist/layers/domain/entities/task_entity.dart';

class TaskBoardEntity {
  late int id;
  late String name;
  late List<TaskEntity> tasks;
  late String dateCreated;
  late List<String> dateCompleted;
  bool enabled = true;

  resetTaskBoard() {
    final completedTasks = tasks.where((task) => task.completed).toList();
    for (var i = 0; i < completedTasks.length; i++) {
      completedTasks[i].completed = false;
    }
  }
}
