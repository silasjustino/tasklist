// ignore_for_file: avoid_print, unused_local_variable

import 'package:flutter_test/flutter_test.dart';
import 'package:tasklist/src/layers/data/datasources/local/db/db.dart';
import 'package:tasklist/src/layers/data/datasources/local/db/usecases/read_entities_datasource_db.dart';
import 'package:tasklist/src/layers/data/datasources/local/db/usecases/create_entities_datasource_db.dart';
import 'package:tasklist/src/layers/data/repositories/read_entities_repository_imp.dart';
import 'package:tasklist/src/layers/data/repositories/create_entities_repository_imp.dart';
import 'package:tasklist/src/layers/domain/entities/settings_entity.dart';
import 'package:tasklist/src/layers/domain/entities/tasklist_entity.dart';
import 'package:tasklist/src/layers/domain/entities/taskboard_entity.dart';
import 'package:tasklist/src/layers/domain/usecases/read_entities_usecase.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:tasklist/src/layers/domain/usecases/create_entities_usecase.dart';

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

    final CreateEntitiesUseCase setEntities = CreateEntitiesUseCaseImp(
        CreateEntitiesRepositoryImp(await CreateEntitiesDataSourceDB.create()));

    SettingsEntity? settings = SettingsEntity();

    settings = await setEntities.saveSettings(settings);

    final ReadEntitiesUseCase getEntities = ReadEntitiesUseCaseImp(
        ReadEntitiesRepositoryImp(await ReadEntitiesDataSourceDB.create()));

    settings = await getEntities.fetchSettings(settings.id!);

    expect(settings!.id, isNotNull);
  });

  test('fetch settings theme is dark', () async {
    final Database database = await DB.instance.database;

    final CreateEntitiesUseCase setEntities = CreateEntitiesUseCaseImp(
        CreateEntitiesRepositoryImp(await CreateEntitiesDataSourceDB.create()));

    SettingsEntity? settings = SettingsEntity();

    settings = await setEntities.saveSettings(settings);

    final ReadEntitiesUseCase getEntities = ReadEntitiesUseCaseImp(
        ReadEntitiesRepositoryImp(await ReadEntitiesDataSourceDB.create()));

    settings = await getEntities.fetchSettings(settings.id!);

    expect(settings!.themeMode.name, 'dark');
  });

  test('fetch tasklist cod when saved', () async {
    final Database database = await DB.instance.database;

    final CreateEntitiesUseCase setEntities = CreateEntitiesUseCaseImp(
        CreateEntitiesRepositoryImp(await CreateEntitiesDataSourceDB.create()));

    TasklistEntity? tasklist = TasklistEntity(name: 'Test', taskboards: []);

    tasklist = await setEntities.saveTasklist(tasklist);

    TaskboardEntity taskboard = TaskboardEntity(
      idTasklist: tasklist.id!,
      name: 'Taskboard',
      tasks: [],
      dateCompleted: [],
    );

    tasklist.taskboards.add(taskboard);

    tasklist = await setEntities.saveTasklist(tasklist);

    final ReadEntitiesUseCase getEntities = ReadEntitiesUseCaseImp(
        ReadEntitiesRepositoryImp(await ReadEntitiesDataSourceDB.create()));

    tasklist = await getEntities.fetchTasklist(tasklist.id!);

    expect(tasklist!.id, isNotNull);
  });

  test('fetch taskboard date_created recovered sucessfully', () async {
    final Database database = await DB.instance.database;

    final CreateEntitiesUseCase setEntities = CreateEntitiesUseCaseImp(
        CreateEntitiesRepositoryImp(await CreateEntitiesDataSourceDB.create()));

    final ReadEntitiesUseCase getEntities = ReadEntitiesUseCaseImp(
        ReadEntitiesRepositoryImp(await ReadEntitiesDataSourceDB.create()));

    TasklistEntity? tasklist = TasklistEntity(name: 'Test', taskboards: []);

    tasklist = await setEntities.saveTasklist(tasklist);

    TaskboardEntity taskboard = TaskboardEntity(
      idTasklist: tasklist.id!,
      name: 'Taskboard',
      tasks: [],
      dateCompleted: [],
    );

    await setEntities.saveTaskboard(taskboard);

    tasklist = await getEntities.fetchTasklist(tasklist.id!);

    print(
        "Taskboard from Tasklist dateCreated: ${tasklist!.taskboards.first.dateCreated}");

    expect(tasklist.taskboards.first.dateCreated, isNotNull);
  });
}
