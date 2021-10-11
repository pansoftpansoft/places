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
  Widget build(final BuildContext context) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(Sizes.paddingPage),
          child: PageView(
            children: const <Widget>[
              OnboardPage(
                heder1: Labels.welcomeToTheTravelGuide,
                heder2: Labels.lookNewLocations,
                svgIcon: SvgIcons.tutorialFrame1,
              ),
              OnboardPage(
                heder1: Labels.buildRouteAndRoad,
                heder2: Labels.reachGoalQuicklyComfortablyPossible,
                svgIcon: SvgIcons.tutorialFrame2,
              ),
              OnboardPage(
                buttonSkipVisible: false,
                heder1: Labels.addPlacesYouFoundYourself,
                heder2: Labels.shareMostInterestingOnes,
                svgIcon: SvgIcons.tutorialFrame3,
              ),
            ],
          ),
        ),
      );
}
