import 'package:sqflite/sqflite.dart';
import 'package:tasklist/src/layers/data/datasources/local/db/db.dart';
import 'package:tasklist/src/layers/data/datasources/local/db/usecases/get_entities_datasource_db.dart';
import 'package:tasklist/src/layers/data/dto/date_completed_dto.dart';
import 'package:tasklist/src/layers/data/dto/task_dto.dart';
import 'package:tasklist/src/layers/domain/entities/taskboard_entity.dart';

class TaskBoardDto extends TaskBoardEntity {
  int codTasklist;
  String nameDto;
  String dateCreatedDto;
  int enabledDto;
  List<TaskDto> tasksDto;
  List<DateCompletedDto> dateCompletedDto;

  TaskBoardDto({
    int? cod,
    required this.codTasklist,
    required this.nameDto,
    required this.dateCreatedDto,
    required this.enabledDto,
    required this.tasksDto,
    required this.dateCompletedDto,
  }) : super(
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
    final Database db = await DB.instance.database;

    var getDB = GetEntitiesDataSourceDB(db);

    var tasks = await getDB.fetchListTask(map['cod']);
    var dateCompleted = await getDB.fetchListDateCompleted(map['cod']);

    return TaskBoardDto(
      cod: map['cod'],
      codTasklist: map['cod_tasklist'],
      nameDto: map['name'],
      dateCreatedDto: map['date_created'],
      enabledDto: map['enabled'],
      tasksDto: tasks,
      dateCompletedDto: dateCompleted,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cod': id,
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
      cod: taskboard.id,
      codTasklist: taskboard.idTasklist,
      nameDto: taskboard.name,
      dateCreatedDto: taskboard.dateCreated,
      enabledDto: taskboard.enabled ? 1 : 0,
      tasksDto: tasks,
      dateCompletedDto: dateCompleted,
    );
  }
}
