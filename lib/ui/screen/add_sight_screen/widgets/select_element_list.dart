import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screen/add_sight_screen/models/add_sight_model.dart';
import 'package:places/ui/screen/add_sight_screen/widgets/select_element_list_row.dart';
import 'package:provider/provider.dart';

///
class SelectElementList extends StatefulWidget {
  final TypePlace typePlace;
  final TypePlace? typePlaceSelected;

  const SelectElementList(
    this.typePlace, {
    this.typePlaceSelected,
    Key? key,
  }) : super(key: key);

  @override
  State<SelectElementList> createState() => _SelectElementListState();
}

class _SelectElementListState extends State<SelectElementList> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final typePlaceSelect = widget.typePlaceSelected == widget.typePlace
            ? null
            : widget.typePlace;
        debugPrint('Выбрали тип места');
        context.read<AddSightModel>().selectCategory(typePlaceSelect);
      },
      child: SizedBox(
        height: 48,
        child: SelectElementListRow(
          widget: widget,
        ),
      ),
    );
  }
}
