import 'package:flutter/material.dart';
import 'package:places/data/interactor/onboarding_screen_interactor.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/route_name.dart';
import 'package:places/ui/screen/widgets/text_button_green_text.dart';
import 'package:provider/provider.dart';

///Заголовок шаблон страници Onboard
class HeaderPage extends StatelessWidget {
  const HeaderPage({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Consumer<OnboardingScreenInteractor>(
      builder: (
        final context,
        final cart,
        final child,
      ) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(height: 110),
            Visibility(
              visible: !OnboardingScreenInteractor.buttonOnVisible,
              child: TextButtonGreenText(
                title: skip,
                onPressed: () {
                  if (context
                      .read<OnboardingScreenInteractor>()
                      .callingFromSettings) {
                    Navigator.pop(context);
                  } else {
                    Navigator.pushReplacementNamed(
                      context,
                      RouteName.listPlacesScreen,
                    );
                  }
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
