import 'package:flutter/material.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/route_name.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/widgets/elevated_button_green_big.dart';

class FooterPageButtonStart extends StatelessWidget {
  static const double heightFooterPage = 48;

  final bool buttonOnStartVisible;

  const FooterPageButtonStart({
    required this.buttonOnStartVisible,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.tightFor(
        height: heightFooterPage,
      ),
      margin: const EdgeInsets.symmetric(
        vertical: paddingPage_2,
        horizontal: paddingPage,
      ),
      child: Visibility(
        visible: buttonOnStartVisible,
        child: ElevatedButtonGreenBig(
          title: onStart,
          onPressed: () {
            _onPressed(context);
          },
        ),
      ),
    );
  }

  void _onPressed(BuildContext context) {
    debugPrint(
      'context.read<OnboardingBloc>().state.firstStart = '
      '${(ModalRoute.of(context)?.settings.arguments as Map)['callingFromSettings'] as bool}',
    );

    if ((ModalRoute.of(context)?.settings.arguments
        as Map)['callingFromSettings'] as bool) {
      Navigator.pop(context);
    } else {
      Navigator.pushReplacementNamed(
        context,
        RouteName.listPlacesScreen,
      );
    }
  }
}
