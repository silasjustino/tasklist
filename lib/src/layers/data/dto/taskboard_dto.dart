import 'package:tasklist/src/layers/data/datasources/local/db/get_entities_datasource_db.dart';
import 'package:tasklist/src/layers/data/dto/date_completed_dto.dart';
import 'package:tasklist/src/layers/data/dto/task_dto.dart';
import 'package:tasklist/src/layers/domain/entities/taskboard_entity.dart';

class TaskBoardDto extends TaskBoardEntity {
  int cod;
  int codTasklist;
  String nameDto;
  String dateCreatedDto;
  int enabledDto;
  List<TaskDto> tasksDto;
  List<DateCompletedDto> dateCompletedDto;

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
          tasks: tasksDto,
          dateCreated: dateCreatedDto,
        ) {
    dateCompleted = List.generate(dateCompletedDto.length, (i) {
      return dateCompletedDto[i].dateCompletedDto;
    });
  }

  static Future<TaskBoardDto> fromMap(Map map) async {
    var getDB = GetEntitiesDataSourceDB();

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

  Map toMap() {
    return {
      'cod': cod,
      'cod_tasklist': codTasklist,
      'name': nameDto,
      'date_created': dateCreatedDto,
      'enabled': enabledDto,
    };
  }
}
