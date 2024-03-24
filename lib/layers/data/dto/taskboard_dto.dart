// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:tasklist/layers/domain/entities/taskboard_entity.dart';

class TaskBoardDto extends TaskBoardEntity {
  late int cod;
  late String nameDto;
  late List<Map> tasksDto;
  late String dateCreatedDto;
  late List<Map> dateCompletedDto;

  TaskBoardDto._();

  Future<TaskBoardEntity> call() async {
    final entity = TaskBoardDto._();

    //entity.taskboards = await

    return entity;
  }
}
