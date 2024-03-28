class UpdateDBQuery {
  static String get settings => '''
    UPDATE settings
    SET theme_mode = ?, sort_mode = ?, view_mode = ?, date_sync = ?
    WHERE cod = ?
  ''';

  static String get tasklist => '''
    UPDATE tasklist
    SET name = ?
    WHERE cod = ?
  ''';

  static String get taskboard => '''
    UPDATE taskboard
    SET cod_tasklist = ?,
    name = ?,
    date_created = ?,
    enabled = ?
    WHERE cod = ?
  ''';

  static String get dateCompleted => '''
    UPDATE date_completed
    SET cod_taskboard = ?,
    date_completed = ?
    WHERE cod = ?
  ''';

  static String get task => '''
    UPDATE task
    SET cod_taskboard = ?,
    description = ?,
    date_created = ?,
    date_completed = ?,
    completed = ?
    WHERE cod = ?
  ''';
}
