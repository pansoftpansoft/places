import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

///
class IconButtonSpecial extends StatefulWidget {
  ///
  final String iconName;

  ///
  final VoidCallback? onPressed;

  ///
  const IconButtonSpecial(
    this.iconName, {
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _IconButtonSpecialState();
}

class _IconButtonSpecialState extends State<IconButtonSpecial> {
  @override
  Widget build(BuildContext context) {

    return Material(
      borderRadius: const BorderRadius.all(
        Radius.circular(30),
      ),
      color: Colors.transparent,
      child: ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
            ),
          ),
        ),
        onPressed: widget.onPressed,
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 30,
          child: SvgPicture.asset(
            widget.iconName,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
