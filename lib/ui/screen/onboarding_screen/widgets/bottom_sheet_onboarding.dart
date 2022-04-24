import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/onboarding_screen/model/onboarding_screen_model.dart';
import 'package:places/ui/screen/onboarding_screen/widgets/footer_page_button_start.dart';
import 'package:provider/provider.dart';

///Подвал шаблон страници Onboard
class BottomSheetOnboarding extends StatelessWidget {
  const BottomSheetOnboarding({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    debugPrint('${OnboardingScreenModel.numberPage} '
        '${OnboardingScreenModel.fileName}');

    return Consumer<OnboardingScreenModel>(
      builder: (
        final context,
        final cart,
        final child,
      ) =>
          ConstrainedBox(
        constraints:
            const BoxConstraints.tightFor(height: 110, width: double.maxFinite),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            SvgPicture.asset(
              OnboardingScreenModel.fileName,
              color: Colors.green,
            ),
            const SizedBox(height: heightSizeBox12),
            FooterPageButtonStart(
              buttonOnStartVisible: OnboardingScreenModel.buttonOnVisible,
            ),
          ],
        ),
      ),
    );
  }
}
