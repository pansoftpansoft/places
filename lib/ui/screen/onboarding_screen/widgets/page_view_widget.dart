import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/domain/onboarding_page.dart';
import 'package:places/type_place.dart';
import 'package:places/ui/screen/onboarding_screen/bloc/onboarding_bloc.dart';
import 'package:places/ui/screen/onboarding_screen/widgets/body_page.dart';

class PageViewWidget extends StatelessWidget {
  const PageViewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (context, state) {
        return PageView(
          onPageChanged: (value) {
            context.read<OnboardingBloc>().add(
                  OnboardingEvents.onPageChanged(
                    listPage: state.listPage,
                    currentPage: value,
                  ),
                );
          },
          children: [
            for (OnboardingPage page in mocksOnboardingScreen)
              BodyPage(
                header1: page.header1,
                header2: page.header2,
                svgIcon: page.svgIcon,
              ),
          ],
        );
      },
    );
  }
}
