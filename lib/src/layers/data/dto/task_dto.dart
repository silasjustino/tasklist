import 'package:tasklist/src/layers/domain/entities/task_entity.dart';

class TaskDto extends TaskEntity {
  int codTaskboard;
  String descriptionDto;
  String dateCreatedDto;
  String? dateCompletedDto;
  int completedDto;

  TaskDto({
    int? cod,
    required this.codTaskboard,
    required this.descriptionDto,
    required this.dateCreatedDto,
    required this.dateCompletedDto,
    required this.completedDto,
  }) : super(
          id: cod,
          idTaskboard: codTaskboard,
          description: descriptionDto,
          dateCreated: dateCreatedDto,
          dateCompleted: dateCompletedDto,
        ) {
    completedDto == 0 ? completed = false : completed = true;
  }

  factory TaskDto.fromMap(Map map) {
    return TaskDto(
      cod: map['cod'],
      codTaskboard: map['cod_taskboard'],
      descriptionDto: map['description'],
      dateCreatedDto: map['date_created'],
      dateCompletedDto: map['date_completed'],
      completedDto: map['completed'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cod': id,
      'cod_taskboard': codTaskboard,
      'description': descriptionDto,
      'date_created': dateCreatedDto,
      'date_completed': dateCompletedDto,
      'completed': completedDto,
    };
  }

  factory TaskDto.fromEntity(TaskEntity task) {
    return TaskDto(
      cod: task.id,
      codTaskboard: task.idTaskboard,
      descriptionDto: task.description,
      dateCreatedDto: task.dateCreated,
      dateCompletedDto: task.dateCompleted,
      completedDto: task.completed ? 1 : 0,
    );
  }
}
