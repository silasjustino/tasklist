// ignore_for_file: avoid_print

import 'package:flutter_test/flutter_test.dart';
import 'package:tasklist/src/layers/data/datasources/local/db/db.dart';
import 'package:tasklist/src/layers/data/datasources/local/db/usecases/set_entities_datasource_db.dart';
import 'package:tasklist/src/layers/data/dto/settings_dto.dart';
import 'package:tasklist/src/layers/data/repositories/set_entities_repository_imp.dart';
import 'package:tasklist/src/layers/domain/entities/settings_entity.dart';
import 'package:tasklist/src/layers/domain/usecases/set_entities_usecase.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() async {
  setUpAll(() {
    sqfliteFfiInit();

    databaseFactory = databaseFactoryFfi;
  });

  test('save settings cod is not null', () async {
    final Database db = await DB.instance.database;

    final SetEntitiesUseCase setEntities = SetEntitiesUseCaseImp(
        SetEntitiesRepositoryImp(SetEntitiesDataSourceDB(db)));

    SettingsEntity settings = SettingsEntity();

    settings = await setEntities.saveSettings(settings);

    var maps = await db.query('settings');

    SettingsDto settingsDto = SettingsDto.fromMap(maps.first);

    print("ID settings inserted: ${settingsDto.id}");

    expect(settingsDto.id, isNotNull);
  });

  test('save settings theme is dark', () async {
    final Database db = await DB.instance.database;

    final SetEntitiesUseCase setEntities = SetEntitiesUseCaseImp(
        SetEntitiesRepositoryImp(SetEntitiesDataSourceDB(db)));

    SettingsEntity settings = SettingsEntity();

    settings = await setEntities.saveSettings(settings);

    var maps = await db.query('settings');

    SettingsDto settingsDto = SettingsDto.fromMap(maps.first);

    expect(settingsDto.theme, 'dark');
  });

  test('update settings cod when saved', () async {
    final Database db = await DB.instance.database;

    final SetEntitiesUseCase setEntities = SetEntitiesUseCaseImp(
        SetEntitiesRepositoryImp(SetEntitiesDataSourceDB(db)));

    SettingsEntity settings = SettingsEntity();

    settings = await setEntities.saveSettings(settings);

    expect(settings.id, isNotNull);
  });
}
