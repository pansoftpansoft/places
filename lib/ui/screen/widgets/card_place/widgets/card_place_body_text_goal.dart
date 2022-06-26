import 'package:flutter/material.dart';

class CardPlaceBodyTextGoal extends StatelessWidget {
  final String goal;
  final double _padding;
  final int _maxLines;

  const CardPlaceBodyTextGoal({
    Key? key,
    required double padding,
    required this.goal,
    required int maxLines,
  })  : _padding = padding,
        _maxLines = maxLines,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: _padding),
      child: Text(
        goal,
        maxLines: _maxLines,
        style: Theme.of(context).textTheme.subtitle2,
      ),
    );
  }
}
