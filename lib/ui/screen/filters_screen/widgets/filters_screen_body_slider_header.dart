import 'package:flutter/material.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/sight_search_screen/models/search_filter_model.dart';
import 'package:provider/provider.dart';

class FiltersScreenBodySliderHeader extends StatelessWidget {
  const FiltersScreenBodySliderHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchFilterModel>(
      builder: (
        final context,
        final cart,
        final child,
      ) =>
          Padding(
        padding: const EdgeInsets.all(paddingPage),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Text>[
            const Text(distance),
            Text(
              '$from  '
              '${SearchFilterModel.selectedRange.start.round().toString()}'
              ' $toto '
              '${SearchFilterModel.selectedRange.end.round().toString()}'
              '$meters',
            ),
          ],
        ),
      ),
    );
  }
}
