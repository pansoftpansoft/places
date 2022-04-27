import 'package:flutter/material.dart';

class ElevatedButtonGreenBig extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final IconData? iconNamePrefix;
  final IconData? iconNameSuffix;

  const ElevatedButtonGreenBig({
    required this.title,
    this.onPressed,
    this.iconNamePrefix,
    this.iconNameSuffix,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(iconNamePrefix),
          Text(
            title.toUpperCase(),
          ),
          Icon(iconNameSuffix),
        ],
      ),
      onPressed: onPressed,
    );
  }
}
