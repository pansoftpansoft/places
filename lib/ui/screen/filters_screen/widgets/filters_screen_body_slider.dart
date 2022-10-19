import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/data/interactor/filters_screen_interactor.dart';
import 'package:places/data/model/filter_distance.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/screen/filters_screen/bloc/filter_bloc.dart';
import 'package:provider/provider.dart';

class FiltersScreenBodySlider extends StatefulWidget {
  const FiltersScreenBodySlider({Key? key}) : super(key: key);

  @override
  State<FiltersScreenBodySlider> createState() =>
      _FiltersScreenBodySliderState();
}

class _FiltersScreenBodySliderState extends State<FiltersScreenBodySlider> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(
      builder: (context, state) => SliderTheme(
        data: const SliderThemeData(
          trackHeight: 1.8,
          activeTrackColor: ColorPalette.greenColor,
          inactiveTrackColor: ColorPalette.lmTabBarUnSelect,
          thumbColor: Colors.white,
          showValueIndicator: ShowValueIndicator.always,
        ),
        child: RangeSlider(
          min: 100,
          max: 10000,
          values: RangeValues(
            state.filterDistance!.distanceStart,
            state.filterDistance!.distanceEnd,
          ),
          onChanged: (newRange) {
            //Без определения этого свойства, бегунки не активны
            _onChange(context, newRange);
          },
          onChangeEnd: (newRange) {
            _onChangeEnd(context, newRange);
          },
          labels: RangeLabels(
            state.filterDistance!.distanceStart.round().toString(),
            state.filterDistance!.distanceEnd.round().toString(),
          ),
        ),
      ),
    );
  }

  void _onChange(BuildContext context, RangeValues newRange) {
    setState(() {
      debugPrint('newRange = ${newRange.end}');
      FiltersScreenInteractor.rangeDistance = newRange;
      context.read<FiltersScreenInteractor>().notifyListenersFiltersScreen();
    });
  }

  void _onChangeEnd(BuildContext context, RangeValues newRange) {
    debugPrint('_onChangeEnd newRange = ${newRange.end}');

    context.read<FilterBloc>().add(
          FilterEvents.updateFilterDistance(
            filterDistance: FilterDistance(0, newRange.start, newRange.end),
          ),
        );

    // context
    //     .read<FiltersScreenInteractor>()
    //     .getDataFromRepository()
    //     .then((value) =>
    //         context.read<FiltersScreenInteractor>().notifyListenersFiltersScreen());
  }
}
