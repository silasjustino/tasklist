import 'package:tasklist/layers/data/datasources/interfaces/get_tasklist_datasource.dart';
import 'package:tasklist/layers/domain/entities/taskboard_list_entity.dart';
import 'package:tasklist/layers/domain/repositories/get_tasklist_repository.dart';

class GetTaskListRepositoryImp implements GetTaskListRepository {
  final GetTaskListDataSource _getTaskListDataSource;

  GetTaskListRepositoryImp(this._getTaskListDataSource);

  @override
  TaskBoardListEntity call() {
    return _getTaskListDataSource();
  }
}
