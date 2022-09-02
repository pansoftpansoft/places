import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/ui/screen/select_category/bloc/select_category_bloc.dart';
import 'package:places/ui/screen/select_category/widgets/select_element_list_row.dart';

///
class SelectElementList extends StatelessWidget {
  final String typePlace;

  const SelectElementList(
    this.typePlace, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectCategoryBloc, SelectCategoryState>(
      builder: (
        context,
        state,
      ) {
        return InkWell(
          onTap: () {
            _onTap(context, typePlace);
          },
          child: SizedBox(
            height: 48,
            child: SelectElementListRow(
              currentSelectCategory: state.currentSelectCategory,
              typePlaceSelected: typePlace,
            ),
          ),
        );
      },
    );
  }

  void _onTap(BuildContext context, String typePlaceSelected) {
    context.read<SelectCategoryBloc>().add(
          SelectCategoryEvents.select(
            currentSelectCategory: typePlaceSelected,
          ),
        );

    return;
  }
}
