import 'package:flutter/material.dart';
import 'package:places/domain/onboarding_page.dart';
import 'package:places/type_place.dart';

class OnboardingScreenInteractor extends ChangeNotifier {

  List<OnboardingPage> loadListOnboardingPage(){
    return mocksOnboardingScreen;
  }

}
