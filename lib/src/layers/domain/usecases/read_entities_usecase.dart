import 'package:tasklist/src/layers/domain/entities/date_completed_entity.dart';
import 'package:tasklist/src/layers/domain/entities/settings_entity.dart';
import 'package:tasklist/src/layers/domain/entities/task_entity.dart';
import 'package:tasklist/src/layers/domain/entities/tasklist_entity.dart';
import 'package:tasklist/src/layers/domain/entities/taskboard_entity.dart';
import 'package:tasklist/src/layers/domain/repositories/read_entities_repository.dart';

abstract class ReadEntitiesUseCase {
  Future<SettingsEntity?> fetchSettings(int id);
  Future<TaskEntity?> fetchTask(int id);
  Future<List<TaskEntity>?> fetchListTask(int id);
  Future<DateCompletedEntity?> fetchDateCompleted(int id);
  Future<List<DateCompletedEntity>?> fetchListDateCompleted(int id);
  Future<TaskboardEntity?> fetchTaskboard(int id);
  Future<List<TaskboardEntity>?> fetchListTaskboard(int id);
  Future<TasklistEntity?> fetchTasklist(int id);
  Future<List<TasklistEntity>?> fetchListTasklist();
}

class ReadEntitiesUseCaseImp implements ReadEntitiesUseCase {
  final ReadEntitiesRepository _readEntitiesRepository;

  ReadEntitiesUseCaseImp(this._readEntitiesRepository);

  @override
  Future<SettingsEntity?> fetchSettings(int id) async {
    return await _readEntitiesRepository.fetchSettings(id);
  }

  @override
  Future<TaskEntity?> fetchTask(int id) async {
    return await _readEntitiesRepository.fetchTask(id);
  }

  @override
  Future<List<TaskEntity>?> fetchListTask(int id) async {
    return await _readEntitiesRepository.fetchListTask(id);
  }

  @override
  Future<DateCompletedEntity?> fetchDateCompleted(int id) async {
    return await _readEntitiesRepository.fetchDateCompleted(id);
  }

  @override
  Future<List<DateCompletedEntity>?> fetchListDateCompleted(int id) async {
    return await _readEntitiesRepository.fetchListDateCompleted(id);
  }

  @override
  Future<TaskboardEntity?> fetchTaskboard(int id) async {
    return await _readEntitiesRepository.fetchTaskboard(id);
  }

  @override
  Future<List<TaskboardEntity>?> fetchListTaskboard(int id) async {
    return await _readEntitiesRepository.fetchListTaskboard(id);
  }

  @override
  Future<TasklistEntity?> fetchTasklist(int id) async {
    return await _readEntitiesRepository.fetchTasklist(id);
  }

  @override
  Future<List<TasklistEntity>?> fetchListTasklist() async {
    return await _readEntitiesRepository.fetchListTasklist();
  }
}
