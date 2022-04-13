import 'package:flutter/material.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/sight_details_screen/models/sight_details_model.dart';
import 'package:provider/provider.dart';

///Индикатор прокрутки фотографий
class ScrollIndicator extends StatelessWidget {
  ///Конструктор индикатора прокрутки фотографий
  const ScrollIndicator({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) => Consumer<SightDetailsModel>(
        builder: (
          final context,
          final sightDetailsModel,
          final child,
        ) {
          debugPrint('_index ${SightDetailsModel.index} '
              'элементов ${SightDetailsModel.countElements}  '
              'width ${MediaQuery.of(context).size.width}');
          return Padding(
            padding: EdgeInsets.only(
              left: (MediaQuery.of(context).size.width /
                      SightDetailsModel.countElements) *
                  SightDetailsModel.index,
            ),
            child: Container(
              height: 8,
              width: MediaQuery.of(context).size.width /
                  SightDetailsModel.countElements,
              decoration: BoxDecoration(
                color: Theme.of(context).indicatorColor,
                borderRadius: buildBorderRadius(
                  SightDetailsModel.index,
                  SightDetailsModel.countElements,
                ),
              ),
            ),
          );
        },
      );

  ///Изменяем отображение индикатора прокрутки для крайних положений
  BorderRadius buildBorderRadius(final int _index, final int _countElements) {
    var borderRadius = const BorderRadius.all(
      Radius.circular(borderRadiusCard16),
    );

    debugPrint('_index $_index элементов $_countElements');
    //Для первой позиции
    if (_index == 0) {
      borderRadius = const BorderRadius.only(
        topRight: Radius.circular(borderRadiusCard16),
        bottomRight: Radius.circular(borderRadiusCard16),
      );
    }
    //Для последней позиции
    if (_index + 1 == _countElements) {
      borderRadius = const BorderRadius.only(
        topLeft: Radius.circular(borderRadiusCard16),
        bottomLeft: Radius.circular(borderRadiusCard16),
      );
    }

    return borderRadius;
  }
}
