// ignore_for_file: avoid_print

import 'package:flutter_test/flutter_test.dart';
import 'package:tasklist/src/layers/data/datasources/local/db/db.dart';
import 'package:tasklist/src/layers/data/datasources/local/db/usecases/get_entities_datasource_db.dart';
import 'package:tasklist/src/layers/data/repositories/get_entities_repository_imp.dart';
import 'package:tasklist/src/layers/domain/entities/settings_entity.dart';
import 'package:tasklist/src/layers/domain/usecases/get_entities_usecase.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() async {
  setUpAll(() {
    sqfliteFfiInit();

    databaseFactory = databaseFactoryFfi;
  });

  //for testing purposes

  test('fetch settings cod is not null', () async {
    final Database db = await DB.instance.database;

    final GetEntitiesUseCase setEntities = GetEntitiesUseCaseImp(
        GetEntitiesRepositoryImp(GetEntitiesDataSourceDB(db)));

    SettingsEntity settings = await setEntities.fetchSettings(1);

    expect(settings.id, isNotNull);
  });

  test('fetch settings theme is dark', () async {
    final Database db = await DB.instance.database;

    final GetEntitiesUseCase setEntities = GetEntitiesUseCaseImp(
        GetEntitiesRepositoryImp(GetEntitiesDataSourceDB(db)));

    SettingsEntity settings = await setEntities.fetchSettings(1);

    expect(settings.themeMode.name, 'dark');
  });

  test('fetch tasklist cod when saved', () async {
    final Database db = await DB.instance.database;

    final GetEntitiesUseCase setEntities = GetEntitiesUseCaseImp(
        GetEntitiesRepositoryImp(GetEntitiesDataSourceDB(db)));

    SettingsEntity settings = await setEntities.fetchSettings(1);

    expect(settings.id, isNotNull);
  });
}
