import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/mocks.dart';
import 'package:provider/provider.dart';
import 'models/search_filter_model.dart';

//Экран фильтров
class FiltersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Запомним состояния фильтров
    var filterActual = context.read<SearchFilterModel>();
    filterActual.GetFilterSettings();
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: _title(context),
      ),
      bottomSheet: bottomSheetWidget(context),
      body: SingleChildScrollView(
        child: Consumer<SearchFilterModel>(
          builder: (context, cart, child) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                  ),
                  child: Row(
                    children: [
                      Text(
                        Labels.categories,
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
                  children: [
                    categoryIcon(
                        context, 'Отель', TypePlace.hotel, SvgIcons.hotel),
                    categoryIcon(context, 'Ресторан', TypePlace.restaurant,
                        SvgIcons.restaurant),
                    categoryIcon(context, 'Особое место',
                        TypePlace.particular_place, SvgIcons.particular_place),
                    categoryIcon(
                        context, 'Парк', TypePlace.park, SvgIcons.park),
                    categoryIcon(
                        context, 'Музей', TypePlace.museum, SvgIcons.museum),
                    categoryIcon(
                        context, 'Кафе', TypePlace.cafe, SvgIcons.cafe),
                  ],
                ),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.all(Sizes.paddingPage),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(Labels.distance),
                      Text(
                        '${Labels.from}  '
                        '${SearchFilterModel.selectedRange.start.round().toString()} ${Labels.to} '
                        '${SearchFilterModel.selectedRange.end.round().toString()} '
                        '${Labels.meters}',
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
                    onChanged: (RangeValues newRange) {
                      //Без определения этого свойства, бегунки не активны
                      SearchFilterModel.selectedRange = newRange;
                      SetFilter(context);
                    },
                    onChangeEnd: (RangeValues newRange) {
                      SearchFilterModel.selectedRange = newRange;
                      SetFilter(context);
                    },
                    labels: RangeLabels(
                      '${SearchFilterModel.selectedRange.start.round().toString()}',
                      '${SearchFilterModel.selectedRange.end.round().toString()}',
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Row _title(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () {
              clearFilterValue(context);
            },
            child: const Text(
              Labels.clear,
              style: TextStyle(
                fontSize: 16,
                color: ColorPalette.greenColor,
              ),
            ),
          ),
        ],
      );
  }

  void clearFilterValue(BuildContext context) {
    for (var item in SearchFilterModel.filterMap.entries) {
      SearchFilterModel.filterMap[item.key] = false;
    }
    SetFilter(context);
  }

  //Кнопка "показать"
  Widget bottomSheetWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.paddingPage,
        vertical: Sizes.paddingPage/2,
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
                borderRadius: BorderRadius.circular(12.0),
              ))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [



              Consumer<SearchFilterModel>(
                builder: (context, cart, child) {
                  return Text(
                    '${Labels.show} (${SearchFilterModel.countPlace})',
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: ColorPalette.lmPrimaryColor,
                        ),
                  );
                },
              ),
            ],
          ),
          onPressed: () {
            //Записываем состояние фильтра

            var filterActual = context.read<SearchFilterModel>();
            filterActual.SaveFilterSettings();
            filterActual.ChangeSearch();

            //возвращаемся на страници показа
            Navigator.pop(context);
            print('Это кнопка "Показать"');
          },
        ),
      ),
    );
  }

  //Макет кнопки фильтра
  Widget categoryIcon(BuildContext context, String nameIcon, TypePlace nameKey,
      String svgIcons) {
    return Column(
      children: [
        Stack(
          children: [
            Ink(
              decoration: const ShapeDecoration(
                color: ColorPalette.greenColorLight,
                shape: CircleBorder(),
              ),
              child: IconButton(
                iconSize: 53,
                //color: ,
                onPressed: () {
                  SetButtonSelect(context, nameKey);
                  SetFilter(context);
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
              child: SearchFilterModel.filterMap[nameKey] == true
                  ? SvgPicture.asset(
                      SvgIcons.tick_choice,
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
  }

  //Установка выделения нажатой кнопки фильтра
  void SetButtonSelect(BuildContext context, TypePlace nameKey) {
    var buttonActual = context.read<SearchFilterModel>();
    buttonActual.SetTypePlaceSelected(nameKey);
    SetFilter(context);
  }

  //Установка фильтра
  void SetFilter(BuildContext context) {
    var filterActual = context.read<SearchFilterModel>();
    filterActual.CountFilteredPlaces();
  }
}
