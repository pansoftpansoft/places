import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/filters_screen/widgets/bottom_sheet_widget.dart';
import 'package:places/ui/screen/filters_screen/widgets/grid_icon.dart';
import 'package:places/ui/screen/filters_screen/widgets/title_filter.dart';
import 'package:places/ui/screen/sight_search_screen/models/search_filter_model.dart';
import 'package:provider/provider.dart';

///Экран фильтров
class FiltersScreen extends StatelessWidget {
  ///Конструктор
  const FiltersScreen({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    ///Запомним состояния фильтров
    context.read<SearchFilterModel>().getFilterSettings();

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const TitleFilter(),
      ),
      bottomSheet: const BottomSheetWidgetButtonShow(),
      body: SingleChildScrollView(
        child: Consumer<SearchFilterModel>(
          builder: (
            final BuildContext context,
            final SearchFilterModel cart,
            final Widget? child,
          ) =>
              Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: paddingPage,
                ),
                child: Row(
                  children: <Text>[
                    Text(
                      categories,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .copyWith(fontSize: 12),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const GridIcon(),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.all(paddingPage),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Text>[
                    const Text(distance),
                    Text(
                      '$from  '
                      '${SearchFilterModel.selectedRange.start.round().toString()}'
                      ' $to '
                      '${SearchFilterModel.selectedRange.end.round().toString()}'
                      '$meters',
                    ),
                  ],
                ),
              ),
              SliderTheme(
                data: const SliderThemeData(
                  trackHeight: 1.8,
                  activeTrackColor: ColorPalette.greenColor,
                  inactiveTrackColor: ColorPalette.lmTabBarUnSelect,
                  thumbColor: Colors.white,
                ),
                child: RangeSlider(
                  min: 100,
                  max: 10000,
                  values: SearchFilterModel.selectedRange,
                  onChanged: (final RangeValues newRange) {
                    //Без определения этого свойства, бегунки не активны
                    SearchFilterModel.selectedRange = newRange;
                    setFilter(context);
                  },
                  onChangeEnd: (final RangeValues newRange) {
                    SearchFilterModel.selectedRange = newRange;
                    setFilter(context);
                  },
                  labels: RangeLabels(
                    SearchFilterModel.selectedRange.start.round().toString(),
                    SearchFilterModel.selectedRange.end.round().toString(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///Установка выделения нажатой кнопки фильтра
  static void setButtonSelect(
    final BuildContext context,
    final TypePlace nameKey,
  ) {
    context.read<SearchFilterModel>().setTypePlaceSelected(nameKey);
    setFilter(context);
  }

  ///Установка фильтра
  static void setFilter(final BuildContext context) {
    context.read<SearchFilterModel>().countFilteredPlaces();
  }
}
