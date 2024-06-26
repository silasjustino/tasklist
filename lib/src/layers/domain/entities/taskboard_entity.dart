import 'package:intl/intl.dart';
import 'package:tasklist/src/layers/domain/entities/date_completed_entity.dart';
import 'package:tasklist/src/layers/domain/entities/task_entity.dart';

class TaskboardEntity {
  int? id;
  int idTasklist;
  String name;
  List<TaskEntity> tasks;
  String dateCreated = '';
  List<DateCompletedEntity> dateCompleted;
  bool enabled = true;

  TaskboardEntity({
    this.id,
    required this.idTasklist,
    required this.name,
    required this.tasks,
    required this.dateCompleted,
  }) {
    dateCreated = DateFormat('dd/MM/yyyy - HH:mm').format(DateTime.now());
  }

  resetTaskBoard() {
    if (tasks.isNotEmpty) {
      for (int i = 0; i < tasks.length; i++) {
        tasks[i].completed = false;
      }
    }
  }
}
