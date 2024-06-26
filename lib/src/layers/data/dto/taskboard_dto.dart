import 'package:tasklist/src/layers/data/datasources/local/db/usecases/read_entities_datasource_db.dart';
import 'package:tasklist/src/layers/data/dto/date_completed_dto.dart';
import 'package:tasklist/src/layers/data/dto/task_dto.dart';
import 'package:tasklist/src/layers/domain/entities/date_completed_entity.dart';
import 'package:tasklist/src/layers/domain/entities/task_entity.dart';
import 'package:tasklist/src/layers/domain/entities/taskboard_entity.dart';

class TaskboardDto extends TaskboardEntity {
  String nameDto;
  String dateCreatedDto;
  int enabledDto;
  List<TaskEntity> tasksDto;
  List<DateCompletedEntity> dateCompletedDto;

  TaskboardDto({
    int? cod,
    required int codTasklist,
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
          dateCompleted: dateCompletedDto,
        ) {
    dateCreated = dateCreatedDto;
    enabledDto == 0 ? enabled = false : enabled = true;
  }

  static Future<TaskboardDto> fromMap(Map map) async {
    var getDB = await ReadEntitiesDataSourceDB.create();

    var tasks = await getDB.fetchListTask(map['cod']);
    var dateCompleted = await getDB.fetchListDateCompleted(map['cod']);

    return TaskboardDto(
      cod: map['cod'],
      codTasklist: map['cod_tasklist'],
      nameDto: map['name'],
      dateCreatedDto: map['date_created'],
      enabledDto: map['enabled'],
      tasksDto: tasks!,
      dateCompletedDto: dateCompleted!,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cod': id,
      'cod_tasklist': idTasklist,
      'name': nameDto,
      'date_created': dateCreatedDto,
      'enabled': enabledDto,
    };
  }

  factory TaskboardDto.fromEntity(TaskboardEntity taskboard) {
    var tasks = <TaskEntity>[];
    var dateCompleted = <DateCompletedEntity>[];

    if (taskboard.tasks.isNotEmpty) {
      for (int i = 0; i < taskboard.tasks.length; i++) {
        tasks.add(TaskDto.fromEntity(taskboard.tasks[i]));
      }
    }

    if (taskboard.dateCompleted.isNotEmpty) {
      for (int i = 0; i < taskboard.dateCompleted.length; i++) {
        dateCompleted
            .add(DateCompletedDto.fromEntity(taskboard.dateCompleted[i]));
      }
    }

    return TaskboardDto(
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
