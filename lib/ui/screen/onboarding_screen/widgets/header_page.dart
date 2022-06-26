import 'package:flutter/material.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/route_name.dart';
import 'package:places/ui/screen/onboarding_screen/model/onboarding_screen_model.dart';
import 'package:places/ui/screen/widgets/text_button_green_text.dart';
import 'package:provider/provider.dart';

///Заголовок шаблон страници Onboard
class HeaderPage extends StatelessWidget {
  const HeaderPage({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Consumer<OnboardingScreenModel>(
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
              visible: !OnboardingScreenModel.buttonOnVisible,
              child: TextButtonGreenText(
                title: skip,
                onPressed: () {
                  if (OnboardingScreenModel.callingFromSettings) {
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
