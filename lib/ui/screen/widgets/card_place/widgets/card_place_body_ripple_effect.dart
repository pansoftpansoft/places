import 'package:flutter/material.dart';
import 'package:places/data/model/place.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/screen/list_places_screen/bloc/list_places_bloc.dart';
import 'package:places/ui/screen/visiting_screen/bloc/ListWantVisitBloc/list_want_visit_bloc.dart';
import 'package:provider/provider.dart';

class CardPlaceBodyRippleEffect extends StatelessWidget {
  final Place place;

  const CardPlaceBodyRippleEffect(this.place, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Material(
        color: Colors.transparent,
        child: Ink(
          child: InkWell(
            splashColor: ColorPalette.whiteMain.withOpacity(0.4),
            onTap: () {
              context.read<ListPlacesBloc>().add(
                    ListPlacesEvents.selected(
                      place: place,
                    ),
                  );

              context.read<ListWantVisitBloc>().add(
                    WantVisitSelectPlaceEvent(place),
                  );
              // context.read<WantVisitTabBloc>().add(
              //       WantVisitSelectedPlaceEvent(place),
              //     );
              //
              // context.read<VisitedTabBloc>().add(
              //    VisitedTabSelectedPlaceEvent(place),
              // );

              debugPrint(place.name);
              debugPrint('Это кнопка "Вся карточка"');
            },
          ),
        ),
      ),
    );
  }
}
