class TaskEntity {
  int? id;
  int idTaskboard;
  String description;
  String dateCreated;
  String? dateCompleted;
  bool completed = false;

  TaskEntity({
    this.id,
    required this.idTaskboard,
    required this.description,
    required this.dateCreated,
    this.dateCompleted,
  });
}
