import 'package:flutter/material.dart';
import 'package:places/data/interactor/add_place_interactor.dart';
import 'package:places/ui/screen/add_place_screen/bloc/add_place_bloc.dart';
import 'package:places/ui/screen/select_category/widgets/select_category_app_bar.dart';
import 'package:places/ui/screen/select_category/widgets/select_category_bottom_sheet.dart';
import 'package:places/ui/screen/select_category/widgets/select_category_list.dart';
import 'package:provider/provider.dart';

/// Сисок категорий мест с возможностью выбора
class SelectCategory extends StatelessWidget {
  ///
  const SelectCategory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        bottomSheet: const SelectCategoryBottomSheet(),
        appBar: const PreferredSize(
          preferredSize: Size(double.infinity, kToolbarHeight),
          child: SelectCategoryAppBar(),

        ),
        body: Column(
          children: const <Widget>[
            SelectCategoryList(),
          ],
        ),

      ),
      onWillPop: () async {
        _onWillPop(context,'');

        return true;
      },
    );
  }

  void _onWillPop(BuildContext context, String placeType) {
    context.read<AddPlaceBloc>().add(
      AddPlaceEvents.load(
        place: context.read<AddPlaceBloc>().state.place.copyWith(
        ),
      ),
    );

    _navigator(context);
  }

  void _navigator(BuildContext context) {
    Navigator.pop(
      context,
      context.read<AddPlaceInteractor>().selectTypePlace,
    );
  }

}
