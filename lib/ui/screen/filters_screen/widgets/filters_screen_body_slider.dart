import 'package:flutter/material.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/screen/filters_screen/model/filters_screen_model.dart';
import 'package:places/ui/screen/list_places_screen/models/list_places_screen_model.dart';
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
    return SliderTheme(
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
        values: FiltersScreenModel.rangeDistance,
        onChanged: (final newRange) {
          //Без определения этого свойства, бегунки не активны
          _onChange(context, newRange);
        },
        onChangeEnd: (final newRange) {
          _onChangeEnd(context, newRange);
        },
        labels: RangeLabels(
          FiltersScreenModel.rangeDistance.start.round().toString(),
          FiltersScreenModel.rangeDistance.end.round().toString(),
        ),
      ),
    );
  }

  void _onChange(BuildContext context, RangeValues newRange) {
    setState(() {
      debugPrint('newRange = ${newRange.end}');
      FiltersScreenModel.rangeDistance = newRange;
      context.read<FiltersScreenModel>().notifyListenersFiltersScreen();
    });
  }

  void _onChangeEnd(BuildContext context, RangeValues newRange) {
    debugPrint('_onChangeEnd newRange = ${newRange.end}');

    context
        .read<FiltersScreenModel>()
        .getDataFromRepository(
          context.read<ListPlacesScreenModel>().streamControllerListPlace,
        )
        .then((value) =>
            context.read<FiltersScreenModel>().notifyListenersFiltersScreen());
  }
}
