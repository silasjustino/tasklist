// ignore_for_file: public_member_api_docs, sort_constructors_first
class TaskEntity {
  int id;
  String description;
  String dateCreated;
  String dateCompleted;
  bool completed = false;

  TaskEntity({
    required this.id,
    required this.description,
    required this.dateCreated,
    required this.dateCompleted,
  });
}
