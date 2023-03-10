import 'package:flutter/material.dart';
import 'package:places/data/interactor/add_place_interactor.dart';
import 'package:places/type_place.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/select_category/widgets/select_element_list.dart';
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
        child: Consumer<AddPlaceInteractor>(
          builder: (
            final context,
            final place,
            final child,
          ) =>
              ListView(
            children: <Widget>[
              for (var iTypePlace = 0;
                  iTypePlace < typePlace.length;
                  iTypePlace++) ...<Widget>[
                SelectElementList(
                  typePlace[iTypePlace],
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
