import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/res/labels.dart';
import 'dart:math';
import 'package:places/mocks.dart';

//Экран фильтров
class FiltersScreen extends StatefulWidget {
  const FiltersScreen({Key? key}) : super(key: key);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  RangeValues _selectedRange = const RangeValues(100, 1000);
  int countPlace = 0;

  //Состояния ностроек фильтра
  Map<TypePlace, bool> filterMap = {
    TypePlace.hotel: true,
    TypePlace.restaurant: true,
    TypePlace.particular_place: true,
    TypePlace.park: false,
    TypePlace.museum: true,
    TypePlace.cafe: false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: bottomSheetWidget(context),
      appBar: AppBar(
        centerTitle: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                setState(() {
                  for (var item in filterMap.entries) {
                    filterMap[item.key] = false;
                  }
                  SetFilter();
                });
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
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
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
            GridView.count(crossAxisCount: 3, shrinkWrap: true, children: [
              categoryIcon(context, 'Отель', TypePlace.hotel, SvgIcons.hotel),
              categoryIcon(context, 'Ресторан', TypePlace.restaurant,
                  SvgIcons.restaurant),
              categoryIcon(context, 'Особое место', TypePlace.particular_place,
                  SvgIcons.particular_place),
              categoryIcon(context, 'Парк', TypePlace.park, SvgIcons.park),
              categoryIcon(context, 'Музей', TypePlace.museum, SvgIcons.museum),
              categoryIcon(context, 'Кафе', TypePlace.cafe, SvgIcons.cafe),
            ]),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(Labels.distance),
                  Text(
                    '${Labels.from}  '
                    '${_selectedRange.start.round().toString()} ${Labels.to} '
                    '${_selectedRange.end.round().toString()} '
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
                values: _selectedRange,
                onChanged: (RangeValues newRange) {
                  //Без определения этого свойства, бегунки не активны
                },
                onChangeEnd: (RangeValues newRange) {
                  setState(() {
                    _selectedRange = newRange;
                    SetFilter();
                  });
                },
                labels: RangeLabels(
                  '${_selectedRange.start.round().toString()}',
                  '${_selectedRange.end.round().toString()}',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //Кнопка "показать"
  Widget bottomSheetWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
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
              Text(
                '${Labels.show} (${countPlace})',
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: ColorPalette.lmPrimaryColor,
                    ),
              ),
            ],
          ),
          onPressed: () {
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
                  SetButtonSelect(nameKey);
                  SetFilter();
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
              child: filterMap[nameKey] == true
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
  void SetButtonSelect(TypePlace nameKey) {
    setState(() {
      filterMap[nameKey] = filterMap[nameKey] == true ? true : false;
    });
  }

  //Установка фильтра
  void SetFilter() {
    int _countPlace = 0;
    print(_selectedRange.end);
    for (var item in mocks) {
      if (double.tryParse(item.lat) != null &&
          double.tryParse(item.lat) != null) {
        if (ArePointsNear(double.parse(item.lat.toString()),
                double.parse(item.lon.toString())) ==
            true) {
          if (filterMap[item.type] == true) {
            _countPlace++;
          }
        }
      }
    }
    countPlace = _countPlace;
  }

  //Проверка вхождения точки в радиус
  bool ArePointsNear(double checkPointLat, double checkPointLon) {
    double centerPointLat = 55.753605;
    double centerPointLon = 37.619773;
    var ky = 40000000 / 360; //40000000 - длина окружности земли в метрах
    var kx = cos(pi * centerPointLat / 180.0) * ky;
    var dx = (centerPointLon - checkPointLon).abs() * kx;
    var dy = (centerPointLat - checkPointLat).abs() * ky;
    return sqrt(dx * dx + dy * dy) <= _selectedRange.end &&
        sqrt(dx * dx + dy * dy) >= _selectedRange.start;
  }
}
