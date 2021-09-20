import 'package:flutter/material.dart';

class TitleApp extends StatelessWidget {
  const TitleApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 16,
        ),
        Container(
          width: double.infinity,
          child: Text(
            'Список\nинтересных мест',
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
      ],
    );
  }
}
