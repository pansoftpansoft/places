import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/screen/add_place_screen/bloc/add_place_bloc.dart';
import 'package:places/ui/screen/select_category/bloc/select_category_bloc.dart';
import 'package:places/ui/screen/widgets/elevated_button_green_big.dart';

class SelectCategoryBottomSheetBody extends StatelessWidget {
  const SelectCategoryBottomSheetBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints.tightFor(height: 48),
      child: BlocBuilder<SelectCategoryBloc, SelectCategoryState>(
        builder: (
          context,
          state,
        ) =>
            ElevatedButtonGreenBig(
          title: save,
          onPressed: state.currentSelectCategory.isNotEmpty
              ? () {
                  _onPressed(context, state.currentSelectCategory);
                }
              : null,
        ),
      ),
    );
  }

  void _onPressed(BuildContext context, String placeType) {
    context.read<AddPlaceBloc>().add(
          AddPlaceEvents.onChangedFields(
            place: context.read<AddPlaceBloc>().state.place.copyWith(
                  placeType: placeType,
                ),
          ),
        );

    _navigator(context);
  }

  void _navigator(BuildContext context) {
    Navigator.pop(
      context,
    );
  }
}
