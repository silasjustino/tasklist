// ignore_for_file: avoid_print

import 'package:flutter_test/flutter_test.dart';
import 'package:tasklist/src/layers/domain/entities/task_entity.dart';
import 'package:tasklist/src/layers/domain/entities/taskboard_entity.dart';

void main() {
  List<TaskEntity> tasks = [
    TaskEntity(
      id: 1,
      idTaskboard: 1,
      description: 'New Task',
    ),
    TaskEntity(
      id: 2,
      idTaskboard: 1,
      description: 'New Task 2',
    ),
  ];
  TaskboardEntity taskboard = TaskboardEntity(
    id: 1,
    idTasklist: 1,
    name: 'College',
    tasks: tasks,
    dateCompleted: [],
  );

  test('taskboard entity not null', () {
    expect(taskboard, isNotNull);
  });

  test('taskboard entity id 1', () {
    expect(taskboard.id, 1);
  });

  test('taskboard dateCompleted starts empty', () {
    expect(taskboard.dateCompleted.isEmpty, true);
  });

  test('taskboard tasks is 2', () {
    expect(taskboard.tasks.length, 2);
  });

  test('taskboard dateCreated is not null', () {
    print("Taskboard Date Created: ${taskboard.dateCreated}");
    expect(taskboard.dateCreated, isNotNull);
  });

  test('taskboard tasks completed', () {
    for (int i = 0; i < taskboard.tasks.length; i++) {
      taskboard.tasks[i].completed = true;
    }

    expect(taskboard.tasks[1].completed, true);
  });

  test('taskboard tasks completed reseted', () {
    for (int i = 0; i < taskboard.tasks.length; i++) {
      taskboard.tasks[i].completed = true;
    }

    taskboard.resetTaskBoard();

    expect(taskboard.tasks[1].completed, false);
  });
}
