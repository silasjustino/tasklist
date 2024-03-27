import 'package:tasklist/src/layers/domain/entities/date_completed_entity.dart';
import 'package:tasklist/src/layers/domain/entities/task_entity.dart';
import 'package:tasklist/src/layers/domain/entities/task_list_entity.dart';
import 'package:tasklist/src/layers/domain/entities/taskboard_entity.dart';
import 'package:tasklist/src/layers/domain/repositories/set_entities_repository.dart';

abstract class SetEntitiesUseCase {
  Future<bool> saveTask(TaskEntity task);
  Future<bool> saveDateCompleted(DateCompletedEntity dateCompleted);
  Future<bool> saveTaskboard(TaskBoardEntity taskboard);
  Future<bool> saveTasklist(TaskListEntity tasklist);
}

class SetEntitiesUseCaseImp implements SetEntitiesUseCase {
  final SetEntitiesRepository _setEntitiesRepository;

  SetEntitiesUseCaseImp(this._setEntitiesRepository);

  @override
  Future<bool> saveTask(TaskEntity task) async {
    return await _setEntitiesRepository.saveTask(task);
  }

  @override
  Future<bool> saveDateCompleted(DateCompletedEntity dateCompleted) async {
    return await _setEntitiesRepository.saveDateCompleted(dateCompleted);
  }

  @override
  Future<bool> saveTaskboard(TaskBoardEntity taskboard) async {
    return await _setEntitiesRepository.saveTaskboard(taskboard);
  }

  @override
  Future<bool> saveTasklist(TaskListEntity tasklist) async {
    return await _setEntitiesRepository.saveTasklist(tasklist);
  }
}
