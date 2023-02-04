import 'package:flutter/material.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/onboarding_screen/widgets/animation_icon.dart';

///Тело шаблона страници Onboard
class BodyPage extends StatelessWidget {
  /// Заголовок
  final String header1;

  /// Коментарий
  final String header2;

  /// Иконка
  final String svgIcon;

  ///
  const BodyPage({
    required this.header1,
    required this.header2,
    required this.svgIcon,
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        //Отступили на высоту BottomSheetOnboarding с низу
        //после чего контейнер выравнивается строго по центру
        padding: const EdgeInsets.only(bottom: heightBottomSheetOnboarding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  AnimationIcon(svgIcon: svgIcon),
                  const SizedBox(height: heightSizeBox12),
                  Text(
                    header1,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                          fontSize: fontSize24,
                        ),
                  ),
                  const SizedBox(height: heightSizeBox8),
                  Text(
                    header2,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
