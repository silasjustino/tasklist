abstract class DeleteEntitiesRepository {
  Future<bool> deleteSettings(int id);
  Future<bool> deleteTask(int id);
  Future<bool> deleteDateCompleted(int id);
  Future<bool> deleteTaskboard(int id);
  Future<bool> deleteTasklist(int id);
}
