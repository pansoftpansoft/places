import 'package:flutter/material.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/screen/filters_screen/model/filters_screen_model.dart';


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
        values: FiltersScreenModel.selectedRange,
        onChanged: (final newRange) {
          //Без определения этого свойства, бегунки не активны
          _onChange(context, newRange);
        },
        labels: RangeLabels(
          FiltersScreenModel.selectedRange.start.round().toString(),
          FiltersScreenModel.selectedRange.end.round().toString(),
        ),
      ),
    );
  }

  void _onChange(BuildContext context, RangeValues newRange) {
    setState(() {
      FiltersScreenModel.selectedRange = newRange;
    });
  }
}
