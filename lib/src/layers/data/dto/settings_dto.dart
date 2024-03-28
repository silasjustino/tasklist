import 'package:flutter/material.dart';
import 'package:tasklist/src/layers/domain/entities/settings_entity.dart';

class SettingsDto extends SettingsEntity {
  int? cod;
  String theme;
  String sort;
  String view;
  String date;

  SettingsDto(
    this.cod,
    this.theme,
    this.sort,
    this.view,
    this.date,
  ) : super(id: cod) {
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
      map['cod'],
      map['theme_mode'],
      map['sort_mode'],
      map['view_mode'],
      map['date_sync'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cod': cod,
      'theme_mode': theme,
      'sort_mode': sort,
      'view_mode': view,
      'date_sync': date,
    };
  }

  factory SettingsDto.fromEntity(SettingsEntity settings) {
    return SettingsDto(
      settings.id,
      settings.themeMode.name,
      settings.sortMode.name,
      settings.viewMode.name,
      settings.dateSyncronized,
    );
  }
}
