// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:tasklist/layers/domain/entities/taskboard_list_entity.dart';
import 'package:tasklist/layers/domain/repositories/get_tasklist_repository.dart';

abstract class GetTaskListUseCase {
  TaskBoardListEntity call();
}

class GetTaskListUseCaseImp implements GetTaskListUseCase {
  final GetTaskListRepository _getTaskListRepository;

  GetTaskListUseCaseImp(this._getTaskListRepository);

  @override
  TaskBoardListEntity call() {
    return _getTaskListRepository();
  }
}
