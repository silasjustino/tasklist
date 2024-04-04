import 'package:tasklist/src/layers/domain/entities/date_completed_entity.dart';
import 'package:tasklist/src/layers/domain/entities/settings_entity.dart';
import 'package:tasklist/src/layers/domain/entities/task_entity.dart';
import 'package:tasklist/src/layers/domain/entities/tasklist_entity.dart';
import 'package:tasklist/src/layers/domain/entities/taskboard_entity.dart';
import 'package:tasklist/src/layers/domain/repositories/update_entities_repository.dart';

abstract class UpdateEntitiesUseCase {
  Future<bool> updateSettings(SettingsEntity settings);
  Future<bool> updateTask(TaskEntity task);
  Future<bool> updateDateCompleted(DateCompletedEntity dateCompleted);
  Future<bool> updateTaskboard(TaskboardEntity taskboard);
  Future<bool> updateTasklist(TasklistEntity tasklist);
}

class UpdateEntitiesUseCaseImp implements UpdateEntitiesUseCase {
  final UpdateEntitiesRepository _updateEntitiesRepository;

  UpdateEntitiesUseCaseImp(this._updateEntitiesRepository);

  @override
  Future<bool> updateSettings(SettingsEntity settings) async {
    return await _updateEntitiesRepository.updateSettings(settings);
  }

  @override
  Future<bool> updateTask(TaskEntity task) async {
    return await _updateEntitiesRepository.updateTask(task);
  }

  @override
  Future<bool> updateDateCompleted(DateCompletedEntity dateCompleted) async {
    return await _updateEntitiesRepository.updateDateCompleted(dateCompleted);
  }

  @override
  Future<bool> updateTaskboard(TaskboardEntity taskboard) async {
    return await _updateEntitiesRepository.updateTaskboard(taskboard);
  }

  @override
  Future<bool> updateTasklist(TasklistEntity tasklist) async {
    return await _updateEntitiesRepository.updateTasklist(tasklist);
  }
}
