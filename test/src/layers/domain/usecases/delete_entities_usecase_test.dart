// ignore_for_file: avoid_print

import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:tasklist/src/layers/data/datasources/local/db/db.dart';
import 'package:tasklist/src/layers/data/datasources/local/db/usecases/delete_entities_datasource_db.dart';
import 'package:tasklist/src/layers/data/datasources/local/db/usecases/set_entities_datasource_db.dart';
import 'package:tasklist/src/layers/data/repositories/delete_entities_repository_imp.dart';
import 'package:tasklist/src/layers/data/repositories/set_entities_repository_imp.dart';
import 'package:tasklist/src/layers/domain/entities/settings_entity.dart';
import 'package:tasklist/src/layers/domain/usecases/delete_entities_usecase.dart';
import 'package:tasklist/src/layers/domain/usecases/set_entities_usecase.dart';

void main() {
  setUpAll(() {
    sqfliteFfiInit();

    databaseFactory = databaseFactoryFfi;
  });

  test('Deleted corrected line', () async {
    final DB db = DB.instance;
    db.deleteDB();
    final Database database = await db.database;

    final SetEntitiesUseCase setEntities = SetEntitiesUseCaseImp(
        SetEntitiesRepositoryImp(SetEntitiesDataSourceDB(database)));

    final DeleteEntitiesUseCase deleteEntities = DeleteEntitiesUseCaseImp(
        DeleteEntitiesRepositoryImp(DeleteEntitiesDataSourceDB(database)));

    SettingsEntity? settings = SettingsEntity();

    settings = await setEntities.saveSettings(settings);

    bool result = await deleteEntities.deleteSettings(1);

    expect(result, true);
  });
}
