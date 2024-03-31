// ignore_for_file: avoid_print

import 'package:flutter_test/flutter_test.dart';
import 'package:tasklist/src/layers/data/datasources/local/db/db.dart';
import 'package:tasklist/src/layers/data/datasources/local/db/usecases/set_entities_datasource_db.dart';
import 'package:tasklist/src/layers/data/dto/settings_dto.dart';
import 'package:tasklist/src/layers/data/repositories/set_entities_repository_imp.dart';
import 'package:tasklist/src/layers/domain/entities/settings_entity.dart';
import 'package:tasklist/src/layers/domain/entities/task_list_entity.dart';
import 'package:tasklist/src/layers/domain/entities/taskboard_entity.dart';
import 'package:tasklist/src/layers/domain/usecases/set_entities_usecase.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() async {
  setUpAll(() {
    sqfliteFfiInit();

    databaseFactory = databaseFactoryFfi;
  });

  test('save settings id is not null', () async {
    final DB db = DB.instance;
    db.deleteDB();
    final Database database = await db.database;

    final SetEntitiesUseCase setEntities = SetEntitiesUseCaseImp(
        SetEntitiesRepositoryImp(SetEntitiesDataSourceDB(database)));

    SettingsEntity settings = SettingsEntity();

    settings = await setEntities.saveSettings(settings);

    var maps = await database.query('settings');

    SettingsDto settingsDto = SettingsDto.fromMap(maps.first);

    print("ID settings inserted: ${settingsDto.id}");

    expect(settingsDto.id, isNotNull);
  });

  test('save settings theme is dark', () async {
    final DB db = DB.instance;
    db.deleteDB();
    final Database database = await db.database;

    final SetEntitiesUseCase setEntities = SetEntitiesUseCaseImp(
        SetEntitiesRepositoryImp(SetEntitiesDataSourceDB(database)));

    SettingsEntity settings = SettingsEntity();

    settings = await setEntities.saveSettings(settings);

    var maps = await database.query('settings');

    SettingsDto settingsDto = SettingsDto.fromMap(maps.first);

    expect(settingsDto.theme, 'dark');
  });

  test('update settings id when saved', () async {
    final DB db = DB.instance;
    db.deleteDB();
    final Database database = await db.database;

    final SetEntitiesUseCase setEntities = SetEntitiesUseCaseImp(
        SetEntitiesRepositoryImp(SetEntitiesDataSourceDB(database)));

    SettingsEntity settings = SettingsEntity();

    settings = await setEntities.saveSettings(settings);

    expect(settings.id, isNotNull);
  });

  test('save tasklist id is not null', () async {
    final DB db = DB.instance;
    db.deleteDB();
    final Database database = await db.database;

    final SetEntitiesUseCase setEntities = SetEntitiesUseCaseImp(
        SetEntitiesRepositoryImp(SetEntitiesDataSourceDB(database)));

    TaskListEntity tasklist = TaskListEntity(name: 'Nova', taskboards: []);

    tasklist = await setEntities.saveTasklist(tasklist);

    expect(tasklist.id, isNotNull);
  });

  test('saved taskboard from tasklist id is not null', () async {
    final DB db = DB.instance;
    db.deleteDB();
    final Database database = await db.database;

    final SetEntitiesUseCase setEntities = SetEntitiesUseCaseImp(
        SetEntitiesRepositoryImp(SetEntitiesDataSourceDB(database)));

    TaskListEntity tasklist = TaskListEntity(
      name: 'Nova',
      taskboards: [],
    );

    tasklist = await setEntities.saveTasklist(tasklist);

    TaskBoardEntity taskboard = TaskBoardEntity(
      idTasklist: tasklist.id!,
      name: 'Taskboard',
      tasks: [],
      dateCompleted: [],
    );

    tasklist.taskboards.add(taskboard);

    tasklist = await setEntities.saveTasklist(tasklist);
    expect(tasklist.taskboards.length, 1);
  });
}
