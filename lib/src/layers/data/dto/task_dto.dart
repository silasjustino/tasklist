import 'package:tasklist/src/layers/domain/entities/task_entity.dart';

class TaskDto extends TaskEntity {
  int cod;
  int codTaskboard;
  String descriptionDto;
  String dateCreatedDto;
  String dateCompletedDto;
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
}
