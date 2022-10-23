import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/type_place.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/filters_screen/bloc/filter_bloc.dart';
import 'package:places/ui/screen/widgets/elevated_button_green_big.dart';


///Кнопка "показать"
class BottomSheetButtonShow extends StatelessWidget {
  ///Кнопка "показать"
  const BottomSheetButtonShow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(
      builder: (context, state) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: paddingPage,
          vertical: paddingPage_2,
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints.tightFor(height: heightSizeBox48),
          child: ElevatedButtonGreenBig(
            title: '$show (${mocksFiltered.length})',
            onPressed: mocksFiltered.isNotEmpty
                ? () {
                    _onPressed(context);
                  }
                : null,
          ),
        ),
      ),
    );
  }

  void _onPressed(BuildContext context) {
    context.read<FilterBloc>().add(const FilterEvents.saveSetting());
  }
}
