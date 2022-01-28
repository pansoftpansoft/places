import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screen/add_sight_screen/models/add_sight_model.dart';
import 'package:places/ui/screen/add_sight_screen/widgets/full_photo.dart';
import 'package:places/ui/screen/add_sight_screen/widgets/gesture_detector_widget.dart';
import 'package:provider/provider.dart';

///Построение списка фотографий на экране добавления места
class ListViewBuilder extends StatelessWidget {
  ///
  const ListViewBuilder({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddSightModel>(
      builder: (
        final context,
        final sight,
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