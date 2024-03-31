import 'package:intl/intl.dart';

class TaskEntity {
  int? id;
  int idTaskboard;
  String description;
  String dateCreated = '';
  String? dateCompleted;
  bool completed = false;

  TaskEntity({
    this.id,
    required this.idTaskboard,
    required this.description,
  }) {
    dateCreated = DateFormat('dd/MM/yyyy - HH:mm').format(DateTime.now());
  }

  void completeTask() {
    completed = true;
    dateCompleted = DateFormat('dd/MM/yyyy - HH:mm').format(DateTime.now());
  }
}
