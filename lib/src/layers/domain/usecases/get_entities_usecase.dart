import 'package:tasklist/src/layers/domain/entities/date_completed_entity.dart';
import 'package:tasklist/src/layers/domain/entities/task_entity.dart';
import 'package:tasklist/src/layers/domain/entities/task_list_entity.dart';
import 'package:tasklist/src/layers/domain/entities/taskboard_entity.dart';
import 'package:tasklist/src/layers/domain/repositories/get_entities_repository.dart';

abstract class GetEntitiesUseCase {
  Future<TaskEntity> fetchTask(int id);
  Future<List<TaskEntity>> fetchListTask(int id);
  Future<DateCompletedEntity> fetchDateCompleted(int id);
  Future<List<DateCompletedEntity>> fetchListDateCompleted(int id);
  Future<TaskBoardEntity> fetchTaskboard(int id);
  Future<List<TaskBoardEntity>> fetchListTaskboard(int id);
  Future<TaskListEntity> fetchTasklist(int id);
  Future<List<TaskListEntity>> fetchListTasklist();
}

class GetEntitiesCaseImp implements GetEntitiesUseCase {
  final GetEntitiesRepository _getTaskListRepository;

  GetEntitiesCaseImp(this._getTaskListRepository);

  @override
  Future<TaskEntity> fetchTask(int id) async {
    return await _getTaskListRepository.fetchTask(id);
  }

  @override
  Future<List<TaskEntity>> fetchListTask(int id) async {
    return await _getTaskListRepository.fetchListTask(id);
  }

  @override
  Future<DateCompletedEntity> fetchDateCompleted(int id) async {
    return await _getTaskListRepository.fetchDateCompleted(id);
  }

  @override
  Future<List<DateCompletedEntity>> fetchListDateCompleted(int id) async {
    return await _getTaskListRepository.fetchListDateCompleted(id);
  }

  @override
  Future<TaskBoardEntity> fetchTaskboard(int id) async {
    return await _getTaskListRepository.fetchTaskboard(id);
  }

  @override
  Future<List<TaskBoardEntity>> fetchListTaskboard(int id) async {
    return await _getTaskListRepository.fetchListTaskboard(id);
  }

  @override
  Future<TaskListEntity> fetchTasklist(int id) async {
    return await _getTaskListRepository.fetchTasklist(id);
  }

  @override
  Future<List<TaskListEntity>> fetchListTasklist() async {
    return await _getTaskListRepository.fetchListTasklist();
  }
}
