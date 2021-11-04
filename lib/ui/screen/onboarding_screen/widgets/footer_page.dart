import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/svg_icons.dart';

///Подвал шаблон страници Onboard
class FooterPage extends StatelessWidget {
  ///
  const FooterPage({
    required this.buttonOnStartVisible,
    final Key? key,
  }) : super(key: key);

  ///
  final bool buttonOnStartVisible;

  @override
  Widget build(final BuildContext context) => Expanded(
        child: Column(
          children: <Widget>[
            SvgPicture.asset(
              SvgIcons.onboardProgress1,
              color: Colors.green,
            ),
            const SizedBox(height: 32),
            Container(
              constraints: const BoxConstraints.tightFor(height: 48),
              child: Visibility(
                visible: buttonOnStartVisible,
                child: ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      EdgeInsets.zero,
                    ),
                    elevation: MaterialStateProperty.all(0),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      ColorPalette.greenColor,
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      '/SightListScreen',
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        onStart,
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                              color: ColorPalette.lmPrimaryColor,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
