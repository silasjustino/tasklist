import 'package:tasklist/src/layers/domain/entities/task_entity.dart';

class TaskDto extends TaskEntity {
  int? cod;
  int codTaskboard;
  String descriptionDto;
  String dateCreatedDto;
  String? dateCompletedDto;
  int completedDto;

  TaskDto(
    this.cod,
    this.codTaskboard,
    this.descriptionDto,
    this.dateCreatedDto,
    this.dateCompletedDto,
    this.completedDto,
  ) : super(
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
      map['cod'],
      map['cod_taskboard'],
      map['description'],
      map['date_created'],
      map['date_completed'],
      map['completed'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cod': cod,
      'cod_taskboard': codTaskboard,
      'description': descriptionDto,
      'date_created': dateCreatedDto,
      'date_completed': dateCompletedDto,
      'completed': completedDto,
    };
  }

  factory TaskDto.fromEntity(TaskEntity task) {
    return TaskDto(
      task.id,
      task.idTaskboard,
      task.description,
      task.dateCreated,
      task.dateCompleted,
      task.completed ? 1 : 0,
    );
  }
}
