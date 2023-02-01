import 'dart:async';

import 'package:flutter/material.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/img.dart';
import 'package:places/ui/res/route_name.dart';
import 'package:places/ui/screen/onboarding_screen/bloc/onboarding_bloc.dart';
import 'package:provider/provider.dart';

/// Экран затавка при загрузке приложения
class SplashScreen extends StatefulWidget {
  ///
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

///
class SplashScreenState extends State<SplashScreen> {
  /// Индикатор завершения загрузки
  final Completer<bool> _isInitialized = Completer<bool>();

  @override
  void initState() {
    super.initState();

    debugPrint('Старт программы');

    _navigateToNextAsync();

    debugPrint('Стоп программы');
  }

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              ColorPalette.gradientGreenDark,
              ColorPalette.gradientGreenLight,
            ],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 160,
              height: 160,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                loader,
                height: 120,
                width: 122,
              ),
            ),
          ],
        ),
      );

  /// Получение данных из сети. Инициализация.
  Future<void> getNetData() async {
    debugPrint('Запустилась GetNetData().');
    //await SearchScreenInteractor.getListHistory();
    //await FiltersScreenInteractor.getFilterSettings();
    //debugPrint('Завершилась GetNetData().');
  }

  /// Запуск анимации на заставке
  Future<void> startAnimation(int numberCycle) async {
    debugPrint('Анимация запустилась $numberCycle раз.');
    await Future.delayed(const Duration(seconds: 1), () {
      debugPrint('Ждем две секунды!');
    });
  }

  /// Произошло завершение плучения дынных
  void finishGetNetData({required final bool isComplete}) {
    //Произыодим первую фильтрацию мест перед открытием экрана
    _isInitialized.complete(isComplete);
    debugPrint('finishGetNetData ${_isInitialized.isCompleted.toString()}');
  }

  /// Логика перехода на следующий экран
  Future<bool> _navigateToNextAsync() async {
    //Запускаем получение данных из сети

    await getNetData().then(
      (value) => {
        debugPrint('value = 1'),
        // Завершение инициалзации
        finishGetNetData(isComplete: true),
        debugPrint('Переход на следующий экран ${RouteName.onboardingScreen}'),

        context.read<OnboardingBloc>().add(
              const OnboardingEvents.load(),
            ),

        Navigator.pushReplacementNamed(
          context,
          RouteName.onboardingScreen,
          arguments: {'callingFromSettings': false},
        ),
      },
    );

    /// Запускаем анимацию в цикле
    /// Задаем максимальное количество анимаций 5, по 1 секунде
    /// если за 5 секунд данные не пришли то выдаем ошибку
    for (var iCount = 0; iCount < 5; iCount++) {
      if (_isInitialized.isCompleted) {
        return true;
      } else {
        await startAnimation(iCount + 1);
      }
    }

    debugPrint('Истекло время получения данных ');

    return false;
  }
}
