class InsertDBQuery {
  static String get settings => '''
    INSERT INTO settings (theme_mode, sort_mode, view_mode, date_sync)
    VALUES (?, ?, ?, ?)
  ''';

  static String get tasklist => '''
    INSERT INTO tasklist (name)
    VALUES (?)
  ''';

  static String get taskboard => '''
    INSERT INTO taskboard (cod_tasklist, name, date_created, enabled)
    VALUES (?, ?, ?, ?)
  ''';

  static String get dateCompleted => '''
    INSERT INTO date_completed (cod_taskboard, date_completed)
    VALUES (?, ?)
  ''';

  static String get task => '''
    INSERT INTO task (cod_taskboard, description, date_created, date_completed, completed)
    VALUES (?, ?, ?, ?, ?)
  ''';
}
