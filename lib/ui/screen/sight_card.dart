import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/svg_icons.dart';

//Карточка из списка достопримечательностей
class SightCard extends StatelessWidget {
  final Sight sight;
  final String goNeed;
  final String goal;

  SightCard(
    this.sight, {
    Key key,
    this.goNeed = '',
    this.goal = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 96,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(16),
                      topLeft: Radius.circular(16)),
                  child: TextButton(
                    onPressed: () {
                      print('Нажата картинка на карточке');
                    },
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.zero)),
                    child: Row(
                      children: [
                        Expanded(
                          child: Image.network(
                            sight.url,
                            fit: BoxFit.fitWidth,
                            loadingBuilder: (context, child, progress) {
                              return progress == null
                                  ? child
                                  : const UnconstrainedBox(
                                      child: const SizedBox(
                                        height: 10,
                                        width: 10,
                                        child:
                                            const CircularProgressIndicator(),
                                      ),
                                    );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 16,
                top: 16,
                child: Text(
                  sight.type,
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(color: const Color(0xFFFFFFFF)),
                ),
              ),
              Positioned(
                right: 42,
                top: 19,
                child: goNeed != ''
                    ? const Icon(
                        Icons.calendar_today_outlined,
                        color: Colors.white,
                      )
                    : const SizedBox(width: 0),
              ),
              Positioned(
                right: 42,
                top: 19,
                child: goal != ''
                    ? const Icon(
                        Icons.share,
                        color: Colors.white,
                      )
                    : const SizedBox(width: 0),
              ),
              Positioned(
                right: 18,
                top: 10,
                child: IconButton(
                  splashColor: ColorPalette.dmBasicColor,
                  splashRadius: 100,
                  iconSize: 20,
                  icon: SvgPicture.asset(
                    SvgIcons.heartTransparent,
                    //height: 20,
                  ),
                  onPressed: () {
                    print('Это кнопка "В избранное на карточке"');
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: (){print('Нажата кнопка на карточке "Название места"');},
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                  ),
                  child: Text(
                    sight.name,
                    maxLines: 5,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                if (goNeed != '' && goal == '')
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      goNeed,
                      maxLines: 5,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2
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
          const SizedBox(height: 16)
        ],
      ),
    );
  }
}
