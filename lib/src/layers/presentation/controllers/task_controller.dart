import 'package:tasklist/src/layers/domain/entities/task_entity.dart';
import 'package:tasklist/src/layers/domain/usecases/create_entities_usecase.dart';
import 'package:tasklist/src/layers/domain/usecases/delete_entities_usecase.dart';
import 'package:tasklist/src/layers/domain/usecases/read_entities_usecase.dart';
import 'package:tasklist/src/layers/domain/usecases/update_entities_usecase.dart';

class TaskController {
  final CreateEntitiesUseCase _createEntities;
  final ReadEntitiesUseCase _readEntities;
  final UpdateEntitiesUseCase _updateEntities;
  final DeleteEntitiesUseCase _deleteEntities;

  TaskController(
    this._createEntities,
    this._readEntities,
    this._updateEntities,
    this._deleteEntities,
  );

  Future<TaskEntity> createTask(TaskEntity task) async {
    return await _createEntities.saveTask(task);
  }

  Future<TaskEntity?> readTask(id) async {
    return await _readEntities.fetchTask(id);
  }

  Future<bool> updateTask(TaskEntity task) async {
    return await _updateEntities.updateTask(task);
  }

  Future<bool> deleteTask(int id) async {
    return await _deleteEntities.deleteTask(id);
  }
}
