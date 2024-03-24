// import 'package:sqflite/sqflite.dart';
// import 'package:tasklist/layers/data/datasources/interfaces/get_tasklist_datasource.dart';
// import 'package:tasklist/layers/data/datasources/local/db/db.dart';
// import 'package:tasklist/layers/data/dto/taskboard_list_dto.dart';

// class GetTaskListDataSourceDB implements GetTaskListDataSource {
//   final Database _db = DB.instance.database;

//   Future<List<Map>> _fetchTasks(int id) async {
//     String sql = '''
//     SELECT *
//     FROM task
//     WHERE cod_taskboard = $id
//     ''';

//     return await _db.rawQuery(sql);
//   }

//   Future<List<Map>> _fetchDateCompleted(int id) async {
//     String sql = '''
//     SELECT *
//     FROM date_completed
//     WHERE cod_taskboard = $id
//     ''';

//     return await _db.rawQuery(sql);
//   }

//   Future<List<Map>> _fetchTaskBoards(int id) async {
//     String sql = '''
//     SELECT *
//     FROM taskboard
//     WHERE cod_tasklist = $id
//     ''';

//     List<Map> maps = await _db.rawQuery(sql);

//     //   return List.generate(maps.length, (i) {
//     //   return TaskboardDto(
//     //     id: maps[i]['id'],
//     //     name: maps[i]['name'],
//     //     // Same for the other properties
//     //   );
//     // });
//   }

//   Future<List<Map>> _fetchTaskLists() async {
//     String sql = '''
//     SELECT cod
//     FROM tasklist
//     ''';

//     List<Map> codTaskListsMaps = await _db.rawQuery(sql);

//     List<int> codTaskLists = List.generate(codTaskListsMaps.length, (i) {
//       return codTaskListsMaps[i]['cod'];
//     });

//     List<Map> taskboards;

//     for (int i = 0; i < codTaskLists.length; i++) {
//       await _fetchTaskBoards(codTaskLists[i]);
//     }
//   }

//   @override
//   TaskBoardListDto call() {
//     final tasklists = _fetchTaskLists();

//     return TaskBoardListDto();
//   }
// }
