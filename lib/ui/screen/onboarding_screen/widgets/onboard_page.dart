import 'package:flutter/material.dart';
import 'package:places/ui/screen/onboarding_screen/widgets/body_page.dart';
import 'package:places/ui/screen/onboarding_screen/widgets/footer_page.dart';
import 'package:places/ui/screen/onboarding_screen/widgets/header_page.dart';

///Шаблон страници Onboard
class OnboardPage extends StatelessWidget {
  ///
  final bool buttonSkipVisible;
  ///
  final String header1;
  ///
  final String header2;
  ///
  final String svgIcon;

  ///Конструкор шаблон страници Onboard
  const OnboardPage({
    required this.header1,
    required this.header2,
    required this.svgIcon,
    this.buttonSkipVisible = true,
    final Key? key,
  }) : super(key: key);


  @override
  Widget build(final BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              HeaderPage(buttonSkipVisible: buttonSkipVisible),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BodyPage(
                header1: header1,
                header2: header2,
                svgIcon: svgIcon,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FooterPage(buttonOnStartVisible: !buttonSkipVisible),
            ],
          ),
        ],
      );
}
