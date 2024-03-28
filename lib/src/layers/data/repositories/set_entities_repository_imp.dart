import 'package:tasklist/src/layers/data/datasources/interfaces/set_entities_datasource.dart';
import 'package:tasklist/src/layers/data/dto/date_completed_dto.dart';
import 'package:tasklist/src/layers/data/dto/settings_dto.dart';
import 'package:tasklist/src/layers/data/dto/task_dto.dart';
import 'package:tasklist/src/layers/data/dto/task_list_dto.dart';
import 'package:tasklist/src/layers/data/dto/taskboard_dto.dart';
import 'package:tasklist/src/layers/domain/entities/date_completed_entity.dart';
import 'package:tasklist/src/layers/domain/entities/settings_entity.dart';
import 'package:tasklist/src/layers/domain/entities/task_entity.dart';
import 'package:tasklist/src/layers/domain/entities/task_list_entity.dart';
import 'package:tasklist/src/layers/domain/entities/taskboard_entity.dart';
import 'package:tasklist/src/layers/domain/repositories/set_entities_repository.dart';

class SetEntitiesRepositoryImp implements SetEntitiesRepository {
  final SetEntitiesDataSource _setEntitiesDataSource;

  SetEntitiesRepositoryImp(this._setEntitiesDataSource);

  @override
  Future<SettingsEntity> saveSettings(SettingsEntity settings) async {
    final settingsDto = SettingsDto.fromEntity(settings);

    return await _setEntitiesDataSource.saveSettings(settingsDto);
  }

  @override
  Future<TaskEntity> saveTask(TaskEntity task) async {
    final taskDto = TaskDto.fromEntity(task);

    return await _setEntitiesDataSource.saveTask(taskDto);
  }

  @override
  Future<DateCompletedEntity> saveDateCompleted(
      DateCompletedEntity dateCompleted) async {
    final dateCompletedDto = DateCompletedDto.fromEntity(dateCompleted);

    return await _setEntitiesDataSource.saveDateCompleted(dateCompletedDto);
  }

  @override
  Future<TaskBoardEntity> saveTaskboard(TaskBoardEntity taskboard) async {
    final taskboardDto = TaskBoardDto.fromEntity(taskboard);

    return await _setEntitiesDataSource.saveTaskboard(taskboardDto);
  }

  @override
  Future<TaskListEntity> saveTasklist(TaskListEntity tasklist) async {
    final tasklistDto = TaskListDto.fromEntity(tasklist);

    return await _setEntitiesDataSource.saveTasklist(tasklistDto);
  }
}
