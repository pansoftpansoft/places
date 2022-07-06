import 'package:flutter/material.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/onboarding_screen/model/'
    'onboarding_screen_model.dart';
import 'package:places/ui/screen/onboarding_screen/widgets/'
    'bottom_sheet_onboarding.dart';
import 'package:places/ui/screen/onboarding_screen/widgets/header_page.dart';
import 'package:places/ui/screen/onboarding_screen/widgets/page_view_widget.dart';
import 'package:provider/provider.dart';

///Экран Onboarding
class OnboardingScreen extends StatelessWidget {
  ///Конструктор Onboarding
  const OnboardingScreen({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    // Проверяем онбординг был вызван из Settings
    OnboardingScreenModel.callingFromSettings = (ModalRoute.of(context)
        ?.settings
        .arguments as Map)['callingFromSettings'] as bool;

    // Устанавливаем начальные значения
    OnboardingScreenModel.onPageChanged(0);

    // Подписываемся на pageControllerOnboardingScreen
    OnboardingScreenModel.pageControllerOnboardingScreen.addListener(() {
      if (OnboardingScreenModel.pageControllerOnboardingScreen.page!
              .roundToDouble() ==
          OnboardingScreenModel.pageControllerOnboardingScreen.page) {
        OnboardingScreenModel.onPageChanged(
          OnboardingScreenModel.pageControllerOnboardingScreen.page,
        );
        context.read<OnboardingScreenModel>().notify();
      }
    });

    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, heightBottomSheetOnboarding),
        child: HeaderPage(),
      ),
      bottomSheet: BottomSheetOnboarding(),
      body: SafeArea(
        child: PageViewWidget(),
      ),
    );
  }
}
