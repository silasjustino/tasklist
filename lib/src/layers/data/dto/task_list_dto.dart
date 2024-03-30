import 'package:sqflite/sqflite.dart';
import 'package:tasklist/src/layers/data/datasources/local/db/db.dart';
import 'package:tasklist/src/layers/data/datasources/local/db/usecases/get_entities_datasource_db.dart';
import 'package:tasklist/src/layers/data/dto/taskboard_dto.dart';
import 'package:tasklist/src/layers/domain/entities/task_list_entity.dart';
import 'package:tasklist/src/layers/domain/entities/taskboard_entity.dart';

class TaskListDto extends TaskListEntity {
  String nameDto;
  List<TaskBoardEntity> taskboardsDto;

  TaskListDto({
    int? cod,
    required this.nameDto,
    required this.taskboardsDto,
  }) : super(
          id: cod,
          name: nameDto,
          taskboards: taskboardsDto,
        );

  static Future<TaskListDto> fromMap(Map map) async {
    final Database db = await DB.instance.database;

    var getDB = GetEntitiesDataSourceDB(db);

    var taskboards = await getDB.fetchListTaskboard(map['cod']);
    //fetch das taskboards
    return TaskListDto(
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

  factory TaskListDto.fromEntity(TaskListEntity tasklist) {
    var taskboards = <TaskBoardEntity>[];

    if (tasklist.taskboards.isNotEmpty) {
      for (int i = 0; i < tasklist.taskboards.length; i++) {
        taskboards.add(TaskBoardDto.fromEntity(tasklist.taskboards[i]));
      }
    }

    return TaskListDto(
      cod: tasklist.id,
      nameDto: tasklist.name,
      taskboardsDto: taskboards,
    );
  }
}
