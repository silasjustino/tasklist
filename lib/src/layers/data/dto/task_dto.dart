import 'package:tasklist/src/layers/data/datasources/local/db/get_entities_datasource_db.dart';
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

  Map toMap() {
    return {
      'cod': cod,
      'cod_taskboard': codTaskboard,
      'description': descriptionDto,
      'date_created': dateCreatedDto,
      'date_completed': dateCompletedDto,
      'completed': completedDto,
    };
  }

  static Future<TaskDto> fromEntity(TaskEntity task) async {
    final getDB = GetEntitiesDataSourceDB();

    return await getDB.fetchTask(task.id);
  }
}
