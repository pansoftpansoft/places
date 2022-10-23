import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/details_place_screen/bloc/details_place_bloc.dart';
import 'package:places/ui/screen/list_places_screen/bloc/list_places_bloc.dart';
import 'package:places/ui/screen/widgets/text_button_small.dart';

/// Кнопка 'В избранное'
class AddToFavoritesButton extends StatelessWidget {
  /// Конструктор кнопки 'В избранное'
  const AddToFavoritesButton({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsPlaceBloc, DetailsPlaceState>(
      builder: (context, state) {
        return TextButtonSmall(
          title: state.isFavorites
              ? alreadyInFavoritesString
              : addToFavoritesString,
          onPressed: () {
            context.read<DetailsPlaceBloc>().add(
                  DetailsPlaceEvents.onChangedFavorites(
                    place: state.place,
                    isFavorites: state.isFavorites,
                  ),
                );
            context.read<ListPlacesBloc>().add(
                  const ListPlacesEvents.load(),
                );
          },
          svgIconNamePrefix: state.isFavorites
              ? SvgIcons.heartFull
              : SvgIcons.heartTransparent,
        );
      },
    );
  }
}
