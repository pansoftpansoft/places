import 'package:flutter/material.dart';
import 'package:places/ui/res/color_palette.dart';
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
          final BuildContext context,
          final SightDetailsModel sightDetailsModel,
          final Widget? child,
        ) =>
            Padding(
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
              color: ColorPalette.whiteMain,
              borderRadius: buildBorderRadius(
                SightDetailsModel.index,
                SightDetailsModel.countElements,
              ),
            ),
          ),
        ),
      );

  ///Изменяем отображение индикатора прокрутки для крайних положений
  BorderRadius buildBorderRadius(final int _index, final int _countElements) {
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(15));

    //Для первой позиции
    if (_index == 0) {
      borderRadius = const BorderRadius.only(
        topRight: Radius.circular(15),
        bottomRight: Radius.circular(15),
      );
    }
    //Для последней позиции
    if (_index + 1 == _countElements) {
      borderRadius = const BorderRadius.only(
        topLeft: Radius.circular(15),
        bottomLeft: Radius.circular(15),
      );
    }

    return borderRadius;
  }
}
