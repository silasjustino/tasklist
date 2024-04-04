import 'package:tasklist/src/layers/data/datasources/interfaces/read_entities_datasource.dart';
import 'package:tasklist/src/layers/domain/entities/date_completed_entity.dart';
import 'package:tasklist/src/layers/domain/entities/settings_entity.dart';
import 'package:tasklist/src/layers/domain/entities/task_entity.dart';
import 'package:tasklist/src/layers/domain/entities/tasklist_entity.dart';
import 'package:tasklist/src/layers/domain/entities/taskboard_entity.dart';
import 'package:tasklist/src/layers/domain/repositories/read_entities_repository.dart';

class ReadEntitiesRepositoryImp implements ReadEntitiesRepository {
  final ReadEntitiesDataSource _readEntitiesDataSource;

  ReadEntitiesRepositoryImp(this._readEntitiesDataSource);

  @override
  Future<SettingsEntity?> fetchSettings(int id) async {
    return await _readEntitiesDataSource.fetchSettings(id);
  }

  @override
  Future<TaskEntity?> fetchTask(int id) async {
    return await _readEntitiesDataSource.fetchTask(id);
  }

  @override
  Future<DateCompletedEntity?> fetchDateCompleted(int id) async {
    return await _readEntitiesDataSource.fetchDateCompleted(id);
  }

  @override
  Future<List<DateCompletedEntity>?> fetchListDateCompleted(int id) async {
    return await _readEntitiesDataSource.fetchListDateCompleted(id);
  }

  @override
  Future<List<TaskEntity>?> fetchListTask(int id) async {
    return await _readEntitiesDataSource.fetchListTask(id);
  }

  @override
  Future<TaskboardEntity?> fetchTaskboard(int id) async {
    return await _readEntitiesDataSource.fetchTaskboard(id);
  }

  @override
  Future<List<TaskboardEntity>?> fetchListTaskboard(int id) async {
    return await _readEntitiesDataSource.fetchListTaskboard(id);
  }

  @override
  Future<TasklistEntity?> fetchTasklist(int id) async {
    return await _readEntitiesDataSource.fetchTasklist(id);
  }

  @override
  Future<List<TasklistEntity>?> fetchListTasklist() async {
    return await _readEntitiesDataSource.fetchListTasklist();
  }
}
