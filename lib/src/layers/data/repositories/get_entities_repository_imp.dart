import 'package:tasklist/src/layers/data/datasources/interfaces/get_entities_datasource.dart';
import 'package:tasklist/src/layers/domain/entities/task_entity.dart';
import 'package:tasklist/src/layers/domain/entities/task_list_entity.dart';
import 'package:tasklist/src/layers/domain/entities/taskboard_entity.dart';
import 'package:tasklist/src/layers/domain/repositories/get_entities_repository.dart';

class GetEntitiesRepositoryImp implements GetEntitiesRepository {
  final GetEntitiesDataSource _getEntitiesDataSource;

  GetEntitiesRepositoryImp(this._getEntitiesDataSource);

  @override
  Future<List<TaskEntity>> fetchTasks(int id) async {
    return await _getEntitiesDataSource.fetchTasks(id);
  }

  @override
  Future<TaskBoardEntity> fetchTaskboard(int id) async {
    return await _getEntitiesDataSource.fetchTaskboard(id);
  }

  @override
  Future<List<TaskBoardEntity>> fetchTaskboards(int id) async {
    return await _getEntitiesDataSource.fetchTaskboards(id);
  }

  @override
  Future<TaskListEntity> fetchTasklist(int id) async {
    return await _getEntitiesDataSource.fetchTasklist(id);
  }

  @override
  Future<List<TaskListEntity>> fetchTasklists() async {
    return await _getEntitiesDataSource.fetchTasklists();
  }
}
