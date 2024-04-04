import 'package:tasklist/src/layers/domain/entities/taskboard_entity.dart';
import 'package:tasklist/src/layers/domain/usecases/create_entities_usecase.dart';
import 'package:tasklist/src/layers/domain/usecases/delete_entities_usecase.dart';
import 'package:tasklist/src/layers/domain/usecases/read_entities_usecase.dart';
import 'package:tasklist/src/layers/domain/usecases/update_entities_usecase.dart';

class TaskboardController {
  final CreateEntitiesUseCase _createEntities;
  final ReadEntitiesUseCase _readEntities;
  final UpdateEntitiesUseCase _updateEntities;
  final DeleteEntitiesUseCase _deleteEntities;

  TaskboardController(
    this._createEntities,
    this._readEntities,
    this._updateEntities,
    this._deleteEntities,
  );

  Future<TaskboardEntity> createTaskboard(TaskboardEntity taskboard) async {
    return await _createEntities.saveTaskboard(taskboard);
  }

  Future<TaskboardEntity?> readTaskboard(id) async {
    return await _readEntities.fetchTaskboard(id);
  }

  Future<bool> updateTaskboard(TaskboardEntity taskboard) async {
    return await _updateEntities.updateTaskboard(taskboard);
  }

  Future<bool> deleteTaskboard(int id) async {
    return await _deleteEntities.deleteTaskboard(id);
  }
}
