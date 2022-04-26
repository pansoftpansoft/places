import 'package:flutter/material.dart';
import 'package:places/type_place.dart';

class OnboardingScreenModel extends ChangeNotifier {
  ///Показывать кнопку на старт или кнопку пропустить
  static bool buttonOnVisible = false;

  /// Номер страницы
  static double numberPage = 0;

  /// Вызов OnboardingScreen из мену Setting
  /// что бы вернутся в Setting
  static bool callingFromSettings = false;

  static PageController pageControllerOnboardingScreen = PageController();

  static String fileName = '';

  static void onPageChanged(
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
