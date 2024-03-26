import 'package:tasklist/layers/data/datasources/local/db/get_tasklist_datasource_db.dart';
import 'package:tasklist/layers/data/dto/taskboard_dto.dart';
import 'package:tasklist/layers/domain/entities/task_list_entity.dart';

class TaskListDto extends TaskListEntity {
  int cod;
  String nameDto;

  TaskListDto._({
    required this.cod,
    required this.nameDto,
  }) : super(
          id: cod,
          name: nameDto,
        );

  static Future<TaskListEntity> create(
    int cod,
    String name,
    List<Map> taskboards,
  ) async {
    final entity = TaskListDto._(
      cod: cod,
      nameDto: name,
    );

    entity.taskboards = await _fetchTaskBoards(taskboards);

    return entity;
  }

  static Future<List<TaskBoardDto>> _fetchTaskBoards(
      List<Map> taskboards) async {
    List<TaskBoardDto> taskboardsDto = [];

    for (int i = 0; i < taskboards.length; i++) {
      taskboardsDto.add(await TaskBoardDto.fromMap(taskboards[i]));
    }

    return taskboardsDto;
  }

  static Future<TaskListEntity> fromMap(Map map) async {
    var getDB = GetTaskListDataSourceDB();

    var taskboards = await getDB.fetchTaskBoards(map['cod']);
    //fetch das taskboards
    return TaskListDto.create(
      map['cod'],
      map['name'],
      taskboards,
    );
  }
}
