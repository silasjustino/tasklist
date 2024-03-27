class TaskEntity {
  int id;
  String description;
  String dateCreated;
  String? dateCompleted;
  bool completed = false;

  TaskEntity({
    required this.id,
    required this.description,
    required this.dateCreated,
    this.dateCompleted,
  });
}
