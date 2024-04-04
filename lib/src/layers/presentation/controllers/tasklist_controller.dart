import 'package:tasklist/src/layers/domain/entities/tasklist_entity.dart';
import 'package:tasklist/src/layers/domain/usecases/create_entities_usecase.dart';
import 'package:tasklist/src/layers/domain/usecases/delete_entities_usecase.dart';
import 'package:tasklist/src/layers/domain/usecases/read_entities_usecase.dart';
import 'package:tasklist/src/layers/domain/usecases/update_entities_usecase.dart';

class TasklistController {
  final CreateEntitiesUseCase _createEntities;
  final ReadEntitiesUseCase _readEntities;
  final UpdateEntitiesUseCase _updateEntities;
  final DeleteEntitiesUseCase _deleteEntities;

  TasklistController(
    this._createEntities,
    this._readEntities,
    this._updateEntities,
    this._deleteEntities,
  );

  Future<TasklistEntity> createTasklist(TasklistEntity tasklist) async {
    return await _createEntities.saveTasklist(tasklist);
  }

  Future<TasklistEntity?> readTasklist(id) async {
    return await _readEntities.fetchTasklist(id);
  }

  Future<bool> updateTasklist(TasklistEntity tasklist) async {
    return await _updateEntities.updateTasklist(tasklist);
  }

  Future<bool> deleteTasklist(int id) async {
    return await _deleteEntities.deleteTasklist(id);
  }
}
