import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/models/app_model.dart';
import 'package:places/ui/screen/onboarding_screen/widgets/footer_page_button_start.dart';

///Подвал шаблон страници Onboard
class FooterPage extends StatelessWidget {
  ///
  final bool buttonOnStartVisible;

  /// Номер страницы
  final int numberPage;

  ///
  const FooterPage({
    required this.buttonOnStartVisible,
    required this.numberPage,
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    String fileName = '';

    switch (numberPage) {
      case 1:
        fileName = AppModel.isThemeColor ? SvgIcons.white1 : SvgIcons.black1;
        break;
      case 2:
        fileName = AppModel.isThemeColor ? SvgIcons.white2 : SvgIcons.black2;
        break;
      case 3:
        fileName = AppModel.isThemeColor ? SvgIcons.white3 : SvgIcons.black3;
        break;
      default:
        fileName = SvgIcons.onboardProgress1;
    }
    debugPrint('$numberPage $fileName');
    return Expanded(
      child: Column(
        children: <Widget>[
          SvgPicture.asset(
            fileName,
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
}
