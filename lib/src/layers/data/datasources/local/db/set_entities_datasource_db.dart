import 'package:tasklist/src/layers/data/datasources/interfaces/set_entities_datasource.dart';
import 'package:tasklist/src/layers/data/dto/date_completed_dto.dart';
import 'package:tasklist/src/layers/data/dto/task_dto.dart';
import 'package:tasklist/src/layers/data/dto/task_list_dto.dart';
import 'package:tasklist/src/layers/data/dto/taskboard_dto.dart';

class SetEntitiesDataSourceDB implements SetEntitiesDataSource {
  @override
  Future<bool> saveDateCompleted(DateCompletedDto dateCompleted) {
    // TODO: implement saveDateCompleted
    throw UnimplementedError();
  }

  @override
  Future<bool> saveTask(TaskDto task) {
    // TODO: implement saveTask
    throw UnimplementedError();
  }

  @override
  Future<bool> saveTaskboard(TaskBoardDto taskboard) {
    // TODO: implement saveTaskboard
    throw UnimplementedError();
  }

  @override
  Future<bool> saveTasklist(TaskListDto tasklist) {
    // TODO: implement saveTasklist
    throw UnimplementedError();
  }
}
