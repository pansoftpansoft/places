import 'package:flutter/material.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/labels.dart';

///Заголовок шаблон страници Onboard
class HeaderPage extends StatelessWidget {
  ///
  const HeaderPage({
    required this.buttonSkipVisible,
    final Key? key,
  }) : super(key: key);

  ///
  final bool buttonSkipVisible;

  @override
  Widget build(final BuildContext context) => SizedBox(
        height: 50,
        child: Visibility(
          visible: buttonSkipVisible,
          child: TextButton(
            onPressed: () {},
            child: Text(
              skip,
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    fontSize: 16,
                    color: ColorPalette.greenColor,
                  ),
            ),
          ),
        ),
      );
}
