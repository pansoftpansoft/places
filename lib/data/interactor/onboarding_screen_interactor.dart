import 'package:flutter/material.dart';
import 'package:places/type_place.dart';

class OnboardingScreenInteractor extends ChangeNotifier {
  ///Показывать кнопку на старт или кнопку пропустить
  static bool buttonOnVisible = false;

  /// Номер страницы
  static double numberPage = 0;

  /// Вызов OnboardingScreen из мену Setting
  /// что бы вернутся в Setting
  bool callingFromSettings = false;

  PageController pageControllerOnboardingScreen = PageController();

  String fileName = '';

  void onPageChanged(
    double? page,
  ) {
    numberPage = page!;
    buttonOnVisible =
        // ignore: avoid_bool_literals_in_conditional_expressions
    (mocksOnboardingScreen.length - 1) == numberPage ? true : false;
  }

  void notify() {
    debugPrint('Пришло обновление');
    notifyListeners();
  }
}
