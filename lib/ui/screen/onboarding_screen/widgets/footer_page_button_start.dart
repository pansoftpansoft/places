import 'package:flutter/material.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/onboarding_screen/model/onboarding_screen_model.dart';

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
        visible: buttonOnStartVisible,
        child: ElevatedButton(
          style: _buildButtonStyle(),
          onPressed: () {
            _onPressed(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                onStart,
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: ColorPalette.lmPrimaryColor,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ButtonStyle _buildButtonStyle() {
    return ButtonStyle(
      elevation: MaterialStateProperty.all(0),
      backgroundColor: MaterialStateProperty.all<Color>(
        ColorPalette.greenColor,
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadiusCard12),
          ),
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
