import 'package:flutter/material.dart';
import 'package:tasklist/layers/domain/entities/settings_entity.dart';

class SettingsDto extends SettingsEntity {
  int cod;
  String theme;
  String sort;
  String view;
  String date;

  SettingsDto({
    required this.cod,
    required this.theme,
    required this.sort,
    required this.view,
    required this.date,
  }) : super(id: cod) {
    dateSyncronized = date;

    if (theme == ThemeMode.light.name) {
      themeMode = ThemeMode.light;
    } else if (theme == ThemeMode.dark.name) {
      themeMode = ThemeMode.dark;
    } else {
      themeMode = ThemeMode.system;
    }

    if (sort == SortMode.newest.name) {
      sortMode = SortMode.newest;
    } else if (sort == SortMode.oldest.name) {
      sortMode = SortMode.oldest;
    } else {
      sortMode = SortMode.byName;
    }

    if (view == ViewMode.extended.name) {
      viewMode = ViewMode.extended;
    } else {
      viewMode = ViewMode.compacted;
    }
  }

  SettingsDto fromMap(Map map) {
    return SettingsDto(
        cod: map['cod'],
        theme: map['theme_mode'],
        sort: map['sort_mode'],
        view: map['view_mode'],
        date: map['date_sync']);
  }

  Map toMap() {
    return {
      'cod': cod,
      'theme_mode': theme,
      'sort_mode': sort,
      'view_mode': view,
      'date_sync': date,
    };
  }
}
