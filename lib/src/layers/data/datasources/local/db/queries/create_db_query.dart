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
      cod_tasklist INTEGER,
      name TEXT,
      date_created TEXT,
      enabled INTEGER DEFAULT 0,
      FOREIGN KEY(cod_tasklist) REFERENCES tasklist(cod)
    );

  ''';

  static String get dateCompleted => '''
    CREATE TABLE date_completed (
        cod INTEGER PRIMARY KEY AUTOINCREMENT,
        cod_taskboard INTEGER,
        date_completed TEXT,
        FOREIGN KEY(cod_taskboard) REFERENCES taskboard(cod)
    );

  ''';

  static String get task => '''
    CREATE TABLE task (
      cod INTEGER PRIMARY KEY AUTOINCREMENT,
      cod_taskboard INTEGER,
      description TEXT,
      date_created TEXT,
      date_completed TEXT,
      completed INTEGER DEFAULT 0,
      FOREIGN KEY(cod_taskboard) REFERENCES taskboard(cod)
    );
  
  ''';
}
