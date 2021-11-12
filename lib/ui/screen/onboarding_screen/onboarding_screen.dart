import 'package:flutter/material.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/onboarding_screen/widgets/onboard_page.dart';

///Экран Onboarding
class OnboardingScreen extends StatelessWidget {
  ///Конструктор Onboarding
  const OnboardingScreen({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) => SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(paddingPage),
            child: PageView(
              children: const <Widget>[
                OnboardPage(
                  header1: welcomeToTheTravelGuide,
                  header2: lookNewLocations,
                  svgIcon: SvgIcons.tutorialFrame1,
                ),
                OnboardPage(
                  header1: buildRouteAndRoad,
                  header2: reachGoalQuicklyComfortablyPossible,
                  svgIcon: SvgIcons.tutorialFrame2,
                ),
                OnboardPage(
                  buttonSkipVisible: false,
                  header1: addPlacesYouFoundYourself,
                  header2: shareMostInterestingOnes,
                  svgIcon: SvgIcons.tutorialFrame3,
                ),
              ],
            ),
          ),
        ),
      );
}
