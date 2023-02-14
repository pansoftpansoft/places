import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CircleAvatarSpecial extends StatelessWidget {
  final String iconName;

  const CircleAvatarSpecial({Key? key, required this.iconName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: 30,
      child: SvgPicture.asset(
        iconName,
        color: Colors.white,
      ),
    );
  }
}
