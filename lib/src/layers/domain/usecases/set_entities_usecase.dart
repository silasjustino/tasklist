import 'package:tasklist/src/layers/domain/entities/date_completed_entity.dart';
import 'package:tasklist/src/layers/domain/entities/settings_entity.dart';
import 'package:tasklist/src/layers/domain/entities/task_entity.dart';
import 'package:tasklist/src/layers/domain/entities/task_list_entity.dart';
import 'package:tasklist/src/layers/domain/entities/taskboard_entity.dart';
import 'package:tasklist/src/layers/domain/repositories/set_entities_repository.dart';

abstract class SetEntitiesUseCase {
  Future<SettingsEntity> saveSettings(SettingsEntity settings);
  Future<TaskEntity> saveTask(TaskEntity task);
  Future<DateCompletedEntity> saveDateCompleted(
      DateCompletedEntity dateCompleted);
  Future<TaskBoardEntity> saveTaskboard(TaskBoardEntity taskboard);
  Future<TaskListEntity> saveTasklist(TaskListEntity tasklist);
}

class SetEntitiesUseCaseImp implements SetEntitiesUseCase {
  final SetEntitiesRepository _setEntitiesRepository;

  SetEntitiesUseCaseImp(this._setEntitiesRepository);

  @override
  Future<SettingsEntity> saveSettings(SettingsEntity settings) async {
    return await _setEntitiesRepository.saveSettings(settings);
  }

  @override
  Future<TaskEntity> saveTask(TaskEntity task) async {
    return await _setEntitiesRepository.saveTask(task);
  }

  @override
  Future<DateCompletedEntity> saveDateCompleted(
      DateCompletedEntity dateCompleted) async {
    return await _setEntitiesRepository.saveDateCompleted(dateCompleted);
  }

  @override
  Future<TaskBoardEntity> saveTaskboard(TaskBoardEntity taskboard) async {
    return await _setEntitiesRepository.saveTaskboard(taskboard);
  }

  @override
  Future<TaskListEntity> saveTasklist(TaskListEntity tasklist) async {
    return await _setEntitiesRepository.saveTasklist(tasklist);
  }
}
