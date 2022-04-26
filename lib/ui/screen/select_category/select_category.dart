import 'package:flutter/material.dart';
import 'package:places/type_place.dart';
import 'package:places/ui/screen/add_sight_screen/models/add_sight_model.dart';
import 'package:places/ui/screen/select_category/widgets/select_category_app_bar.dart';
import 'package:places/ui/screen/select_category/widgets/select_category_bottom_sheet.dart';
import 'package:places/ui/screen/select_category/widgets/select_category_list.dart';
import 'package:provider/provider.dart';

/// Сисок категорий мест с возможностью выбора
class SelectCategory extends StatefulWidget {
  ///
  final TypePlace? typePlaceSelectedActual;

  ///
  final TypePlace? typePlaceSelected;

  ///
  const SelectCategory({
    final Key? key,
    this.typePlaceSelected,
    this.typePlaceSelectedActual,
  }) : super(key: key);

  @override
  _SelectCategoryState createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {
  @override
  Widget build(final BuildContext context) {
    if (widget.typePlaceSelectedActual != null &&
        widget.typePlaceSelected == null) {
      context.read<AddSightModel>().selectTypePlace =
          widget.typePlaceSelectedActual;
    } else {
      context.read<AddSightModel>().selectTypePlace = null;
    }

    return Scaffold(
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
    );
  }
}
