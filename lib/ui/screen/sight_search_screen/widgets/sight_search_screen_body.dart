import 'package:flutter/material.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/sight_search_screen/widgets/sight_search_screen_body_switch.dart';

class SightSearchScreenBody extends StatelessWidget {
  const SightSearchScreenBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: paddingPage,
      ),
      child: SightSearchScreenBodySwitch(),
    );
  }
}
