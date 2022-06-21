import 'package:flutter/material.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/filters_screen/model/filters_screen_model.dart';
import 'package:provider/provider.dart';

class FiltersScreenBodySliderHeader extends StatelessWidget {
  const FiltersScreenBodySliderHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FiltersScreenModel>(
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
              '${FiltersScreenModel.rangeDistance.start.round().toString()}'
              ' $toto '
              '${FiltersScreenModel.rangeDistance.end.round().toString()}'
              '$meters',
            ),
          ],
        ),
      ),
    );
  }
}
