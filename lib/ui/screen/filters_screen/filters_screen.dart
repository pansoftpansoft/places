import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/sight_search_screen/models/search_filter_model.dart';
import 'package:provider/provider.dart';

///Экран фильтров
class FiltersScreen extends StatelessWidget {
  ///Конструктор
  const FiltersScreen({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    //Запомним состояния фильтров
    context.read<SearchFilterModel>().getFilterSettings();
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: _title(context),
      ),
      bottomSheet: _bottomSheetWidget(context),
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
                  horizontal: Sizes.paddingPage,
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
              GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                children: <Widget>[
                  _categoryIcon(
                    context,
                    'Отель',
                    TypePlace.hotel,
                    SvgIcons.hotel,
                  ),
                  _categoryIcon(
                    context,
                    'Ресторан',
                    TypePlace.restaurant,
                    SvgIcons.restaurant,
                  ),
                  _categoryIcon(
                    context,
                    'Особое место',
                    TypePlace.particularPlace,
                    SvgIcons.particularPlace,
                  ),
                  _categoryIcon(
                    context,
                    'Парк',
                    TypePlace.park,
                    SvgIcons.park,
                  ),
                  _categoryIcon(
                    context,
                    'Музей',
                    TypePlace.museum,
                    SvgIcons.museum,
                  ),
                  _categoryIcon(
                    context,
                    'Кафе',
                    TypePlace.cafe,
                    SvgIcons.cafe,
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.all(Sizes.paddingPage),
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
                    )
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
                    _setFilter(context);
                  },
                  onChangeEnd: (final RangeValues newRange) {
                    SearchFilterModel.selectedRange = newRange;
                    _setFilter(context);
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

  Row _title(final BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          TextButton(
            onPressed: () {
              _clearFilterValue(context);
            },
            child: const Text(
              clear,
              style: TextStyle(
                fontSize: 16,
                color: ColorPalette.greenColor,
              ),
            ),
          ),
        ],
      );

  void _clearFilterValue(final BuildContext context) {
    for (final MapEntry<TypePlace, bool> item
        in SearchFilterModel.filterMap.entries) {
      SearchFilterModel.filterMap[item.key] = false;
    }
    _setFilter(context);
  }

  //Кнопка "показать"
  Widget _bottomSheetWidget(final BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.paddingPage,
          vertical: Sizes.paddingPage / 2,
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints.tightFor(height: 48),
          child: ElevatedButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.zero),
              elevation: MaterialStateProperty.all(0),
              backgroundColor:
                  MaterialStateProperty.all<Color>(ColorPalette.greenColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Sizes.borderRadiusCard),
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Consumer<SearchFilterModel>(
                  builder: (
                    final BuildContext context,
                    final SearchFilterModel cart,
                    final Widget? child,
                  ) =>
                      Text(
                    '$show (${SearchFilterModel.countPlace})',
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: ColorPalette.lmPrimaryColor,
                        ),
                  ),
                ),
              ],
            ),
            onPressed: () {
              //Записываем состояние фильтра

              context.read<SearchFilterModel>()
                ..saveFilterSettings()
                ..changeSearch();

              //возвращаемся на страници показа
              Navigator.pop(context);
              if (kDebugMode) {
                print('Это кнопка "Показать"');
              }
            },
          ),
        ),
      );

  //Макет кнопки фильтра
  Widget _categoryIcon(
    final BuildContext context,
    final String nameIcon,
    final TypePlace nameKey,
    final String svgIcons,
  ) =>
      Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Ink(
                decoration: const ShapeDecoration(
                  color: ColorPalette.greenColorLight,
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  iconSize: 53,
                  //color: ,
                  onPressed: () {
                    _setButtonSelect(context, nameKey);
                    _setFilter(context);
                  },
                  icon: SvgPicture.asset(
                    svgIcons,
                    height: 40,
                    color: ColorPalette.greenColor,
                  ),
                ),
              ),
              Positioned(
                bottom: -4,
                right: -4,
                child: SearchFilterModel.filterMap[nameKey]! == true
                    ? SvgPicture.asset(
                        SvgIcons.tickChoice,
                        height: 25,
                      )
                    : const SizedBox(
                        height: 0,
                        width: 0,
                      ),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            nameIcon,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      );

  //Установка выделения нажатой кнопки фильтра
  void _setButtonSelect(final BuildContext context, final TypePlace nameKey) {
    context.read<SearchFilterModel>().setTypePlaceSelected(nameKey);
    _setFilter(context);
  }

  //Установка фильтра
  void _setFilter(final BuildContext context) {
    context.read<SearchFilterModel>().countFilteredPlaces();
  }
}
