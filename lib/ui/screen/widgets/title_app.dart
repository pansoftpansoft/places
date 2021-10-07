import 'package:flutter/material.dart';

///Главный заголовое экрана
class TitleApp extends StatelessWidget {
  ///Конструктор
  const TitleApp({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) => Column(
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
