import 'package:sqflite/sqflite.dart';
import 'package:tasklist/src/layers/data/datasources/interfaces/delete_entities_datasource.dart';

class DeleteEntitiesDataSourceDB implements DeleteEntitiesDataSource {
  final Database _db;

  DeleteEntitiesDataSourceDB(this._db);

  @override
  Future<int> deleteSettings(int id) async {
    return await _db.delete('settings', where: 'cod = ?', whereArgs: [id]);
  }

  @override
  Future<int> deleteTask(int id) async {
    return await _db.delete('task', where: 'cod = ?', whereArgs: [id]);
  }

  @override
  Future<int> deleteDateCompleted(int id) async {
    return await _db
        .delete('date_completed', where: 'cod = ?', whereArgs: [id]);
  }

  @override
  Future<int> deleteTaskboard(int id) async {
    return await _db.delete('taskboard', where: 'cod = ?', whereArgs: [id]);
  }

  @override
  Future<int> deleteTasklist(int id) async {
    return await _db.delete('tasklist', where: 'cod = ?', whereArgs: [id]);
  }
}
