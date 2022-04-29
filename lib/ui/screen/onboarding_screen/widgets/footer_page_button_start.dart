import 'package:flutter/material.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/onboarding_screen/model/onboarding_screen_model.dart';
import 'package:places/ui/screen/widgets/elevated_button_green_big.dart';

class FooterPageButtonStart extends StatelessWidget {
  static const double heightFooterPage = 48;

  final bool buttonOnStartVisible;

  const FooterPageButtonStart({
    required this.buttonOnStartVisible,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.tightFor(
        height: heightFooterPage,
      ),
      margin: const EdgeInsets.symmetric(
        vertical: paddingPage_2,
        horizontal: paddingPage,
      ),
      child: Visibility(
        visible: OnboardingScreenModel.buttonOnVisible,
        child:
        ElevatedButtonGreenBig(
          title: onStart,
          onPressed: () {
            _onPressed(context);
          },
        ),
      ),
    );
  }

  void _onPressed(BuildContext context) {
    if (OnboardingScreenModel.callingFromSettings) {
      Navigator.pop(context);
    } else {
      Navigator.pushReplacementNamed(
        context,
        '/SightListScreen',
      );
    }
  }
}
