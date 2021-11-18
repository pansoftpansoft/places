import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/add_sight_screen/widgets/bottom_sheet_save_button.dart';
import 'package:places/ui/screen/add_sight_screen/widgets/element_list.dart';


/// Сисок категорий мест с возможностью выбора
class SelectCategory extends StatefulWidget {
  ///
  final TypePlace? typePlaceSelectedActual;

  ///
  TypePlace? typePlaceSelected;

  ///
  SelectCategory({
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
      widget.typePlaceSelected = widget.typePlaceSelectedActual;
    }

    return Scaffold(
      bottomSheet: BottomSheetSaveButton(widget),
      appBar: AppBar(
        title: Text(
          category,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: paddingPage,
                vertical: 24,
              ),
              child: ListView(
                children: <Widget>[
                  for (var iTypePlace = 0;
                      iTypePlace < TypePlace.values.toList().length;
                      iTypePlace++) ...<Widget>[
                    ElementList(
                      TypePlace.values.toList()[iTypePlace],
                      typePlaceSelected: widget.typePlaceSelected,
                    ),
                    const Divider(),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
