import 'package:flutter/material.dart';
import 'package:places/type_place.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/add_sight_screen/models/add_sight_model.dart';
import 'package:places/ui/screen/add_sight_screen/widgets/select_element_list.dart';
import 'package:provider/provider.dart';

///Создание списка категорий
class SelectCategoryList extends StatelessWidget {

  const SelectCategoryList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: paddingPage,
          vertical: 24,
        ),
        child: Consumer<AddSightModel>(
          builder: (
            final context,
            final sight,
            final child,
          ) =>
              ListView(
            children: <Widget>[
              for (var iTypePlace = 0;
                  iTypePlace < TypePlace.values.toList().length;
                  iTypePlace++) ...<Widget>[
                SelectElementList(
                  TypePlace.values.toList()[iTypePlace],
                  typePlaceSelected:
                      context.read<AddSightModel>().selectTypePlace,
                ),
                const Divider(),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
