// ignore_for_file: unused_local_variable

import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:tasklist/src/layers/data/datasources/local/db/db.dart';
import 'package:tasklist/src/layers/data/datasources/local/db/usecases/create_entities_datasource_db.dart';
import 'package:tasklist/src/layers/data/datasources/local/db/usecases/read_entities_datasource_db.dart';
import 'package:tasklist/src/layers/data/datasources/local/db/usecases/update_entities_datasource_db.dart';
import 'package:tasklist/src/layers/data/repositories/create_entities_repository_imp.dart';
import 'package:tasklist/src/layers/data/repositories/read_entities_repository_imp.dart';
import 'package:tasklist/src/layers/data/repositories/update_entities_repository_imp.dart';
import 'package:tasklist/src/layers/domain/entities/tasklist_entity.dart';
import 'package:tasklist/src/layers/domain/entities/taskboard_entity.dart';
import 'package:tasklist/src/layers/domain/usecases/create_entities_usecase.dart';
import 'package:tasklist/src/layers/domain/usecases/read_entities_usecase.dart';
import 'package:tasklist/src/layers/domain/usecases/update_entities_usecase.dart';

void main() {
  setUpAll(() {
    sqfliteFfiInit();

    databaseFactory = databaseFactoryFfi;
    final DB db = DB.instance;
    db.deleteDB();
  });

  test('update taskboard successfully', () async {
    final Database database = await DB.instance.database;

    final CreateEntitiesUseCase setEntities = CreateEntitiesUseCaseImp(
        CreateEntitiesRepositoryImp(await CreateEntitiesDataSourceDB.create()));

    final ReadEntitiesUseCase getEntities = ReadEntitiesUseCaseImp(
        ReadEntitiesRepositoryImp(await ReadEntitiesDataSourceDB.create()));

    final UpdateEntitiesUseCase updateEntities = UpdateEntitiesUseCaseImp(
        UpdateEntitiesRepositoryImp(await UpdateEntitiesDataSourceDB.create()));

    TasklistEntity? tasklist = TasklistEntity(name: 'Test', taskboards: []);

    tasklist = await setEntities.saveTasklist(tasklist);

    TaskboardEntity? taskboard = TaskboardEntity(
      idTasklist: tasklist.id!,
      name: 'Taskboard',
      tasks: [],
      dateCompleted: [],
    );

    taskboard = await setEntities.saveTaskboard(taskboard);

    taskboard.name = 'Novo nome Taskboard';

    await updateEntities.updateTaskboard(taskboard);

    taskboard = await getEntities.fetchTaskboard(taskboard.id!);

    expect(taskboard!.name, 'Novo nome Taskboard');
  });
}
