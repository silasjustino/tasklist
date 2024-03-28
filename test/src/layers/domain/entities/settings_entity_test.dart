import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tasklist/src/layers/domain/entities/settings_entity.dart';

void main() {
  SettingsEntity settings = SettingsEntity();

  test('settings entity not null', () {
    expect(settings, isNotNull);
  });

  test('settings entity has themeMode dark', () {
    expect(settings.themeMode, ThemeMode.dark);
  });

  test('settings entity has sortMode oldest', () {
    expect(settings.sortMode, SortMode.oldest);
  });

  test('settings entity has viewMode extended', () {
    expect(settings.viewMode, ViewMode.extended);
  });

  test('settings entity has dateSyncronized Não sincronizado', () {
    expect(settings.dateSyncronized, 'Não sincronizado');
  });
}
