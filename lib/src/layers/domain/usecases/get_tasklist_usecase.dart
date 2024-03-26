import 'package:tasklist/src/layers/domain/entities/task_list_entity.dart';
import 'package:tasklist/src/layers/domain/repositories/get_tasklist_repository.dart';

abstract class GetTaskListUseCase {
  Future<List<TaskListEntity>> call();
}

class GetTaskListUseCaseImp implements GetTaskListUseCase {
  final GetTaskListRepository _getTaskListRepository;

  GetTaskListUseCaseImp(this._getTaskListRepository);

  @override
  Future<List<TaskListEntity>> call() async {
    return await _getTaskListRepository();
  }
}
