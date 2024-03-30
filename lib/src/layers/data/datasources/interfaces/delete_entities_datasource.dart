abstract class DeleteEntitiesDataSource {
  Future<int> deleteSettings(int id);
  Future<int> deleteTask(int id);
  Future<int> deleteDateCompleted(int id);
  Future<int> deleteTaskboard(int id);
  Future<int> deleteTasklist(int id);
}
