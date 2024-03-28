import 'package:tasklist/src/layers/data/datasources/local/db/usecases/get_entities_datasource_db.dart';
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
          idTasklist: codTasklist,
          name: nameDto,
          tasks: tasksDto,
          dateCreated: dateCreatedDto,
          dateCompleted: dateCompletedDto,
        ) {
    enabledDto == 0 ? enabled = false : enabled = true;
  }

  static Future<TaskBoardDto> fromMap(Map map) async {
    var getDB = GetEntitiesDataSourceDB();

    var tasks = await getDB.fetchListTask(map['cod']);
    var dateCompleted = await getDB.fetchListDateCompleted(map['cod']);

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

  Map<String, dynamic> toMap() {
    return {
      'cod': cod,
      'cod_tasklist': codTasklist,
      'name': nameDto,
      'date_created': dateCreatedDto,
      'enabled': enabledDto,
    };
  }

  factory TaskBoardDto.fromEntity(TaskBoardEntity taskboard) {
    var tasks = <TaskDto>[];
    var dateCompleted = <DateCompletedDto>[];

    if (taskboard.tasks != null) {
      for (int i = 0; i < taskboard.tasks!.length; i++) {
        tasks.add(TaskDto.fromEntity(taskboard.tasks![i]));
      }
    }

    if (taskboard.dateCompleted != null) {
      for (int i = 0; i < taskboard.dateCompleted!.length; i++) {
        dateCompleted
            .add(DateCompletedDto.fromEntity(taskboard.dateCompleted![i]));
      }
    }

    return TaskBoardDto(
      taskboard.id,
      taskboard.idTasklist,
      taskboard.name,
      taskboard.dateCreated,
      taskboard.enabled ? 1 : 0,
      tasks,
      dateCompleted,
    );
  }
}
