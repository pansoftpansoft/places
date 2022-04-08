import 'package:flutter/material.dart';
import 'package:places/ui/res/color_palette.dart';

class SightCardBodyTextGoNeed extends StatelessWidget {
  final String goNeed;
  final double _padding;
  final int _maxLines;


  const SightCardBodyTextGoNeed({
    Key? key,
    required double padding,
    required this.goNeed,
    required int maxLines,
  }) : _padding = padding, _maxLines = maxLines, super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: _padding),
      child: Text(
        goNeed,
        maxLines: _maxLines,
        style: Theme.of(context)
            .textTheme
            .subtitle2!
            .copyWith(color: ColorPalette.greenColor),
      ),
    );
  }
}
