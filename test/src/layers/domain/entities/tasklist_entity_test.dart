import 'package:flutter_test/flutter_test.dart';
import 'package:tasklist/src/layers/domain/entities/tasklist_entity.dart';

void main() {
  TasklistEntity tasklist = TasklistEntity(id: 1, name: 'Test', taskboards: []);

  test('tasklist entity not null', () {
    expect(tasklist, isNotNull);
  });

  test('tasklist entity id 1', () {
    expect(tasklist.id, 1);
  });

  test('tasklist taskboards starts empty', () {
    expect(tasklist.taskboards.isEmpty, true);
  });
}
