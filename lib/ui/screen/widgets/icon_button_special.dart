import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconButtonSpecial extends StatefulWidget {
  final String iconName;
  final VoidCallback? onPressed;

  IconButtonSpecial(
    this.iconName, {
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  _IconButtonSpecialState createState() => _IconButtonSpecialState();
}

class _IconButtonSpecialState extends State<IconButtonSpecial> {
  @override
  Widget build(BuildContext context) {
    print(this.widget.onPressed.toString());
    return Material(
      borderRadius: BorderRadius.circular(30),
      color: Colors.transparent,
      child: ElevatedButton(
        // splashColor: ColorPalette.lmCardColor,
        // splashRadius: 100,
        // iconSize: 20,
        style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.zero),
            elevation: MaterialStateProperty.all(0),
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ))),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 30,
          child: SvgPicture.asset(
            this.widget.iconName,
            color: Colors.white,
          ),
        ),
        onPressed: widget.onPressed,
      ),
    );
  }
}
