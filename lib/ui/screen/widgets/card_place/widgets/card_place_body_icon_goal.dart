import 'package:flutter/material.dart';

class CardPlaceBodyIconGoal extends StatelessWidget {
  final String goal;

  const CardPlaceBodyIconGoal({
    Key? key,
    required this.goal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 70,
      top: 19,
      child: goal != ''
          ? const Icon(
              Icons.share,
              color: Colors.white,
            )
          : const SizedBox(width: 0),
    );
  }
}
