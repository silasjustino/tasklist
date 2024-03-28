import 'package:flutter/material.dart';
import 'package:tasklist/src/layers/domain/entities/settings_entity.dart';

class SettingsDto extends SettingsEntity {
  String theme;
  String sort;
  String view;
  String date;

  SettingsDto({
    int? cod,
    required this.theme,
    required this.sort,
    required this.view,
    required this.date,
  }) : super(id: cod) {
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

  factory SettingsDto.fromMap(Map map) {
    return SettingsDto(
      cod: map['cod'],
      theme: map['theme_mode'],
      sort: map['sort_mode'],
      view: map['view_mode'],
      date: map['date_sync'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cod': id,
      'theme_mode': theme,
      'sort_mode': sort,
      'view_mode': view,
      'date_sync': date,
    };
  }

  factory SettingsDto.fromEntity(SettingsEntity settings) {
    return SettingsDto(
      cod: settings.id,
      theme: settings.themeMode.name,
      sort: settings.sortMode.name,
      view: settings.viewMode.name,
      date: settings.dateSyncronized,
    );
  }
}
