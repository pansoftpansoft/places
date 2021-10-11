import 'package:flutter/material.dart';
import 'package:places/ui/screen/onboarding_screen/widgets/body_page.dart';
import 'package:places/ui/screen/onboarding_screen/widgets/header_page.dart';
import 'package:places/ui/screen/onboarding_screen/widgets/footer_page.dart';

///Шаблон страници Onboard
class OnboardPage extends StatelessWidget {
  ///Конструкор шаблон страници Onboard
  const OnboardPage({
    this.buttonSkipVisible = true,
    required this.heder1,
    required this.heder2,
    required this.svgIcon,
    final Key? key,
  }) : super(key: key);

  final bool buttonSkipVisible;
  final String heder1;
  final String heder2;
  final String svgIcon;

  @override
  Widget build(final BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              HeaderPage(buttonSkipVisble: buttonSkipVisible),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BodyPage(
                heder1: heder1,
                heder2: heder2,
                svgIcon: svgIcon,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FooterPage(buttonOnStartVisble: !buttonSkipVisible),
            ],
          ),
        ],
      );
}
