import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/route_name.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/filters_screen/bloc/filter_bloc.dart';
import 'package:places/ui/screen/filters_screen/bloc/filter_state_enum.dart';
import 'package:places/ui/screen/filters_screen/widgets/filters_screen_body_slider.dart';
import 'package:places/ui/screen/filters_screen/widgets/filters_screen_body_slider_header.dart';
import 'package:places/ui/screen/filters_screen/widgets/filters_screen_body_text_categories.dart';
import 'package:places/ui/screen/filters_screen/widgets/grid_icon.dart';
import 'package:places/ui/screen/search_places_screen/widgets/empty_screen.dart';
import 'package:places/ui/screen/search_places_screen/widgets/load_screen.dart';

class FiltersScreenBody extends StatelessWidget {
  const FiltersScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<FilterBloc>().add(
          const FilterEvents.load(),
        );

    return MultiBlocListener(
      listeners: [
        BlocListener<FilterBloc, FilterState>(
          listenWhen: (previousState, state) =>
              state.current == FilterStateEnum.showResult,
          listener: (context, state) async {
            await Navigator.pushReplacementNamed(
              context,
              RouteName.listPlacesScreen,
            );

            return;
          },
        ),
      ],
      child: BlocBuilder<FilterBloc, FilterState>(
        builder: (context, state) {
          switch (state.current) {
            case FilterStateEnum.load:
              return const LoadScreen();

            case FilterStateEnum.loaded:
              return SingleChildScrollView(
                child: BlocBuilder<FilterBloc, FilterState>(
                  builder: (context, state) => Column(
                    children: const <Widget>[
                      FiltersScreenBodyTextCategories(),
                      SizedBox(height: 24),
                      GridIcon(),
                      SizedBox(height: 50),
                      FiltersScreenBodySliderHeader(),
                      FiltersScreenBodySlider(),
                    ],
                  ),
                ),
              );
            default:
              debugPrint(
                'Почемуто попадаем сюда default  = ${state.current}',
              );
              return const EmptyScreen(
                textHeader: unknownError,
                textComment: tryAgain,
                svgIcon: SvgIcons.delete,
              );
          }
        },
      ),
    );
  }
}
