import 'package:flutter/material.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/route_name.dart';
import 'package:places/ui/screen/onboarding_screen/model/onboarding_screen_model.dart';
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
            child: TextButton(
              onPressed: () {
                if (OnboardingScreenModel.callingFromSettings) {
                  Navigator.pop(context);
                } else {
                  Navigator.pushReplacementNamed(
                    context,
                    RouteName.sightListScreen,
                  );
                }
              },
              child: Text(
                skip,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      fontSize: 16,
                      color: ColorPalette.greenColor,
                    ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
