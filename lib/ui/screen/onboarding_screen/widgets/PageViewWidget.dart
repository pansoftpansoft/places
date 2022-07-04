import 'package:flutter/material.dart';
import 'package:places/domain/onboarding_page.dart';
import 'package:places/type_place.dart';
import 'package:places/ui/screen/onboarding_screen/model/onboarding_screen_model.dart';
import 'package:places/ui/screen/onboarding_screen/widgets/body_page.dart';

class PageViewWidget extends StatelessWidget {
  const PageViewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: OnboardingScreenModel.pageControllerOnboardingScreen,
      children: [
        for (OnboardingPage page in mocksOnboardingScreen)
          BodyPage(
            header1: page.header1,
            header2: page.header2,
            svgIcon: page.svgIcon,
          ),
      ],
    );
  }
}
