import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/widgets/sight_card/widgets/sight_card_body.dart';

/// Карточка из списка достопримечательностей
/// По условиям
///     this.goNeed == '',
///     this.goal == '',
///     отображаются дополнительные иконки
class SightCard extends StatelessWidget {
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
  final Sight _sight;

  /// Конструктор
  const SightCard(
    this._sight, {
    final Key? key,
    this.goNeed = '',
    this.goal = '',
    this.iconDelete = false, // отображать иконку удалить
    this.actionOnDelete,
    this.wantToVisit,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) => Card(
        margin: const EdgeInsets.fromLTRB(0, 0, 0, paddingPage),
        shape: _buildRoundedRectangleBorder(),
        elevation: 0,
        semanticContainer: false,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: SightCardBody(
          _sight,
          goNeed,
          goal,
          iconDelete: iconDelete,
          actionOnDelete: actionOnDelete,
          wantToVisit: wantToVisit,
        ),
      );

  ///
  RoundedRectangleBorder _buildRoundedRectangleBorder() {
    return const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(borderRadiusCard16),
      ),
    );
  }
}
