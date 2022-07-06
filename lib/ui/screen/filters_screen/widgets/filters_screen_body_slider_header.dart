import 'package:flutter/material.dart';
import 'package:places/data/interactor/filters_screen_interactor.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:provider/provider.dart';

class FiltersScreenBodySliderHeader extends StatelessWidget {
  const FiltersScreenBodySliderHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FiltersScreenInteractor>(
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
              '${FiltersScreenInteractor.rangeDistance.start.round().toString()}'
              ' $toto '
              '${FiltersScreenInteractor.rangeDistance.end.round().toString()}'
              '$meters',
            ),
          ],
        ),
      ),
    );
  }
}
