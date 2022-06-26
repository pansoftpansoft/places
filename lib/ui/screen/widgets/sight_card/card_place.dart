import 'package:flutter/material.dart';
import 'package:places/data/model/place.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/widgets/sight_card/widgets/card_place_body.dart';

/// Карточка из списка достопримечательностей
/// По условиям
///     this.goNeed == '',
///     this.goal == '',
///     отображаются дополнительные иконки
class CardPlace extends StatelessWidget {
  /// Флаг, что нижно посетить это место
  final String goNeed;

  /// Флаг что место уже посетили
  final String goal;

  /// Отображать иконку удалить
  final bool iconDelete;

  /// Функция удаления
  final VoidCallback? actionOnDelete;

  final VoidCallback? wantToVisit;

  /// Место отображаемое в карточке
  final Place _place;

  /// Конструктор
  const CardPlace(
    this._place, {
    final Key? key,
    this.goNeed = '',
    this.goal = '',
    this.iconDelete = false, // отображать иконку удалить
    this.actionOnDelete,
    this.wantToVisit,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: heightSizeBox24),
    child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(borderRadiusCard16),
          ),
          child: AspectRatio(
            aspectRatio: 3 / 2,
            child: Container(
              color: Theme.of(context).cardTheme.color,
              child: CardPlaceBody(
                _place,
                goNeed,
                goal,
                iconDelete: iconDelete,
                actionOnDelete: actionOnDelete,
                wantToVisit: wantToVisit,
              ),
            ),
          ),
        ),
  );
}
