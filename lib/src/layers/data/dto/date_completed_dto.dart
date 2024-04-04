import 'package:tasklist/src/layers/domain/entities/date_completed_entity.dart';

class DateCompletedDto extends DateCompletedEntity {
  String dateCompletedDto;

  DateCompletedDto({
    int? cod,
    required int codTaskboard,
    required this.dateCompletedDto,
  }) : super(
          id: cod,
          idTaskboard: codTaskboard,
        ) {
    dateCompleted = dateCompletedDto;
  }

  factory DateCompletedDto.fromMap(Map map) {
    return DateCompletedDto(
      cod: map['cod'],
      codTaskboard: map['cod_taskboard'],
      dateCompletedDto: map['date_completed'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cod': id,
      'cod_taskboard': idTaskboard,
      'date_completed': dateCompletedDto,
    };
  }

  factory DateCompletedDto.fromEntity(DateCompletedEntity dateCompleted) {
    return DateCompletedDto(
      cod: dateCompleted.id,
      codTaskboard: dateCompleted.idTaskboard,
      dateCompletedDto: dateCompleted.dateCompleted,
    );
  }
}
