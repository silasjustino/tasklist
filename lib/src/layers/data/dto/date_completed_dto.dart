import 'package:tasklist/src/layers/data/datasources/local/db/get_entities_datasource_db.dart';
import 'package:tasklist/src/layers/domain/entities/date_completed_entity.dart';

class DateCompletedDto extends DateCompletedEntity {
  int cod;
  int codTaskboard;
  String dateCompletedDto;

  DateCompletedDto(
    this.cod,
    this.codTaskboard,
    this.dateCompletedDto,
  ) : super(id: cod, dateCompleted: dateCompletedDto);

  factory DateCompletedDto.fromMap(Map map) {
    return DateCompletedDto(
      map['cod'],
      map['cod_taskboard'],
      map['date_completed'],
    );
  }

  Map toMap() {
    return {
      'cod': cod,
      'cod_taskboard': codTaskboard,
      'date_completed': dateCompletedDto,
    };
  }

  static Future<DateCompletedDto> fromEntity(
      DateCompletedEntity dateCompleted) async {
    final getDB = GetEntitiesDataSourceDB();

    return await getDB.fetchDateCompleted(dateCompleted.id);
  }
}
