import 'package:flutter/material.dart';
import 'package:places/ui/res/img.dart';
import 'package:places/ui/res/sizes.dart';

class CardPlaceholderPicture extends StatelessWidget {

  const CardPlaceholderPicture({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: MediaQuery.of(context).size.width/2-(213/2)-paddingPage,
      top: 0,
      child: Center(
        child: Image.asset(
          placeholder,
          height: 113,
          width: 213,
        ),
      ),
    );
  }
}
