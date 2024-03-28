import 'package:flutter_test/flutter_test.dart';
import 'package:tasklist/src/layers/domain/entities/task_entity.dart';

void main() {
  TaskEntity task = TaskEntity(
    id: 1,
    idTaskboard: 1,
    description: 'Nova task',
    dateCreated: '27-03-2024-19:38',
  );

  test('task entity not null', () {
    expect(task, isNotNull);
  });

  test('task entity id 1', () {
    expect(task.id, 1);
  });

  test('task dateCompleted starts null', () {
    expect(task.dateCompleted, isNull);
  });
}
