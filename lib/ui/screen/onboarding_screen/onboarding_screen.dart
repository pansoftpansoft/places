import 'package:flutter/material.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/onboarding_screen/widgets/'
    'bottom_sheet_onboarding.dart';
import 'package:places/ui/screen/onboarding_screen/widgets/header_page.dart';
import 'package:places/ui/screen/onboarding_screen/widgets/page_view_widget.dart';

///Экран Onboarding
class OnboardingScreen extends StatelessWidget {
  ///Конструктор Onboarding
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
