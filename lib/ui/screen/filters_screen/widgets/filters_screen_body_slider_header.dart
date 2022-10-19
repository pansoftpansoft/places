import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/data/interactor/filters_screen_interactor.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/filters_screen/bloc/filter_bloc.dart';
import 'package:provider/provider.dart';

class FiltersScreenBodySliderHeader extends StatelessWidget {
  const FiltersScreenBodySliderHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(
      builder: (context, state) => Padding(
        padding: const EdgeInsets.all(paddingPage),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Text>[
            const Text(distance),
            Text(
              '$from  '
              '${state.filterDistance!.distanceStart.round().toString()}'
              ' $toto '
              '${state.filterDistance!.distanceEnd.round().toString()}'
              '$meters',
            ),
          ],
        ),
      ),
    );
  }
}
