import 'package:tasklist/src/layers/data/datasources/interfaces/get_tasklist_datasource.dart';
import 'package:tasklist/src/layers/domain/entities/task_list_entity.dart';
import 'package:tasklist/src/layers/domain/repositories/get_tasklist_repository.dart';

class GetTaskListRepositoryImp implements GetTaskListRepository {
  final GetTaskListDataSource _getTaskListDataSource;

  GetTaskListRepositoryImp(this._getTaskListDataSource);

  @override
  Future<List<TaskListEntity>> call() async {
    return await _getTaskListDataSource();
  }
}
