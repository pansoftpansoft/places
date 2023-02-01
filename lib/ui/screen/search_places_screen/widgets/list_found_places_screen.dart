import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/search_places_screen/bloc/search_places_bloc.dart';
import 'package:places/ui/screen/search_places_screen/widgets/search_card_place.dart';

///Список найденых мест
class ListFoundPlacesScreen extends StatelessWidget {
  ///
  const ListFoundPlacesScreen({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchPlacesBloc, SearchPlacesState>(
      builder: (context, state) {
        return ListView.separated(
          itemCount: state.listSearch.length,
          shrinkWrap: true,
          itemBuilder: (context, index) =>
              SearchCardPlace(state.listSearch[index]),
          separatorBuilder: (
            final context,
            final index,
          ) =>
              const Padding(
            padding: EdgeInsets.fromLTRB(paddingPage + 56, 0, 0, 0),
            child: Divider(height: 0.8),
          ),
        );
      },
    );
  }
}
