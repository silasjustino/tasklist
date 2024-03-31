import 'package:intl/intl.dart';

class DateCompletedEntity {
  int? id;
  int idTaskboard;
  String dateCompleted = '';

  DateCompletedEntity({
    this.id,
    required this.idTaskboard,
  }) {
    dateCompleted = DateFormat('dd/MM/yyyy - HH:mm').format(DateTime.now());
  }
}
