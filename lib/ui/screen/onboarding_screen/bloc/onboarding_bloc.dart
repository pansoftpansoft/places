import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:places/data/api/network_exception.dart';
import 'package:places/data/interactor/onboarding_screen_interactor.dart';
import 'package:places/domain/onboarding_page.dart';

part 'onboarding_bloc.freezed.dart';

class OnboardingBloc extends Bloc<OnboardingEvents, OnboardingState> {
  final OnboardingScreenInteractor _onboardingScreenInteractor;

  OnboardingBloc(
    final this._onboardingScreenInteractor,
  ) : super(
          const OnboardingState.load(),
        ) {
    debugPrint('ListPlacesBloc ');
    on<OnboardingEvents>(
      (event, emitter) => event.map<Future<void>>(
        load: (event) => _load(event, emitter),
        onPageChanged: (event) => _onPageChanged(event, emitter),
      ),
      transformer: bloc_concurrency.sequential(),
    );
  }

  Future<void> _load(
    _LoadOnboardingEvents event,
    Emitter<OnboardingState> emit,
  ) async {
    debugPrint('1 event = ${event.toString()}');
    debugPrint('1 emit = ${emit.toString()}');
    try {
      final listPage = _onboardingScreenInteractor.loadListOnboardingPage();
      debugPrint('!!!!! listPage = ${listPage.length}');
      emit(OnboardingState.showPage(
        listPage: listPage,
        currentPage: 0,
        callingFromSettings: event.callingFromSettings,
      ));
    } on NetworkException {
      // emit(const ListPlacesState.error(message: 'Ошибка загрузки из сети'));
    } on Object catch (error, stackTrace) {
      rethrow;
    } finally {
      debugPrint('2 event = ${event.toString()}');
      debugPrint('2 emitter = ${emit.toString()}');
    }
  }

  Future<void> _onPageChanged(
    _onPageChangedOnboardingEvents event,
    Emitter<OnboardingState> emitter,
  ) async {
    debugPrint('event = ${event.toString()}');
    debugPrint('emitter = ${emitter.toString()}');
    try {
      emit(OnboardingState.showPage(
        listPage: event.listPage,
        currentPage: event.currentPage,
        callingFromSettings: event.callingFromSettings,
      ));
    } on Object catch (error, stackTrace) {
      rethrow;
    }
  }
}

/// События
@freezed
class OnboardingEvents with _$OnboardingEvents {
  const OnboardingEvents._();

  const factory OnboardingEvents.load({
    @Default(false) final bool callingFromSettings,
  }) = _LoadOnboardingEvents;

  const factory OnboardingEvents.onPageChanged({
    @Default(<OnboardingPage>[]) final List<OnboardingPage> listPage,
    @Default(0) final int currentPage,
    @Default(false) final bool callingFromSettings,
  }) = _onPageChangedOnboardingEvents;
}

/// Состояния
@freezed
class OnboardingState with _$OnboardingState {
  bool get callingFromSettings => maybeWhen<bool>(
        orElse: () => false,
        load: (_) => false,
        showPage: (listPage, currentPage, callingFromSettings) =>
            callingFromSettings,
      );

  int get currentPage => maybeWhen<int>(
        orElse: () => 0,
        showPage: (
          listPage,
          currentPage,
          callingFromSettings,
        ) =>
            currentPage,
      );

  List<OnboardingPage> get listPage => maybeWhen<List<OnboardingPage>>(
        orElse: () => [],
        showPage: (
          listPage,
          currentPage,
          callingFromSettings,
        ) =>
            listPage,
      );

  const OnboardingState._();

  // Идет загрузка
  const factory OnboardingState.load({
    @Default(false) final bool callingFromSettings,
  }) = _LoadOnboardingState;

  // Список загружен
  const factory OnboardingState.showPage({
    @Default(<OnboardingPage>[]) final List<OnboardingPage> listPage,
    @Default(0) final int currentPage,
    @Default(false) final bool callingFromSettings,
  }) = _ShowOnboardingState;

  // Ошибка
  const factory OnboardingState.error({
    @Default(<OnboardingPage>[]) final List<OnboardingPage> listPage,
    @Default(0) final int currentPage,
  }) = _ErrorOnboardingState;
}
