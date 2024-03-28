import 'package:tasklist/src/layers/domain/entities/date_completed_entity.dart';

class DateCompletedDto extends DateCompletedEntity {
  int? cod;
  int codTaskboard;
  String dateCompletedDto;

  DateCompletedDto(
    this.cod,
    this.codTaskboard,
    this.dateCompletedDto,
  ) : super(
          id: cod,
          idTaskboard: codTaskboard,
          dateCompleted: dateCompletedDto,
        );

  factory DateCompletedDto.fromMap(Map map) {
    return DateCompletedDto(
      map['cod'],
      map['cod_taskboard'],
      map['date_completed'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cod': cod,
      'cod_taskboard': codTaskboard,
      'date_completed': dateCompletedDto,
    };
  }

  factory DateCompletedDto.fromEntity(DateCompletedEntity dateCompleted) {
    return DateCompletedDto(
      dateCompleted.id,
      dateCompleted.idTaskboard,
      dateCompleted.dateCompleted,
    );
  }
}
