import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/widgets/icon_button_special.dart';

/*
Карточка из списка достопримечательностей
По условиям
    this.goNeed == '',
    this.goal == '',
    отображаются дополнительные иконки
*/
class SightCard extends StatelessWidget {
  final Sight sight;
  final String goNeed;
  final String goal;
  final bool iconDelete;
  final VoidCallback? actionOnDelete;

  static const double heightImage = 95;

  SightCard(
    this.sight, {
    Key? key,
    this.goNeed = '',
    this.goal = '',
    this.iconDelete = false, // отображать иконку удалить
    this.actionOnDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, Sizes.paddingPage),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.borderRadiusCard),
      ),
      elevation: 0,
      semanticContainer: false,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Stack(
        children: [
          //Картинка
          Container(
            width: double.infinity,
            height: heightImage,
            child: Image.network(
              sight.url,
              fit: BoxFit.fitWidth,
            ),
          ),
          //Надпись "категория" места
          Positioned(
            left: 16,
            top: 18,
            child: Text(
              Labels.TypePlaceString(sight.type),
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    color: const Color(0xFFFFFFFF),
                  ),
            ),
          ),
          //Слой чернил для кликабельности всей карточки
          Material(
            color: Colors.transparent,
            child: Ink(
              child: InkWell(
                splashColor: Colors.lightGreenAccent,
                onTap: () {
                  print('Это кнопка "Вся карточка"');
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: double.infinity,
                        height: heightImage,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        sight.name,
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
                        Labels.shortDescription,
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          //Иконка, что надо посетить это место
          Positioned(
            right: 70,
            top: 19,
            child: goNeed != ''
                ? const Icon(
                    Icons.calendar_today_outlined,
                    color: Colors.white,
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
            child: this.iconDelete
                ? IconButtonSpecial(
                    SvgIcons.delete,
                    onPressed: this.actionOnDelete,

                  )
                : IconButtonSpecial(
                    SvgIcons.heartTransparent,
                  ),
          ),
        ],
      ),
    );
  }
}