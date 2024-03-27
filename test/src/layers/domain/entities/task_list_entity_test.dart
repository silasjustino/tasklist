import 'package:flutter_test/flutter_test.dart';
import 'package:tasklist/src/layers/domain/entities/task_list_entity.dart';

void main() {
  TaskListEntity tasklist = TaskListEntity(id: 1, name: 'Test');

  test('tasklist entity not null', () {
    expect(tasklist, isNotNull);
  });

  test('tasklist entity id 1', () {
    expect(tasklist.id, 1);
  });

  test('tasklist taskboards starts null', () {
    expect(tasklist.taskboards, isNull);
  });
}
