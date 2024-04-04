import 'package:tasklist/src/layers/data/datasources/interfaces/update_entities_datasource.dart';
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
import 'package:tasklist/src/layers/domain/repositories/update_entities_repository.dart';

class UpdateEntitiesRepositoryImp implements UpdateEntitiesRepository {
  final UpdateEntitiesDataSource _updateEntitiesDataSource;

  UpdateEntitiesRepositoryImp(this._updateEntitiesDataSource);

  @override
  Future<bool> updateSettings(SettingsEntity settings) async {
    final settingsDto = SettingsDto.fromEntity(settings);

    return await _updateEntitiesDataSource.updateSettings(settingsDto);
  }

  @override
  Future<bool> updateTask(TaskEntity task) async {
    final taskDto = TaskDto.fromEntity(task);

    return await _updateEntitiesDataSource.updateTask(taskDto);
  }

  @override
  Future<bool> updateDateCompleted(DateCompletedEntity dateCompleted) async {
    final dateCompletedDto = DateCompletedDto.fromEntity(dateCompleted);

    return await _updateEntitiesDataSource
        .updateDateCompleted(dateCompletedDto);
  }

  @override
  Future<bool> updateTaskboard(TaskboardEntity taskboard) async {
    final taskboardDto = TaskboardDto.fromEntity(taskboard);

    return await _updateEntitiesDataSource.updateTaskboard(taskboardDto);
  }

  @override
  Future<bool> updateTasklist(TasklistEntity tasklist) async {
    final tasklistDto = TasklistDto.fromEntity(tasklist);

    return await _updateEntitiesDataSource.updateTasklist(tasklistDto);
  }
}
