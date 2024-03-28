import 'package:flutter_test/flutter_test.dart';
import 'package:tasklist/src/layers/domain/entities/date_completed_entity.dart';

void main() {
  DateCompletedEntity dateCompleted = DateCompletedEntity(
      id: 1, idTaskboard: 1, dateCompleted: '27-03-2024-19:29');

  test('date completed entity not null', () {
    expect(dateCompleted, isNotNull);
  });

  test('date completed id 1', () {
    expect(dateCompleted.id, 1);
  });
}
