import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/onboarding_screen/widgets/footer_page_button_start.dart';

///Подвал шаблон страници Onboard
class FooterPage extends StatelessWidget {
  ///
  final bool buttonOnStartVisible;

  ///
  const FooterPage({
    required this.buttonOnStartVisible,
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) => Expanded(
        child: Column(
          children: <Widget>[
            SvgPicture.asset(
              SvgIcons.onboardProgress1,
              color: Colors.green,
            ),
            const SizedBox(height: heightSizeBox32),
            FooterPageButtonStart(
              buttonOnStartVisible: buttonOnStartVisible,
            ),
          ],
        ),
      );
}
