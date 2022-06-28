import 'package:flutter/material.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/widgets/text_button_small.dart';

///Кнопка 'Заплонировать'
class ScheduleButton extends StatelessWidget {
  ///Конструктор кнопки 'Заплонировать'
  const ScheduleButton({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) => const TextButtonSmall(
        title: schedule,
        svgIconNamePrefix: SvgIcons.schedule,
      );
}
