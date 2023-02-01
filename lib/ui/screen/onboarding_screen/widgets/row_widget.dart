import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/onboarding_screen/bloc/onboarding_bloc.dart';

class RowWidget extends StatelessWidget {
  const RowWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingBloc, OnboardingState>(
        builder: (context, state) {
          debugPrint('state.listPage.length = ${state.listPage.length}');
          debugPrint('state.currentPage = ${state.currentPage}');

          return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            for (int indexOnboardingScreen = 0;
                indexOnboardingScreen < state.listPage.length;
                indexOnboardingScreen++)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: SvgPicture.asset(
                  indexOnboardingScreen == state.currentPage
                      ? SvgIcons.indicatorLine
                      : SvgIcons.indicatorPoint,
                  color: Colors.green,
                ),
              ),
          ],
        );
      },
    );
  }
}
