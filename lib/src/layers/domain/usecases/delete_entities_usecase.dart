import 'package:tasklist/src/layers/domain/repositories/delete_entities_repository.dart';

abstract class DeleteEntitiesUseCase {
  Future<bool> deleteSettings(int id);
  Future<bool> deleteTask(int id);
  Future<bool> deleteDateCompleted(int id);
  Future<bool> deleteTaskboard(int id);
  Future<bool> deleteTasklist(int id);
}

class DeleteEntitiesUseCaseImp implements DeleteEntitiesUseCase {
  final DeleteEntitiesRepository _deleteEntitiesRepository;

  DeleteEntitiesUseCaseImp(this._deleteEntitiesRepository);

  @override
  Future<bool> deleteSettings(int id) async {
    return await _deleteEntitiesRepository.deleteSettings(id);
  }

  @override
  Future<bool> deleteTask(int id) async {
    return await _deleteEntitiesRepository.deleteTask(id);
  }

  @override
  Future<bool> deleteDateCompleted(int id) async {
    return await _deleteEntitiesRepository.deleteDateCompleted(id);
  }

  @override
  Future<bool> deleteTaskboard(int id) async {
    return await _deleteEntitiesRepository.deleteTaskboard(id);
  }

  @override
  Future<bool> deleteTasklist(int id) async {
    return await _deleteEntitiesRepository.deleteTasklist(id);
  }
}
