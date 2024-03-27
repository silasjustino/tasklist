import 'package:tasklist/src/layers/data/datasources/interfaces/get_entities_datasource.dart';
import 'package:tasklist/src/layers/domain/entities/date_completed_entity.dart';
import 'package:tasklist/src/layers/domain/entities/task_entity.dart';
import 'package:tasklist/src/layers/domain/entities/task_list_entity.dart';
import 'package:tasklist/src/layers/domain/entities/taskboard_entity.dart';
import 'package:tasklist/src/layers/domain/repositories/get_entities_repository.dart';

class GetEntitiesRepositoryImp implements GetEntitiesRepository {
  final GetEntitiesDataSource _getEntitiesDataSource;

  GetEntitiesRepositoryImp(this._getEntitiesDataSource);

  @override
  Future<TaskEntity> fetchTask(int id) async {
    return await _getEntitiesDataSource.fetchTask(id);
  }

  @override
  Future<DateCompletedEntity> fetchDateCompleted(int id) async {
    return await _getEntitiesDataSource.fetchDateCompleted(id);
  }

  @override
  Future<List<DateCompletedEntity>> fetchListDateCompleted(int id) async {
    return await _getEntitiesDataSource.fetchListDateCompleted(id);
  }

  @override
  Future<List<TaskEntity>> fetchListTask(int id) async {
    return await _getEntitiesDataSource.fetchListTask(id);
  }

  @override
  Future<TaskBoardEntity> fetchTaskboard(int id) async {
    return await _getEntitiesDataSource.fetchTaskboard(id);
  }

  @override
  Future<List<TaskBoardEntity>> fetchListTaskboard(int id) async {
    return await _getEntitiesDataSource.fetchListTaskboard(id);
  }

  @override
  Future<TaskListEntity> fetchTasklist(int id) async {
    return await _getEntitiesDataSource.fetchTasklist(id);
  }

  @override
  Future<List<TaskListEntity>> fetchListTasklist() async {
    return await _getEntitiesDataSource.fetchListTasklist();
  }
}
