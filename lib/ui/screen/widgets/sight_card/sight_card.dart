import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/sight_details_screen/sight_details_screen.dart';
import 'package:places/ui/screen/widgets/icon_button_special.dart';

/// Карточка из списка достопримечательностей
/// По условиям
///     this.goNeed == '',
///     this.goal == '',
///     отображаются дополнительные иконки
class SightCard extends StatelessWidget {
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
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadiusCard),
          ),
        ),
        elevation: 0,
        semanticContainer: false,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Stack(
          children: <Widget>[
            //Картинка
            SizedBox(
              width: double.infinity,
              height: heightImage,
              child: Image.network(
                _sight.url,
                fit: BoxFit.fitWidth,
              ),
            ),
            //Надпись "категория" места
            Positioned(
              left: 16,
              top: 18,
              child: Text(
                typePlaceString(_sight.type),
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: const Color(0xFFFFFFFF),
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(paddingPage),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    width: double.infinity,
                    height: heightImage,
                  ),
                  Text(
                    _sight.name,
                    maxLines: 5,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  if (goNeed != '' && goal == '')
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        goNeed,
                        maxLines: 5,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2!
                            .copyWith(color: ColorPalette.greenColor),
                      ),
                    ),
                  if (goNeed == '' && goal != '')
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        goal,
                        maxLines: 5,
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ),
                  Text(
                    shortDescription,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        ?.copyWith(height: 1.5),
                  ),
                ],
              ),
            ),
            //Слой чернил для кликабельности всей карточки

            Positioned.fill(
              child: Material(
                color: Colors.transparent,
                child: Ink(
                  child: InkWell(
                    splashColor: ColorPalette.whiteMain.withOpacity(0.4),
                    onTap: () {
                      showDetailsScreen(context, _sight);
                      if (kDebugMode) {
                        print('Это кнопка "Вся карточка"');
                      }
                    },
                  ),
                ),
              ),
            ),
            //Иконка, что надо посетить это место
            Positioned(
              right: 59,
              top: 2,
              child: goNeed != ''
                  ? IconButtonSpecial(
                      SvgIcons.calendar,
                      onPressed: wantToVisit,
                    )
                  : const SizedBox(width: 0),
            ),

            //Иконка, что место уже посетили
            Positioned(
              right: 70,
              top: 19,
              child: goal != ''
                  ? const Icon(
                      Icons.share,
                      color: Colors.white,
                    )
                  : const SizedBox(width: 0),
            ),
            //Кнопка добавить в избранное или удалить
            Positioned(
              right: 8,
              top: 2,
              child: iconDelete
                  ? IconButtonSpecial(
                      SvgIcons.delete,
                      onPressed: actionOnDelete,
                    )
                  : const IconButtonSpecial(
                      SvgIcons.heartTransparent,
                    ),
            ),
          ],
        ),
      );

  ///
  Future<void> showDetailsScreen(
    final BuildContext context,
    final Sight _sight,
  ) async {
    await showModalBottomSheet<Widget>(
      context: context,
      builder: (final _) => SightDetailsScreen(_sight),
      isScrollControlled: true,
      isDismissible: true,
      useRootNavigator: true,
    );
  }
}
