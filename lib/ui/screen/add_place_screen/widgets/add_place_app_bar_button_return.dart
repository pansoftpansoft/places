import 'package:flutter/material.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/screen/filters_screen/bloc/filter_bloc.dart';
import 'package:places/ui/screen/list_places_screen/bloc/list_places_bloc.dart';
import 'package:provider/provider.dart';

class AddPlaceAppBarButtonReturn extends StatelessWidget {
  const AddPlaceAppBarButtonReturn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        style: ButtonStyle(
          alignment: Alignment.centerLeft,
          padding: MaterialStateProperty.all<EdgeInsets>(
            EdgeInsets.zero,
          ),
        ),
        onPressed: () {
          context.read<ListPlacesBloc>().add(ListPlacesEvents.load(
              context.read<FilterBloc>().state.selectedCategory
          ));
          Navigator.pop(context);
        },
        child: Text(
          cancel,
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.subtitle2!.copyWith(
                fontSize: 16,
              ),
        ),
      ),
    );
  }
}
