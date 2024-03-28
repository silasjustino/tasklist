import 'package:flutter/material.dart';

enum SortMode { newest, oldest, byName }

enum ViewMode { compacted, extended }

class SettingsEntity {
  int? id;
  ThemeMode themeMode = ThemeMode.dark;
  SortMode sortMode = SortMode.oldest;
  ViewMode viewMode = ViewMode.extended;
  String dateSyncronized = 'Não sincronizado';

  SettingsEntity({
    this.id,
  });
}
