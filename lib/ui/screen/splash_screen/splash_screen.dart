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
class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  /// Индикатор завершения загрузки
  final Completer<bool> _isInitialized = Completer<bool>();

  late AnimationController _animationController;
  late Animation<double> _rotateTurns;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _rotateTurns = Tween<double>(
      begin: 0,
      end: -1,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _animationController.repeat();

    super.initState();

    debugPrint('Старт программы');

    _navigateToNextAsync();

    debugPrint('Стоп программы');
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
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
            RotationTransition(
              turns: _rotateTurns,
              child: Container(
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
      (value) async => {
        debugPrint('value = 1'),
        await Future<dynamic>.delayed(
          const Duration(
            seconds: 5,
          ),
        ),
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

    return false;
  }
}
