import 'package:flutter/material.dart';

///Небольшая кнопка с кавадратными углами
class TextButtonGreenText extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final IconData? iconNamePrefix;
  final IconData? iconNameSuffix;
  final String svgIconNamePrefix;
  final String svgIconNameSuffix;

  const TextButtonGreenText({
    required this.title,
    this.onPressed,
    this.iconNamePrefix,
    this.iconNameSuffix,
    this.svgIconNamePrefix = '',
    this.svgIconNameSuffix = '',
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return TextButton(
      style: Theme.of(context).textButtonTheme.style?.copyWith(
            backgroundColor: MaterialStateProperty.all(
              Colors.transparent,
            ),
          ),
      child: SizedBox(
        width: 164,
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
      onPressed: onPressed,
    );
  }
}
