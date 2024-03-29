import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:places/data/interactor/settings_interactor.dart';

import '../../../res/themes.dart';

part 'settings_bloc.freezed.dart';

class SettingsBloc extends Bloc<SettingsEvents, SettingsState> {
  final SettingsInteractor _settingsInteractor;

  SettingsBloc(
    final this._settingsInteractor,
  ) : super(
          const SettingsState.loadSettings(
            themeData: false,
            firstStart: false,
          ),
        ) {
    debugPrint('ListPlacesBloc ');
    on<SettingsEvents>(
      (event, emitter) => event.map<Future<void>>(
        updateSettings: (event) => _updateSettings(event, emitter),
        loadSettings: (event) => _loadSettings(event, emitter),
      ),
      transformer: bloc_concurrency.sequential(),
    );
  }

  Future<void> _updateSettings(
    _UpdateSettingsEvents event,
    Emitter<SettingsState> emit,
  ) async {
    debugPrint('event = ${event.toString()}');
    debugPrint('emitter = ${emit.toString()}');
    try {

      if (event.themeData) {
        await _settingsInteractor.updateSettingsThemeColor(darkTheme);
      } else {
        await _settingsInteractor.updateSettingsThemeColor(lightTheme);
      }

      await _settingsInteractor.updateShowOnboarding();

      emit(SettingsState.newSettings(
        themeData: event.themeData,
        firstStart: event.firstStart,
      ));
    } on Object {
      rethrow;
    }
  }

  Future<void> _loadSettings(
    _LoadSettingsEvents event,
    Emitter<SettingsState> emit,
  ) async {
    debugPrint('event = ${event.toString()}');
    debugPrint('emitter = ${emit.toString()}');
    try {
      final saveTheme = await _settingsInteractor.getSettingsThemeColor();
      final showOnboarding = await _settingsInteractor.getShowOnboarding();
      if (saveTheme == lightTheme) {
        emit(SettingsState.newSettings(
          themeData: false,
          firstStart: showOnboarding,
        ));
      } else {
        emit(SettingsState.newSettings(
          themeData: true,
          firstStart: showOnboarding,
        ));
      }
    } on Object {
      rethrow;
    }
  }
}

/// События
@freezed
class SettingsEvents with _$SettingsEvents {
  const SettingsEvents._();

  const factory SettingsEvents.loadSettings() = _LoadSettingsEvents;

  const factory SettingsEvents.updateSettings({
    required bool themeData,
    required bool firstStart,
  }) = _UpdateSettingsEvents;
}

/// Состояния
@freezed
class SettingsState with _$SettingsState {
  ThemeData get theme => maybeWhen<ThemeData>(
        orElse: () => lightTheme,
        loadSettings: (themeData, firstStart) =>
            themeData ? darkTheme : lightTheme,
        newSettings: (themeData, firstStart) =>
            themeData ? darkTheme : lightTheme,
      );

  const SettingsState._();

  const factory SettingsState.loadSettings({
    required bool themeData,
    required bool firstStart,
  }) = _LoadSettings;

  const factory SettingsState.newSettings({
    required bool themeData,
    required bool firstStart,
  }) = _NewSettings;
}
