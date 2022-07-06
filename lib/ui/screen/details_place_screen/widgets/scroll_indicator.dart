import 'package:flutter/material.dart';
import 'package:places/data/interactor/details_place_interactor.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:provider/provider.dart';

///Индикатор прокрутки фотографий
class ScrollIndicator extends StatelessWidget {
  ///Конструктор индикатора прокрутки фотографий
  const ScrollIndicator({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) => Consumer<DetailsPlaceInteractor>(
        builder: (
          final context,
          final detailsPlaceModel,
          final child,
        ) => Container(
            margin: EdgeInsets.only(
              left: (MediaQuery.of(context).size.width /
                  context.read<DetailsPlaceInteractor>().countElements) *
                  context.read<DetailsPlaceInteractor>().index,
            ),
            height: 8,
            width: MediaQuery.of(context).size.width /
                context.read<DetailsPlaceInteractor>().countElements,
            decoration: BoxDecoration(
              color: Theme.of(context).indicatorColor,
              borderRadius: buildBorderRadius(
                context.read<DetailsPlaceInteractor>().index,
                context.read<DetailsPlaceInteractor>().countElements,
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
