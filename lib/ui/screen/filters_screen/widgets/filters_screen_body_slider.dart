import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/screen/filters_screen/bloc/filter_bloc.dart';

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
            state.filterSet.rangeDistance.start,
            state.filterSet.rangeDistance.end,
          ),
          onChanged: (newRange) {
            //Без определения этого свойства, бегунки не активны
            _onChange(context, newRange);
          },
          onChangeEnd: (newRange) {
            _onChangeEnd(context, newRange);
          },
          labels: RangeLabels(
            state.filterSet.rangeDistance.start.round().toString(),
            state.filterSet.rangeDistance.end.round().toString(),
          ),
        ),
      ),
    );
  }

  void _onChange(BuildContext context, RangeValues newRange) {
    setState(() {
      debugPrint('newRange = ${newRange.end}');

      context.read<FilterBloc>().add(
            FilterEvents.updateFilterOnlyDistance(
              filterDistance: RangeValues(newRange.start, newRange.end),
            ),
          );
    });
  }

  void _onChangeEnd(BuildContext context, RangeValues newRange) {
    debugPrint('_onChangeEnd newRange = ${newRange.end}');

    context.read<FilterBloc>().add(
          FilterEvents.updateFilterDistance(
            filterDistance: RangeValues(newRange.start, newRange.end),
          ),
        );
  }
}
