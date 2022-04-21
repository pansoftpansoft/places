import 'package:flutter/material.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/onboarding_screen/model/onboarding_screen_model.dart';
import 'package:places/ui/screen/onboarding_screen/widgets/onboard_page.dart';

///Экран Onboarding
class OnboardingScreen extends StatelessWidget {
  ///Конструктор Onboarding
  const OnboardingScreen({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    OnboardingScreenModel.callingFromSettings = (ModalRoute.of(context)
        ?.settings
        .arguments as Map)['callingFromSettings'] as bool;
    debugPrint('OnboardingScreenModel.callingFromSettings'
        '  ${OnboardingScreenModel.callingFromSettings}');

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(paddingPage),
          child: PageView(
            children: const <Widget>[
              OnboardPage(
                header1: welcomeToTheTravelGuide,
                header2: lookNewLocations,
                svgIcon: SvgIcons.tutorialFrame1,
                numberPage: 1,
              ),
              OnboardPage(
                header1: buildRouteAndRoad,
                header2: reachGoalQuicklyComfortablyPossible,
                svgIcon: SvgIcons.tutorialFrame2,
                numberPage: 2,
              ),
              OnboardPage(
                buttonSkipVisible: false,
                header1: addPlacesYouFoundYourself,
                header2: shareMostInterestingOnes,
                svgIcon: SvgIcons.tutorialFrame3,
                numberPage: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
