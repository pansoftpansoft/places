import 'package:flutter/material.dart';
import 'package:places/data/model/place.dart';
import 'package:places/ui/screen/widgets/card_place/widgets/card_place_body_background.dart';
import 'package:places/ui/screen/widgets/card_place/widgets/card_place_body_icon_calendar.dart';
import 'package:places/ui/screen/widgets/card_place/widgets/card_place_body_icon_delete.dart';
import 'package:places/ui/screen/widgets/card_place/widgets/card_place_body_icon_goal.dart';
import 'package:places/ui/screen/widgets/card_place/widgets/card_place_body_picture.dart';
import 'package:places/ui/screen/widgets/card_place/widgets/card_place_body_ripple_effect.dart';
import 'package:places/ui/screen/widgets/card_place/widgets/card_place_body_text.dart';
import 'package:places/ui/screen/widgets/card_place/widgets/card_place_body_text_type.dart';

class CardPlaceBody extends StatelessWidget {
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

  final Place _place;

  const CardPlaceBody(
    this._place,
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
        CardPlaceBodyPicture(heightImage: heightImage, place: _place),
        //
        const CardPlaceBodyBackground(heightImage: heightImage,),
        //Надпись "категория" места
        CardPlaceBodyTextType(_place),
        CardPlaceBodyText(
          heightImage: heightImage,
          place: _place,
          goNeed: goNeed,
          goal: goal,
        ),
        //Слой чернил для кликабельности всей карточки
        CardPlaceBodyRippleEffect(_place),
        //Иконка, что надо посетить это место
        CardPlaceBodyIconCalendar(goNeed, wantToVisit),
        //Иконка, что место уже посетили
        CardPlaceBodyIconGoal(goal: goal),
        //Кнопка добавить в избранное или удалить
        CardPlaceBodyIconDelete(
          _place,
          iconDelete: iconDelete,
          actionOnDelete: actionOnDelete,
        ),
      ],
    );
  }
}
