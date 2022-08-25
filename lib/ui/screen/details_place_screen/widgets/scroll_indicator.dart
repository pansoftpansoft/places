import 'package:flutter/material.dart';
import 'package:places/ui/res/sizes.dart';

///Индикатор прокрутки фотографий
class ScrollIndicator extends StatelessWidget {
  final int countElements;
  final int index;

  ///Конструктор индикатора прокрутки фотографий
  const ScrollIndicator({
    required this.countElements,
    required this.index,
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.only(
          left: (MediaQuery.of(context).size.width / countElements) * index,
        ),
        height: 8,
        width: MediaQuery.of(context).size.width / countElements,
        decoration: BoxDecoration(
          color: Theme.of(context).indicatorColor,
          borderRadius: buildBorderRadius(
            index,
            countElements,
          ),
        ),
      );

  ///Изменяем отображение индикатора прокрутки для крайних положений
  BorderRadius buildBorderRadius(int index, int countElements) {
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
