import 'package:tasklist/src/layers/domain/entities/task_entity.dart';
import 'package:tasklist/src/layers/domain/entities/task_list_entity.dart';
import 'package:tasklist/src/layers/domain/entities/taskboard_entity.dart';
import 'package:tasklist/src/layers/domain/repositories/get_entities_repository.dart';

abstract class GetEntitiesUseCase {
  Future<List<TaskEntity>> fetchTasks(int id);
  Future<TaskBoardEntity> fetchTaskboard(int id);
  Future<List<TaskBoardEntity>> fetchTaskboards(int id);
  Future<TaskListEntity> fetchTasklist(int id);
  Future<List<TaskListEntity>> fetchTasklists();
}

class GetEntitiesCaseImp implements GetEntitiesUseCase {
  final GetEntitiesRepository _getTaskListRepository;

  GetEntitiesCaseImp(this._getTaskListRepository);

  @override
  Future<List<TaskEntity>> fetchTasks(int id) async {
    return await _getTaskListRepository.fetchTasks(id);
  }

  @override
  Future<TaskBoardEntity> fetchTaskboard(int id) async {
    return await _getTaskListRepository.fetchTaskboard(id);
  }

  @override
  Future<List<TaskBoardEntity>> fetchTaskboards(int id) async {
    return await _getTaskListRepository.fetchTaskboards(id);
  }

  @override
  Future<TaskListEntity> fetchTasklist(int id) async {
    return await _getTaskListRepository.fetchTasklist(id);
  }

  @override
  Future<List<TaskListEntity>> fetchTasklists() async {
    return await _getTaskListRepository.fetchTasklists();
  }
}
