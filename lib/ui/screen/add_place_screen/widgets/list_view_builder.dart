import 'package:flutter/material.dart';
import 'package:places/type_place.dart';
import 'package:places/data/interactor/add_place_interactor.dart';
import 'package:places/ui/screen/add_place_screen/widgets/full_photo.dart';
import 'package:places/ui/screen/add_place_screen/widgets/gesture_detector_widget.dart';
import 'package:provider/provider.dart';

///Построение списка фотографий на экране добавления места
class ListViewBuilder extends StatelessWidget {
  ///
  const ListViewBuilder({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddPlaceInteractor>(
      builder: (
        final context,
        final place,
        final child,
      ) =>
          ListView.builder(
        itemCount: tempPhotoPlace.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return index == 0 ? const GestureDetectorWidget() : FullPhoto(index);
        },
      ),
    );
  }
}
