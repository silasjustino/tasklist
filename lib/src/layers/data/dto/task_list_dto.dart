import 'package:tasklist/src/layers/data/datasources/local/db/usecases/get_entities_datasource_db.dart';
import 'package:tasklist/src/layers/data/dto/taskboard_dto.dart';
import 'package:tasklist/src/layers/domain/entities/task_list_entity.dart';

class TaskListDto extends TaskListEntity {
  int cod;
  String nameDto;
  List<TaskBoardDto> taskboardsDto;

  TaskListDto(
    this.cod,
    this.nameDto,
    this.taskboardsDto,
  ) : super(
          id: cod,
          name: nameDto,
          taskboards: taskboardsDto,
        );

  static Future<TaskListDto> fromMap(Map map) async {
    var getDB = GetEntitiesDataSourceDB();

    var taskboards = await getDB.fetchListTaskboard(map['cod']);
    //fetch das taskboards
    return TaskListDto(
      map['cod'],
      map['name'],
      taskboards,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cod': cod,
      'name': nameDto,
    };
  }

  factory TaskListDto.fromEntity(TaskListEntity tasklist) {
    var taskboards = <TaskBoardDto>[];

    if (tasklist.taskboards != null) {
      for (int i = 0; i < tasklist.taskboards!.length; i++) {
        taskboards.add(TaskBoardDto.fromEntity(tasklist.taskboards![i]));
      }
    }

    return TaskListDto(
      tasklist.id,
      tasklist.name,
      taskboards,
    );
  }
}
