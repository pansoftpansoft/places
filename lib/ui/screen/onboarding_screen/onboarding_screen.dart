import 'package:flutter/material.dart';
import 'package:places/data/interactor/onboarding_screen_interactor.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/onboarding_screen/widgets/'
    'bottom_sheet_onboarding.dart';
import 'package:places/ui/screen/onboarding_screen/widgets/header_page.dart';
import 'package:places/ui/screen/onboarding_screen/widgets/page_view_widget.dart';
import 'package:provider/provider.dart';

///Экран Onboarding
class OnboardingScreen extends StatelessWidget {
  ///Конструктор Onboarding
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Проверяем онбординг был вызван из Settings
    context.read<OnboardingScreenInteractor>().callingFromSettings = (ModalRoute.of(context)
        ?.settings
        .arguments as Map)['callingFromSettings'] as bool;

    // Устанавливаем начальные значения
    context.read<OnboardingScreenInteractor>().onPageChanged(0);

    // Подписываемся на pageControllerOnboardingScreen
    context.read<OnboardingScreenInteractor>().pageControllerOnboardingScreen.addListener(() {
      if (context.read<OnboardingScreenInteractor>().pageControllerOnboardingScreen.page!
              .roundToDouble() ==
          context.read<OnboardingScreenInteractor>().pageControllerOnboardingScreen.page) {
        context.read<OnboardingScreenInteractor>().onPageChanged(
          context.read<OnboardingScreenInteractor>().pageControllerOnboardingScreen.page,
        );
        context.read<OnboardingScreenInteractor>().notify();
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
