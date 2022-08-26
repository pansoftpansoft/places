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
          const SettingsState.loadSettings(themeData: false),
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
        await _settingsInteractor.updateSettingsThemeColor(lightTheme);
      }

      if (event.themeData) {
        await _settingsInteractor.updateSettingsThemeColor(darkTheme);
      }

      emit(SettingsState.newSettings(themeData: event.themeData));
    } on Object catch (error, stackTrace) {
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
      final saveTheme = await _settingsInteractor.getSettingsTheme('themes');
      if (saveTheme == lightTheme) {
        emit(const SettingsState.newSettings(themeData: false));
      } else {
        emit(const SettingsState.newSettings(themeData: true));
      }
    } on Object catch (error, stackTrace) {
      rethrow;
    }
  }
}

/// События
@freezed
class SettingsEvents with _$SettingsEvents {
  const SettingsEvents._();

  const factory SettingsEvents.loadSettings() = _LoadSettingsEvents;

  const factory SettingsEvents.updateSettings({required bool themeData}) =
      _UpdateSettingsEvents;
}

/// Состояния
@freezed
class SettingsState with _$SettingsState {
  ThemeData get theme => maybeWhen<ThemeData>(
        orElse: () => lightTheme,
        loadSettings: (themeData) => themeData ? darkTheme : lightTheme,
        newSettings: (themeData) => themeData ? darkTheme : lightTheme,
      );

  const SettingsState._();

  const factory SettingsState.loadSettings({required bool themeData}) =
      _LoadSettings;

  const factory SettingsState.newSettings({required bool themeData}) =
      _NewSettings;
}
