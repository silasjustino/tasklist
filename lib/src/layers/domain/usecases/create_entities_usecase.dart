import 'package:tasklist/src/layers/domain/entities/date_completed_entity.dart';
import 'package:tasklist/src/layers/domain/entities/settings_entity.dart';
import 'package:tasklist/src/layers/domain/entities/task_entity.dart';
import 'package:tasklist/src/layers/domain/entities/tasklist_entity.dart';
import 'package:tasklist/src/layers/domain/entities/taskboard_entity.dart';
import 'package:tasklist/src/layers/domain/repositories/create_entities_repository.dart';

abstract class CreateEntitiesUseCase {
  Future<SettingsEntity> saveSettings(SettingsEntity settings);
  Future<TaskEntity> saveTask(TaskEntity task);
  Future<DateCompletedEntity> saveDateCompleted(
      DateCompletedEntity dateCompleted);
  Future<TaskboardEntity> saveTaskboard(TaskboardEntity taskboard);
  Future<TasklistEntity> saveTasklist(TasklistEntity tasklist);
}

class CreateEntitiesUseCaseImp implements CreateEntitiesUseCase {
  final CreateEntitiesRepository _createEntitiesRepository;

  CreateEntitiesUseCaseImp(this._createEntitiesRepository);

  @override
  Future<SettingsEntity> saveSettings(SettingsEntity settings) async {
    return await _createEntitiesRepository.saveSettings(settings);
  }

  @override
  Future<TaskEntity> saveTask(TaskEntity task) async {
    return await _createEntitiesRepository.saveTask(task);
  }

  @override
  Future<DateCompletedEntity> saveDateCompleted(
      DateCompletedEntity dateCompleted) async {
    return await _createEntitiesRepository.saveDateCompleted(dateCompleted);
  }

  @override
  Future<TaskboardEntity> saveTaskboard(TaskboardEntity taskboard) async {
    return await _createEntitiesRepository.saveTaskboard(taskboard);
  }

  @override
  Future<TasklistEntity> saveTasklist(TasklistEntity tasklist) async {
    return await _createEntitiesRepository.saveTasklist(tasklist);
  }
}
