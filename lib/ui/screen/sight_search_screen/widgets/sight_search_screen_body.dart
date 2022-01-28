import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/sight_search_screen/models/search_filter_model.dart';
import 'package:places/ui/screen/sight_search_screen/widgets/empty_screen.dart';
import 'package:places/ui/screen/sight_search_screen/widgets/list_of_found_places_screen.dart';
import 'package:places/ui/screen/sight_search_screen/widgets/load_screen.dart';
import 'package:places/ui/screen/sight_search_screen/widgets/sight_search_screen_body_switch.dart';
import 'package:places/ui/screen/widgets/history_list_screen/history_list_screen.dart';
import 'package:provider/provider.dart';

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
