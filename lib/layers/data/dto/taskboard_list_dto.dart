import 'package:tasklist/layers/domain/entities/taskboard_list_entity.dart';

class TaskBoardListDto extends TaskBoardListEntity {
  late int cod;
  late String nameDto;
  late List<Map> taskboardsDto;

  TaskBoardListDto._();

  Future<TaskBoardListEntity> call() async {
    final entity = TaskBoardListDto._();

    //entity.taskboards = await

    return entity;
  }
}
