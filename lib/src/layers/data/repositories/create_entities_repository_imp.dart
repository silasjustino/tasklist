import 'package:tasklist/src/layers/data/datasources/interfaces/create_entities_datasource.dart';
import 'package:tasklist/src/layers/data/dto/date_completed_dto.dart';
import 'package:tasklist/src/layers/data/dto/settings_dto.dart';
import 'package:tasklist/src/layers/data/dto/task_dto.dart';
import 'package:tasklist/src/layers/data/dto/tasklist_dto.dart';
import 'package:tasklist/src/layers/data/dto/taskboard_dto.dart';
import 'package:tasklist/src/layers/domain/entities/date_completed_entity.dart';
import 'package:tasklist/src/layers/domain/entities/settings_entity.dart';
import 'package:tasklist/src/layers/domain/entities/task_entity.dart';
import 'package:tasklist/src/layers/domain/entities/tasklist_entity.dart';
import 'package:tasklist/src/layers/domain/entities/taskboard_entity.dart';
import 'package:tasklist/src/layers/domain/repositories/create_entities_repository.dart';

class CreateEntitiesRepositoryImp implements CreateEntitiesRepository {
  final CreateEntitiesDataSource _createEntitiesDataSource;

  CreateEntitiesRepositoryImp(this._createEntitiesDataSource);

  @override
  Future<SettingsEntity> saveSettings(SettingsEntity settings) async {
    final settingsDto = SettingsDto.fromEntity(settings);

    return await _createEntitiesDataSource.saveSettings(settingsDto);
  }

  @override
  Future<TaskEntity> saveTask(TaskEntity task) async {
    final taskDto = TaskDto.fromEntity(task);

    return await _createEntitiesDataSource.saveTask(taskDto);
  }

  @override
  Future<DateCompletedEntity> saveDateCompleted(
      DateCompletedEntity dateCompleted) async {
    final dateCompletedDto = DateCompletedDto.fromEntity(dateCompleted);

    return await _createEntitiesDataSource.saveDateCompleted(dateCompletedDto);
  }

  @override
  Future<TaskboardEntity> saveTaskboard(TaskboardEntity taskboard) async {
    final taskboardDto = TaskboardDto.fromEntity(taskboard);

    return await _createEntitiesDataSource.saveTaskboard(taskboardDto);
  }

  @override
  Future<TasklistEntity> saveTasklist(TasklistEntity tasklist) async {
    final tasklistDto = TasklistDto.fromEntity(tasklist);

    return await _createEntitiesDataSource.saveTasklist(tasklistDto);
  }
}
