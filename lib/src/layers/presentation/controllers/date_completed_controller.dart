import 'package:tasklist/src/layers/domain/entities/date_completed_entity.dart';
import 'package:tasklist/src/layers/domain/usecases/delete_entities_usecase.dart';
import 'package:tasklist/src/layers/domain/usecases/read_entities_usecase.dart';
import 'package:tasklist/src/layers/domain/usecases/create_entities_usecase.dart';
import 'package:tasklist/src/layers/domain/usecases/update_entities_usecase.dart';

class DateCompletedController {
  final CreateEntitiesUseCase _createEntities;
  final ReadEntitiesUseCase _readEntities;
  final UpdateEntitiesUseCase _updateEntities;
  final DeleteEntitiesUseCase _deleteEntities;

  DateCompletedController(
    this._readEntities,
    this._createEntities,
    this._updateEntities,
    this._deleteEntities,
  );

  Future<DateCompletedEntity> createDateCompleted(
      DateCompletedEntity dateCompleted) async {
    return await _createEntities.saveDateCompleted(dateCompleted);
  }

  Future<DateCompletedEntity?> readDateCompleted(id) async {
    return await _readEntities.fetchDateCompleted(id);
  }

  Future<bool> updateDateCompleted(DateCompletedEntity dateCompleted) async {
    return await _updateEntities.updateDateCompleted(dateCompleted);
  }

  Future<bool> deleteDateCompleted(int id) async {
    return await _deleteEntities.deleteDateCompleted(id);
  }
}
