class CreateDBQuery {
  static String get settings => '''
    CREATE TABLE settings (
      cod INTEGER PRIMARY KEY AUTOINCREMENT,
      theme_mode TEXT,
      sort_mode TEXT,
      view_mode TEXT,
      date_sync TEXT
    );

  ''';

  static String get tasklist => '''
    CREATE TABLE tasklist (
      cod INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT
    );

  ''';

  static String get taskboard => '''
    CREATE TABLE taskboard (
      cod INTEGER PRIMARY KEY AUTOINCREMENT,
      FOREIGN KEY(cod_tasklist) REFERENCES tasklist(cod),
      name TEXT,
      date_created TEXT,
      enabled INTEGER DEFAULT 0
    );

  ''';

  static String get dateCompleted => '''
    CREATE TABLE date_completed (
        cod INTEGER PRIMARY KEY AUTOINCREMENT,
        FOREIGN KEY(cod_taskboard) REFERENCES taskboard(cod),
        date_completed TEXT
    );

  ''';

  static String get task => '''
    CREATE TABLE task (
      cod INTEGER PRIMARY KEY AUTOINCREMENT,
      FOREIGN KEY(cod_taskboard) REFERENCES taskboard(cod),
      description TEXT,
      date_created TEXT,
      date_completed TEXT,
      completed INTEGER DEFAULT 0
    );
  
  ''';
}
