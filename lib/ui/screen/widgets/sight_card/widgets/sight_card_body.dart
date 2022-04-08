import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/screen/widgets/sight_card/widgets/sight_card_body_icon_calendar.dart';
import 'package:places/ui/screen/widgets/sight_card/widgets/sight_card_body_icon_delete.dart';
import 'package:places/ui/screen/widgets/sight_card/widgets/sight_card_body_icon_goal.dart';
import 'package:places/ui/screen/widgets/sight_card/widgets/sight_card_body_picture.dart';
import 'package:places/ui/screen/widgets/sight_card/widgets/sight_card_body_ripple_effect.dart';
import 'package:places/ui/screen/widgets/sight_card/widgets/sight_card_body_text.dart';
import 'package:places/ui/screen/widgets/sight_card/widgets/sight_card_body_text_type.dart';

class SightCardBody extends StatelessWidget {
  /// Высота картинки
  static const double heightImage = 95;

  /// Флаг, что нижно посетить это место
  final String goNeed;

  /// Флаг что место уже посетили
  final String goal;

  /// Отображать иконку удалить
  final bool iconDelete;

  /// Функция удаления
  final VoidCallback? actionOnDelete;

  final VoidCallback? wantToVisit;

  final Sight _sight;

  const SightCardBody(
    this._sight,
    this.goNeed,
    this.goal, {
    this.iconDelete = false,
    this.actionOnDelete,
    this.wantToVisit,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        //Картинка
        SightCardBodyPicture(heightImage: heightImage, sight: _sight),
        //Надпись "категория" места
        SightCardBodyTextType(_sight),
        SightCardBodyText(
          heightImage: heightImage,
          sight: _sight,
          goNeed: goNeed,
          goal: goal,
        ),
        //Слой чернил для кликабельности всей карточки
        SightCardBodyRippleEffect(_sight),
        //Иконка, что надо посетить это место
        SightCardBodyIconCalendar(goNeed, wantToVisit),
        //Иконка, что место уже посетили
        SightCardBodyIconGoal(goal: goal),
        //Кнопка добавить в избранное или удалить
        SightCardBodyIconDelete(
          iconDelete: iconDelete,
          actionOnDelete: actionOnDelete,
        ),
      ],
    );
  }
}
