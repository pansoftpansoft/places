import 'package:flutter/material.dart';
import 'package:places/data/interactor/onboarding_screen_interactor.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/onboarding_screen/widgets/footer_page_button_start.dart';
import 'package:places/ui/screen/onboarding_screen/widgets/row_widget.dart';
import 'package:provider/provider.dart';

///Подвал шаблон страници Onboard
class BottomSheetOnboarding extends StatelessWidget {
  const BottomSheetOnboarding({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint(
      '${OnboardingScreenInteractor.numberPage} '
      '${context.read<OnboardingScreenInteractor>().fileName}',
    );

    return Consumer<OnboardingScreenInteractor>(
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
              buttonOnStartVisible: OnboardingScreenInteractor.buttonOnVisible,
            ),
          ],
        ),
      ),
    );
  }
}
