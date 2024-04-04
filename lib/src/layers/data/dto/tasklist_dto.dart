import 'package:tasklist/src/layers/data/datasources/local/db/usecases/read_entities_datasource_db.dart';
import 'package:tasklist/src/layers/data/dto/taskboard_dto.dart';
import 'package:tasklist/src/layers/domain/entities/tasklist_entity.dart';
import 'package:tasklist/src/layers/domain/entities/taskboard_entity.dart';

class TasklistDto extends TasklistEntity {
  String nameDto;
  List<TaskboardEntity> taskboardsDto;

  TasklistDto({
    int? cod,
    required this.nameDto,
    required this.taskboardsDto,
  }) : super(
          id: cod,
          name: nameDto,
          taskboards: taskboardsDto,
        );

  static Future<TasklistDto> fromMap(Map map) async {
    var getDB = await ReadEntitiesDataSourceDB.create();

    var taskboards = await getDB.fetchListTaskboard(map['cod']);
    //fetch das taskboards
    return TasklistDto(
      cod: map['cod'],
      nameDto: map['name'],
      taskboardsDto: taskboards!,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cod': id,
      'name': nameDto,
    };
  }

  factory TasklistDto.fromEntity(TasklistEntity tasklist) {
    var taskboards = <TaskboardEntity>[];

    if (tasklist.taskboards.isNotEmpty) {
      for (int i = 0; i < tasklist.taskboards.length; i++) {
        taskboards.add(TaskboardDto.fromEntity(tasklist.taskboards[i]));
      }
    }

    return TasklistDto(
      cod: tasklist.id,
      nameDto: tasklist.name,
      taskboardsDto: taskboards,
    );
  }
}
