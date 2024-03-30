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
  });

  //for testing purposes

  test('fetch settings cod is not null', () async {
    final DB db = DB.instance;
    db.deleteDB();
    final Database database = await db.database;

    final SetEntitiesUseCase setEntities = SetEntitiesUseCaseImp(
        SetEntitiesRepositoryImp(SetEntitiesDataSourceDB(database)));

    SettingsEntity? settings = SettingsEntity();

    settings = await setEntities.saveSettings(settings);

    final GetEntitiesUseCase getEntities = GetEntitiesUseCaseImp(
        GetEntitiesRepositoryImp(GetEntitiesDataSourceDB(database)));

    settings = await getEntities.fetchSettings(settings.id!);

    expect(settings!.id, isNotNull);
  });

  test('fetch settings theme is dark', () async {
    final DB db = DB.instance;
    db.deleteDB();
    final Database database = await db.database;

    final SetEntitiesUseCase setEntities = SetEntitiesUseCaseImp(
        SetEntitiesRepositoryImp(SetEntitiesDataSourceDB(database)));

    SettingsEntity? settings = SettingsEntity();

    settings = await setEntities.saveSettings(settings);

    final GetEntitiesUseCase getEntities = GetEntitiesUseCaseImp(
        GetEntitiesRepositoryImp(GetEntitiesDataSourceDB(database)));

    settings = await getEntities.fetchSettings(settings.id!);

    expect(settings!.themeMode.name, 'dark');
  });

  test('fetch tasklist cod when saved', () async {
    final DB db = DB.instance;
    db.deleteDB();
    final Database database = await db.database;

    final SetEntitiesUseCase setEntities = SetEntitiesUseCaseImp(
        SetEntitiesRepositoryImp(SetEntitiesDataSourceDB(database)));

    TaskListEntity? tasklist = TaskListEntity(name: 'Test', taskboards: []);

    tasklist = await setEntities.saveTasklist(tasklist);

    TaskBoardEntity taskboard = TaskBoardEntity(
      idTasklist: tasklist.id!,
      name: 'Taskboard',
      dateCreated: '28/03/2024-18:09',
      tasks: [],
      dateCompleted: [],
    );

    tasklist.taskboards.add(taskboard);

    tasklist = await setEntities.saveTasklist(tasklist);

    final GetEntitiesUseCase getEntities = GetEntitiesUseCaseImp(
        GetEntitiesRepositoryImp(GetEntitiesDataSourceDB(database)));

    tasklist = await getEntities.fetchTasklist(tasklist.id!);

    expect(tasklist!.id, isNotNull);
  });
}
