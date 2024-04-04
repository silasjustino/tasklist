// ignore_for_file: avoid_print, unused_local_variable

import 'package:flutter_test/flutter_test.dart';
import 'package:tasklist/src/layers/data/datasources/local/db/db.dart';
import 'package:tasklist/src/layers/data/datasources/local/db/usecases/read_entities_datasource_db.dart';
import 'package:tasklist/src/layers/data/datasources/local/db/usecases/create_entities_datasource_db.dart';
import 'package:tasklist/src/layers/data/dto/settings_dto.dart';
import 'package:tasklist/src/layers/data/repositories/read_entities_repository_imp.dart';
import 'package:tasklist/src/layers/data/repositories/create_entities_repository_imp.dart';
import 'package:tasklist/src/layers/domain/entities/settings_entity.dart';
import 'package:tasklist/src/layers/domain/entities/tasklist_entity.dart';
import 'package:tasklist/src/layers/domain/entities/taskboard_entity.dart';
import 'package:tasklist/src/layers/domain/usecases/read_entities_usecase.dart';
import 'package:tasklist/src/layers/domain/usecases/create_entities_usecase.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() async {
  setUpAll(() {
    sqfliteFfiInit();

    databaseFactory = databaseFactoryFfi;

    final DB db = DB.instance;
    db.deleteDB();
  });

  test('save settings id is not null', () async {
    final Database database = await DB.instance.database;

    final CreateEntitiesUseCase setEntities = CreateEntitiesUseCaseImp(
        CreateEntitiesRepositoryImp(await CreateEntitiesDataSourceDB.create()));

    SettingsEntity settings = SettingsEntity();

    settings = await setEntities.saveSettings(settings);

    var maps = await database.query('settings');

    SettingsDto settingsDto = SettingsDto.fromMap(maps.first);

    print("ID settings inserted: ${settingsDto.id}");

    expect(settingsDto.id, isNotNull);
  });

  test('save settings theme is dark', () async {
    final Database database = await DB.instance.database;

    final CreateEntitiesUseCase setEntities = CreateEntitiesUseCaseImp(
        CreateEntitiesRepositoryImp(await CreateEntitiesDataSourceDB.create()));

    SettingsEntity settings = SettingsEntity();

    settings = await setEntities.saveSettings(settings);

    var maps = await database.query('settings');

    SettingsDto settingsDto = SettingsDto.fromMap(maps.first);

    expect(settingsDto.theme, 'dark');
  });

  test('update settings id when saved', () async {
    final Database database = await DB.instance.database;

    final CreateEntitiesUseCase setEntities = CreateEntitiesUseCaseImp(
        CreateEntitiesRepositoryImp(await CreateEntitiesDataSourceDB.create()));

    final ReadEntitiesUseCase getEntities = ReadEntitiesUseCaseImp(
        ReadEntitiesRepositoryImp(await ReadEntitiesDataSourceDB.create()));

    SettingsEntity? settings = SettingsEntity();

    settings = await setEntities.saveSettings(settings);

    settings = await getEntities.fetchSettings(settings.id!);

    expect(settings!.id, isNotNull);
  });

  test('save tasklist id is not null', () async {
    final Database database = await DB.instance.database;

    final CreateEntitiesUseCase setEntities = CreateEntitiesUseCaseImp(
        CreateEntitiesRepositoryImp(await CreateEntitiesDataSourceDB.create()));

    TasklistEntity tasklist = TasklistEntity(name: 'Nova', taskboards: []);

    tasklist = await setEntities.saveTasklist(tasklist);

    expect(tasklist.id, isNotNull);
  });

  test('saved taskboard from tasklist id is not null', () async {
    final Database database = await DB.instance.database;

    final CreateEntitiesUseCase createEntities = CreateEntitiesUseCaseImp(
        CreateEntitiesRepositoryImp(await CreateEntitiesDataSourceDB.create()));

    TasklistEntity tasklist = TasklistEntity(
      name: 'Nova',
      taskboards: [],
    );

    tasklist = await createEntities.saveTasklist(tasklist);

    TaskboardEntity taskboard = TaskboardEntity(
      idTasklist: tasklist.id!,
      name: 'Taskboard',
      tasks: [],
      dateCompleted: [],
    );

    taskboard = await createEntities.saveTaskboard(taskboard);

    expect(taskboard.id, isNotNull);
  });
}
