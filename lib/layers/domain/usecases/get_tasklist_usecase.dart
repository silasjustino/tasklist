import 'package:tasklist/layers/domain/repositories/get_tasklist_repository.dart';

abstract class GetTaskListUseCase {
  Future<List<Map>> call();
}

class GetTaskListUseCaseImp implements GetTaskListUseCase {
  final GetTaskListRepository _getTaskListRepository;

  GetTaskListUseCaseImp(this._getTaskListRepository);

  @override
  Future<List<Map>> call() async {
    return await _getTaskListRepository();
  }
}
