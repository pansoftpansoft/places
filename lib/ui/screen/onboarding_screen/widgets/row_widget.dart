import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/data/interactor/onboarding_screen_interactor.dart';
import 'package:places/type_place.dart';
import 'package:places/ui/res/svg_icons.dart';

class RowWidget extends StatelessWidget {
  const RowWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        for (int indexOnboardingScreen = 0;
            indexOnboardingScreen < mocksOnboardingScreen.length;
            indexOnboardingScreen++)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: SvgPicture.asset(
              indexOnboardingScreen == OnboardingScreenInteractor.numberPage
                  ? SvgIcons.indicatorLine
                  : SvgIcons.indicatorPoint,
              color: Colors.green,
            ),
          ),
      ],
    );
  }
}
