// ignore_for_file: avoid_print, unused_local_variable

import 'package:flutter_test/flutter_test.dart';
import 'package:tasklist/src/layers/data/datasources/local/db/db.dart';
import 'package:tasklist/src/layers/data/datasources/local/db/usecases/get_entities_datasource_db.dart';
import 'package:tasklist/src/layers/data/datasources/local/db/usecases/set_entities_datasource_db.dart';
import 'package:tasklist/src/layers/data/repositories/get_entities_repository_imp.dart';
import 'package:tasklist/src/layers/data/repositories/set_entities_repository_imp.dart';
import 'package:tasklist/src/layers/domain/entities/settings_entity.dart';
import 'package:tasklist/src/layers/domain/entities/task_list_entity.dart';
import 'package:tasklist/src/layers/domain/entities/taskboard_entity.dart';
import 'package:tasklist/src/layers/domain/usecases/get_entities_usecase.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:tasklist/src/layers/domain/usecases/set_entities_usecase.dart';

void main() async {
  setUpAll(() {
    sqfliteFfiInit();

    databaseFactory = databaseFactoryFfi;
    final DB db = DB.instance;
    db.deleteDB();
  });

  //for testing purposes

  test('fetch settings cod is not null', () async {
    final Database database = await DB.instance.database;

    final SetEntitiesUseCase setEntities = SetEntitiesUseCaseImp(
        SetEntitiesRepositoryImp(await SetEntitiesDataSourceDB.create()));

    SettingsEntity? settings = SettingsEntity();

    settings = await setEntities.saveSettings(settings);

    final GetEntitiesUseCase getEntities = GetEntitiesUseCaseImp(
        GetEntitiesRepositoryImp(await GetEntitiesDataSourceDB.create()));

    settings = await getEntities.fetchSettings(settings.id!);

    expect(settings!.id, isNotNull);
  });

  test('fetch settings theme is dark', () async {
    final Database database = await DB.instance.database;

    final SetEntitiesUseCase setEntities = SetEntitiesUseCaseImp(
        SetEntitiesRepositoryImp(await SetEntitiesDataSourceDB.create()));

    SettingsEntity? settings = SettingsEntity();

    settings = await setEntities.saveSettings(settings);

    final GetEntitiesUseCase getEntities = GetEntitiesUseCaseImp(
        GetEntitiesRepositoryImp(await GetEntitiesDataSourceDB.create()));

    settings = await getEntities.fetchSettings(settings.id!);

    expect(settings!.themeMode.name, 'dark');
  });

  test('fetch tasklist cod when saved', () async {
    final Database database = await DB.instance.database;

    final SetEntitiesUseCase setEntities = SetEntitiesUseCaseImp(
        SetEntitiesRepositoryImp(await SetEntitiesDataSourceDB.create()));

    TaskListEntity? tasklist = TaskListEntity(name: 'Test', taskboards: []);

    tasklist = await setEntities.saveTasklist(tasklist);

    TaskBoardEntity taskboard = TaskBoardEntity(
      idTasklist: tasklist.id!,
      name: 'Taskboard',
      tasks: [],
      dateCompleted: [],
    );

    tasklist.taskboards.add(taskboard);

    tasklist = await setEntities.saveTasklist(tasklist);

    final GetEntitiesUseCase getEntities = GetEntitiesUseCaseImp(
        GetEntitiesRepositoryImp(await GetEntitiesDataSourceDB.create()));

    tasklist = await getEntities.fetchTasklist(tasklist.id!);

    expect(tasklist!.id, isNotNull);
  });

  test('fetch taskboard date_created recovered sucessfully', () async {
    final Database database = await DB.instance.database;

    final SetEntitiesUseCase setEntities = SetEntitiesUseCaseImp(
        SetEntitiesRepositoryImp(await SetEntitiesDataSourceDB.create()));

    TaskListEntity? tasklist = TaskListEntity(name: 'Test', taskboards: []);

    tasklist = await setEntities.saveTasklist(tasklist);

    TaskBoardEntity taskboard = TaskBoardEntity(
      idTasklist: tasklist.id!,
      name: 'Taskboard',
      tasks: [],
      dateCompleted: [],
    );

    tasklist.taskboards.add(taskboard);

    tasklist = await setEntities.saveTasklist(tasklist);

    final GetEntitiesUseCase getEntities = GetEntitiesUseCaseImp(
        GetEntitiesRepositoryImp(await GetEntitiesDataSourceDB.create()));

    tasklist = await getEntities.fetchTasklist(tasklist.id!);

    print(
        "Taskboard from Tasklist dateCreated: ${tasklist!.taskboards.first.dateCreated}");

    expect(tasklist.taskboards.first.dateCreated, isNotNull);
  });
}
