import 'package:tasklist/src/layers/data/datasources/interfaces/delete_entities_datasource.dart';
import 'package:tasklist/src/layers/domain/repositories/delete_entities_repository.dart';

class DeleteEntitiesRepositoryImp implements DeleteEntitiesRepository {
  final DeleteEntitiesDataSource _deleteEntitiesDataSource;

  DeleteEntitiesRepositoryImp(this._deleteEntitiesDataSource);

  @override
  Future<bool> deleteSettings(int id) async {
    int result = await _deleteEntitiesDataSource.deleteSettings(id);
    bool resultBool = result == 0 ? false : true;
    return resultBool;
  }

  @override
  Future<bool> deleteTask(int id) async {
    int result = await _deleteEntitiesDataSource.deleteTask(id);
    bool resultBool = result == 0 ? false : true;
    return resultBool;
  }

  @override
  Future<bool> deleteDateCompleted(int id) async {
    int result = await _deleteEntitiesDataSource.deleteDateCompleted(id);
    bool resultBool = result == 0 ? false : true;
    return resultBool;
  }

  @override
  Future<bool> deleteTaskboard(int id) async {
    int result = await _deleteEntitiesDataSource.deleteTaskboard(id);
    bool resultBool = result == 0 ? false : true;
    return resultBool;
  }

  @override
  Future<bool> deleteTasklist(int id) async {
    int result = await _deleteEntitiesDataSource.deleteTasklist(id);
    bool resultBool = result == 0 ? false : true;
    return resultBool;
  }
}
