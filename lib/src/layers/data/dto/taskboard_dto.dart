import 'package:tasklist/src/layers/data/datasources/local/db/get_tasklist_datasource_db.dart';
import 'package:tasklist/src/layers/data/dto/date_completed_dto.dart';
import 'package:tasklist/src/layers/data/dto/task_dto.dart';
import 'package:tasklist/src/layers/domain/entities/taskboard_entity.dart';

class TaskBoardDto extends TaskBoardEntity {
  int cod;
  int codTasklist;
  String nameDto;
  String dateCreatedDto;
  int enabledDto;
  List<Map> tasksDto;
  List<Map> dateCompletedDto;

  TaskBoardDto(
    this.cod,
    this.codTasklist,
    this.nameDto,
    this.dateCreatedDto,
    this.enabledDto,
    this.tasksDto,
    this.dateCompletedDto,
  ) : super(
          id: cod,
          name: nameDto,
          dateCreated: dateCreatedDto,
        ) {
    tasks = List.generate(tasksDto.length, (i) {
      return TaskDto.fromMap(tasksDto[i]);
    });
    dateCompleted = List.generate(dateCompletedDto.length, (i) {
      return DateCompletedDto.fromMap(dateCompletedDto[i]).dateCompletedDto;
    });
  }

  static Future<TaskBoardDto> fromMap(Map map) async {
    var getDB = GetTaskListDataSourceDB();

    var tasks = await getDB.fetchTasks(map['cod']);
    var dateCompleted = await getDB.fetchDateCompleted(map['cod']);

    return TaskBoardDto(
      map['cod'],
      map['cod_tasklist'],
      map['name'],
      map['date_created'],
      map['enabled'],
      tasks,
      dateCompleted,
    );
  }
}
