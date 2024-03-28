import 'package:flutter_test/flutter_test.dart';
import 'package:tasklist/src/layers/domain/entities/task_entity.dart';
import 'package:tasklist/src/layers/domain/entities/taskboard_entity.dart';

void main() {
  List<TaskEntity> tasks = [
    TaskEntity(
        id: 1,
        idTaskboard: 1,
        description: 'New Task',
        dateCreated: '27-03-2024-19:44'),
    TaskEntity(
        id: 2,
        idTaskboard: 1,
        description: 'New Task 2',
        dateCreated: '27-03-2024-19:45'),
  ];
  TaskBoardEntity taskboard = TaskBoardEntity(
    id: 1,
    idTasklist: 1,
    name: 'College',
    tasks: tasks,
    dateCreated: '27-03-2024-19:44',
  );

  test('taskboard entity not null', () {
    expect(taskboard, isNotNull);
  });

  test('taskboard entity id 1', () {
    expect(taskboard.id, 1);
  });

  test('taskboard dateCompleted starts null', () {
    expect(taskboard.dateCompleted, isNull);
  });

  test('taskboard tasks is 2', () {
    expect(taskboard.tasks!.length, 2);
  });

  test('taskboard tasks completed', () {
    for (int i = 0; i < taskboard.tasks!.length; i++) {
      taskboard.tasks![i].completed = true;
    }

    expect(taskboard.tasks![1].completed, true);
  });

  test('taskboard tasks completed reseted', () {
    for (int i = 0; i < taskboard.tasks!.length; i++) {
      taskboard.tasks![i].completed = true;
    }

    taskboard.resetTaskBoard();

    expect(taskboard.tasks![1].completed, false);
  });
}
