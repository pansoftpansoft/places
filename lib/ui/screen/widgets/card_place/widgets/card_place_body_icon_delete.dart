import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/data/model/place.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/details_place_screen/bloc/details_place_bloc.dart';
import 'package:places/ui/screen/filters_screen/bloc/filter_bloc.dart';
import 'package:places/ui/screen/list_places_screen/bloc/list_places_bloc.dart';
import 'package:places/ui/screen/widgets/icon_button_special.dart';
import 'package:places/ui/screen/widgets/icon_button_special_animated.dart';

class CardPlaceBodyIconDelete extends StatelessWidget {
  final bool iconDelete;
  final VoidCallback? actionOnDelete;
  final Place _place;

  const CardPlaceBodyIconDelete(
    this._place, {
    Key? key,
    required this.iconDelete,
    required this.actionOnDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 8,
      top: 2,
      child: iconDelete
          ? IconButtonSpecial(
              SvgIcons.delete,
              onPressed: actionOnDelete,
            )
          : IconButtonSpecialAnimated(
              initialState: _place.isFavorites,
              iconFirst: SvgIcons.heartTransparent,
              iconSecond: SvgIcons.heartFull,
              onPressed: () async {
                context.read<DetailsPlaceBloc>().add(
                      DetailsPlaceEvents.onChangedFavorites(
                        place: _place,
                        isFavorites: _place.isFavorites,
                      ),
                    );

                context.read<ListPlacesBloc>().add(
                      ListPlacesEvents.loadDataWithoutReloadingList(
                        filterSet: context.read<FilterBloc>().state.filterSet,
                      ),
                    );
              },
              animationDuration: 500,
            ),
    );
  }
}
