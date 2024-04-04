// ignore_for_file: avoid_print, unused_local_variable

import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:tasklist/src/layers/data/datasources/local/db/db.dart';
import 'package:tasklist/src/layers/data/datasources/local/db/usecases/delete_entities_datasource_db.dart';
import 'package:tasklist/src/layers/data/datasources/local/db/usecases/create_entities_datasource_db.dart';
import 'package:tasklist/src/layers/data/repositories/delete_entities_repository_imp.dart';
import 'package:tasklist/src/layers/data/repositories/create_entities_repository_imp.dart';
import 'package:tasklist/src/layers/domain/entities/settings_entity.dart';
import 'package:tasklist/src/layers/domain/usecases/delete_entities_usecase.dart';
import 'package:tasklist/src/layers/domain/usecases/create_entities_usecase.dart';

void main() {
  setUpAll(() {
    sqfliteFfiInit();

    databaseFactory = databaseFactoryFfi;
    final DB db = DB.instance;
    db.deleteDB();
  });

  test('Deleted corrected line', () async {
    final Database database = await DB.instance.database;

    final CreateEntitiesUseCase setEntities = CreateEntitiesUseCaseImp(
        CreateEntitiesRepositoryImp(await CreateEntitiesDataSourceDB.create()));

    final DeleteEntitiesUseCase deleteEntities = DeleteEntitiesUseCaseImp(
        DeleteEntitiesRepositoryImp(await DeleteEntitiesDataSourceDB.create()));

    SettingsEntity? settings = SettingsEntity();

    settings = await setEntities.saveSettings(settings);

    bool result = await deleteEntities.deleteSettings(1);

    expect(result, true);
  });
}
