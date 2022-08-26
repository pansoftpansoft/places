import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/onboarding_screen/bloc/onboarding_bloc.dart';
import 'package:places/ui/screen/onboarding_screen/widgets/footer_page_button_start.dart';
import 'package:places/ui/screen/onboarding_screen/widgets/row_widget.dart';

///Подвал шаблон страници Onboard
class BottomSheetOnboarding extends StatelessWidget {
  const BottomSheetOnboarding({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (context, state) => ConstrainedBox(
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
              buttonOnStartVisible:
                  state.currentPage == state.listPage.length-1,
            ),
          ],
        ),
      ),
    );
  }
}
