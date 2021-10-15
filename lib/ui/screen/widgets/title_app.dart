import 'package:flutter/material.dart';
import 'package:places/ui/res/labels.dart';

///Главный заголовое экрана
class TitleAppBigOrSmall extends StatelessWidget {
  ///Конструктор
  const TitleAppBigOrSmall({
    final Key? key,
    this.small = false,
  }) : super(key: key);

  ///Уменьшать заголовок AppBar. false-большой , true- маленький
  final bool small;

  @override
  Widget build(final BuildContext context) => small
      ? Text(
          Labels.list_interesting_places,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(fontSize: 18, fontWeight: FontWeight.w500),
        )
      : Column(
          children: <SizedBox>[
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              width: double.infinity,
              child: Text(
                'Список\nинтересных мест',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
          ],
        );
}
