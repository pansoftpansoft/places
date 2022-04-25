import 'package:flutter/material.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/onboarding_screen/model/'
    'onboarding_screen_model.dart';
import 'package:places/ui/screen/onboarding_screen/widgets/body_page.dart';
import 'package:places/ui/screen/onboarding_screen/widgets/'
    'bottom_sheet_onboarding.dart';
import 'package:places/ui/screen/onboarding_screen/widgets/header_page.dart';
import 'package:provider/provider.dart';

///Экран Onboarding
class OnboardingScreen extends StatelessWidget {
  ///Конструктор Onboarding
  const OnboardingScreen({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    OnboardingScreenModel.callingFromSettings = (ModalRoute.of(context)
        ?.settings
        .arguments as Map)['callingFromSettings'] as bool;

    OnboardingScreenModel.onPageChanged(0);

    final pageController = PageController();
    pageController.addListener(() {
      if (pageController.page == 0 ||
          pageController.page == 1 ||
          pageController.page! > 1.9) {
        OnboardingScreenModel.onPageChanged(pageController.page);
        context.read<OnboardingScreenModel>().notify();
      }
    });

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, heightBottomSheetOnboarding),
        child: HeaderPage(),
      ),

      bottomSheet: const BottomSheetOnboarding(),
      //resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: PageView(
          controller: pageController,
          children: const <Widget>[
            BodyPage(
              header1: welcomeToTheTravelGuide,
              header2: lookNewLocations,
              svgIcon: SvgIcons.tutorialFrame1,
            ),
            BodyPage(
              header1: buildRouteAndRoad,
              header2: reachGoalQuicklyComfortablyPossible,
              svgIcon: SvgIcons.tutorialFrame2,
            ),
            BodyPage(
              header1: addPlacesYouFoundYourself,
              header2: shareMostInterestingOnes,
              svgIcon: SvgIcons.tutorialFrame3,
            ),
          ],
        ),
      ),
    );
  }
}
