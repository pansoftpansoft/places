import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/img.dart';

/// Экран затавка при загрузке приложения
class SplashScreen extends StatefulWidget {
  ///
  const SplashScreen({final Key? key}) : super(key: key);

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
    if (kDebugMode) {
      print('Старт программы');
    }
    _navigateToNextAsync();
    if (kDebugMode) {
      print('Стоп программы');
    }
  }

  /// Логика перехода на следующий экран
  Future<bool> _navigateToNextAsync() async {
    ///Запускаем получение данных из сети
    unawaited(getNetData());

    /// Запускаем анимацию в цикле
    /// Задаем максимальное количество анимаций 5, по 1 секунде
    /// если за 5 секунд данные не пришли то выдаем ошибку
    for (int i = 0; i < 5; i++) {
      if (_isInitialized.isCompleted) {
        if (kDebugMode) {
          await Navigator.pushReplacementNamed(
            context,
            '/OnboardingScreen',
          );
          print('Переход на следующий экран');

          return true;
        }
      } else {
        await startAnimation(i + 1);
      }
    }

    if (kDebugMode) {
      print('Истекло время получения данных ');
    }

    return false;
  }

  /// Получение данных из сети. Инициализация.
  Future<void> getNetData() async {
    if (kDebugMode) {
      print('Запустилась GetNetData().');
    }

    /// Имитируем инициализацию, продолжительностью 2 секунды.
    await Future.delayed(
      const Duration(seconds: 2),
      () {
        if (kDebugMode) {
          print('Ждем две секунды!');
        }
      },
    );
    if (kDebugMode) {
      print('Завершилась GetNetData().');
    }

    /// Завершение инициалзации
    finishGetNetData(isComplete: true);
  }

  /// Запуск анимации на заставке
  Future<void> startAnimation(final int numberCycle) async {
    if (kDebugMode) {
      print('Анимация запустилась $numberCycle раз.');
    }
    await Future.delayed(const Duration(seconds: 1), () {
      if (kDebugMode) {
        print('Ждем две секунды!');
      }
    });
  }

  /// Произошло завершение плучения дынных
  void finishGetNetData({required final bool isComplete}) =>
      _isInitialized.complete(isComplete);

  @override
  Widget build(final BuildContext context) => Container(
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
}
