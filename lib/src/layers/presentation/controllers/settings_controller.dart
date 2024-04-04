import 'package:tasklist/src/layers/domain/entities/settings_entity.dart';
import 'package:tasklist/src/layers/domain/usecases/create_entities_usecase.dart';
import 'package:tasklist/src/layers/domain/usecases/delete_entities_usecase.dart';
import 'package:tasklist/src/layers/domain/usecases/read_entities_usecase.dart';
import 'package:tasklist/src/layers/domain/usecases/update_entities_usecase.dart';

class SettingsController {
  final CreateEntitiesUseCase _createEntities;
  final ReadEntitiesUseCase _readEntities;
  final UpdateEntitiesUseCase _updateEntities;
  final DeleteEntitiesUseCase _deleteEntities;

  SettingsController(
    this._createEntities,
    this._readEntities,
    this._updateEntities,
    this._deleteEntities,
  );

  Future<SettingsEntity> createSettings(SettingsEntity settings) async {
    return await _createEntities.saveSettings(settings);
  }

  Future<SettingsEntity?> readSettings(id) async {
    return await _readEntities.fetchSettings(id);
  }

  Future<bool> updateSettings(SettingsEntity settings) async {
    return await _updateEntities.updateSettings(settings);
  }

  Future<bool> deleteSettings(int id) async {
    return await _deleteEntities.deleteSettings(id);
  }
}
