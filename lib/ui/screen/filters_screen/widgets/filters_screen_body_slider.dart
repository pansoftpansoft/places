import 'package:flutter/material.dart';
import 'package:places/data/interactor/filters_screen_interactor.dart';
import 'package:places/data/interactor/list_places_screen_interactor.dart';
import 'package:places/ui/res/color_palette.dart';
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
        values: FiltersScreenInteractor.rangeDistance,
        onChanged: (final newRange) {
          //Без определения этого свойства, бегунки не активны
          _onChange(context, newRange);
        },
        onChangeEnd: (final newRange) {
          _onChangeEnd(context, newRange);
        },
        labels: RangeLabels(
          FiltersScreenInteractor.rangeDistance.start.round().toString(),
          FiltersScreenInteractor.rangeDistance.end.round().toString(),
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

    context
        .read<FiltersScreenInteractor>()
        .getDataFromRepository(
          context.read<ListPlacesScreenInteractor>().streamControllerListPlace,
        )
        .then((value) =>
            context.read<FiltersScreenInteractor>().notifyListenersFiltersScreen());
  }
}
