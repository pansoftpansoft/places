import 'package:flutter/material.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/details_place_screen/models/details_place_model.dart';
import 'package:provider/provider.dart';

///Индикатор прокрутки фотографий
class ScrollIndicator extends StatelessWidget {
  ///Конструктор индикатора прокрутки фотографий
  const ScrollIndicator({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) => Consumer<DetailsPlaceModel>(
        builder: (
          final context,
          final detailsPlaceModel,
          final child,
        ) => Container(
            margin: EdgeInsets.only(
              left: (MediaQuery.of(context).size.width /
                  context.read<DetailsPlaceModel>().countElements) *
                  context.read<DetailsPlaceModel>().index,
            ),
            height: 8,
            width: MediaQuery.of(context).size.width /
                context.read<DetailsPlaceModel>().countElements,
            decoration: BoxDecoration(
              color: Theme.of(context).indicatorColor,
              borderRadius: buildBorderRadius(
                context.read<DetailsPlaceModel>().index,
                context.read<DetailsPlaceModel>().countElements,
              ),
            ),
          ),
      );

  ///Изменяем отображение индикатора прокрутки для крайних положений
  BorderRadius buildBorderRadius(final int index, final int countElements) {
    var borderRadius = const BorderRadius.all(
      Radius.circular(borderRadiusCard16),
    );

    //debugPrint('_index $index элементов $countElements');
    //Для первой позиции
    if (index == 0) {
      borderRadius = const BorderRadius.only(
        topRight: Radius.circular(borderRadiusCard16),
        bottomRight: Radius.circular(borderRadiusCard16),
      );
    }
    //Для последней позиции
    if (index + 1 == countElements) {
      borderRadius = const BorderRadius.only(
        topLeft: Radius.circular(borderRadiusCard16),
        bottomLeft: Radius.circular(borderRadiusCard16),
      );
    }

    return borderRadius;
  }
}
