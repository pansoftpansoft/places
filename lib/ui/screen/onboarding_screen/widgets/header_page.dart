import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/route_name.dart';
import 'package:places/ui/screen/filters_screen/bloc/filter_bloc.dart';
import 'package:places/ui/screen/list_places_screen/bloc/list_places_bloc.dart';
import 'package:places/ui/screen/onboarding_screen/bloc/onboarding_bloc.dart';
import 'package:places/ui/screen/widgets/text_button_green_text.dart';

///Заголовок шаблон страници Onboard
class HeaderPage extends StatelessWidget {
  const HeaderPage({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(height: 110),
            Visibility(
              visible: state.currentPage != state.listPage.length - 1,
              child: TextButtonGreenText(
                title: skip,
                onPressed: () {
                  if ((ModalRoute.of(context)?.settings.arguments
                      as Map)['callingFromSettings'] as bool) {
                    Navigator.pop(context);
                  } else {
                    context.read<ListPlacesBloc>().add(
                          ListPlacesEvents.load(
                            filterSet:
                                context.read<FilterBloc>().state.filterSet,
                          ),
                        );
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
