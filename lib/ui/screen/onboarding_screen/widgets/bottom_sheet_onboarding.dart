import 'package:flutter/material.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/onboarding_screen/model/onboarding_screen_model.dart';
import 'package:places/ui/screen/onboarding_screen/widgets/footer_page_button_start.dart';
import 'package:places/ui/screen/onboarding_screen/widgets/row_widget.dart';
import 'package:provider/provider.dart';

///Подвал шаблон страници Onboard
class BottomSheetOnboarding extends StatelessWidget {
  const BottomSheetOnboarding({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    debugPrint(
      '${OnboardingScreenModel.numberPage} ${OnboardingScreenModel.fileName}',
    );

    return Consumer<OnboardingScreenModel>(
      builder: (
        final context,
        final cart,
        final child,
      ) =>
          ConstrainedBox(
        constraints: const BoxConstraints.tightFor(
          height: heightBottomSheetOnboarding,
          width: double.maxFinite,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            const RowWidget(),
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
