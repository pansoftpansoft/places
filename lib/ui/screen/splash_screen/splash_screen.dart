import 'dart:async';
import 'package:flutter/material.dart';
import 'package:places/data/interactor/place_interactor.dart';
import 'package:places/data/model/place.dart';
import 'package:places/type_place.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/img.dart';
import 'package:places/ui/res/route_name.dart';
import 'package:places/ui/screen/filters_screen/model/filters_screen_model.dart';
import 'package:places/ui/screen/sight_search_screen/models/search_screen_model.dart';
import 'package:provider/provider.dart';

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

    debugPrint('Старт программы');

    //DioDemoConnect().getPostDto();

    _navigateToNextAsync();

    debugPrint('Стоп программы');
  }

  @override
  Widget build(final BuildContext context) => DecoratedBox(
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

    mocksFiltered = await PlaceInteractor.getPlacesInteractor() as List<Place>;
    await PlaceInteractor.getListWantVisitAndVisited();


    for (final item in mocksFiltered){
      debugPrint('place id = ${item.id}  '
          'isFavorites  = ${item.isFavorites}  '
          'wantVisitDate  = ${item.wantVisitDate}  '
          'visitedDate  = ${item.visitedDate}  '
          'lat  = ${item.lat}  '
          'lon  = ${item.lon}  '
          'placeType  = ${item.placeType}');
    }

    debugPrint(
      'PlaceInteractor количество записей'
      ' ${mocksFiltered.length.toString()}',
    );

    debugPrint(
      'PlaceInteractor количество записей mocksWantVisit'
          ' ${mocksWantVisit.length.toString()}',
    );

    await SearchScreenModel.getListHistory();
    await FiltersScreenModel.getFilterSettings();
    debugPrint('Завершилась GetNetData().');
  }

  /// Запуск анимации на заставке
  Future<void> startAnimation(final int numberCycle) async {
    debugPrint('Анимация запустилась $numberCycle раз.');
    await Future.delayed(const Duration(seconds: 1), () {
      debugPrint('Ждем две секунды!');
    });
  }

  /// Произошло завершение плучения дынных
  void finishGetNetData({required final bool isComplete}) {
    //Произыодим первую фильтрацию мест перед открытием экрана
    debugPrint('value = 2');
    _isInitialized.complete(isComplete);
    debugPrint('finishGetNetData ${_isInitialized.isCompleted.toString()}');
    context.read<FiltersScreenModel>().getDataFromRepository();
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
