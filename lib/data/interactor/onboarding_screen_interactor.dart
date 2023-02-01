import 'package:flutter/material.dart';
import 'package:places/domain/onboarding_page.dart';
import 'package:places/type_place.dart';

class OnboardingScreenInteractor extends ChangeNotifier {
  // ///Показывать кнопку на старт или кнопку пропустить
  // static bool buttonOnVisible = false;
  //
  // /// Номер страницы
  // static double numberPage = 0;
  //
  // /// Вызов OnboardingScreen из мену Setting
  // /// что бы вернутся в Setting
  // bool callingFromSettings = false;
  //
  // PageController pageControllerOnboardingScreen = PageController();
  //
  // String fileName = '';


  List<OnboardingPage> loadListOnboardingPage(){
    return mocksOnboardingScreen;
  }

}
