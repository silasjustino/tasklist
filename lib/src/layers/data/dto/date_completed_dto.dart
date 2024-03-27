class DateCompletedDto {
  int cod;
  int codTaskboard;
  String dateCompletedDto;

  DateCompletedDto(
    this.cod,
    this.codTaskboard,
    this.dateCompletedDto,
  );

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
}
