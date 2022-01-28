import 'package:flutter/material.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/add_sight_screen/models/add_sight_model.dart';
import 'package:places/ui/screen/add_sight_screen/widgets/full_photo_body.dart';
import 'package:provider/provider.dart';

/// Отображение фотографии
class FullPhoto extends StatefulWidget {
  ///
  final int index;

  ///
  const FullPhoto(
    this.index, {
    final Key? key,
  }) : super(key: key);

  @override
  State<FullPhoto> createState() => _FullPhotoState();
}

class _FullPhotoState extends State<FullPhoto> {
  @override
  Widget build(final BuildContext context) => Padding(
        padding: const EdgeInsets.only(right: paddingPage),
        child: Dismissible(
          direction: DismissDirection.up,
          onDismissed: (final direction) {
            _onTap(context, widget.index);
            //context.read<AddSightModel>().deletePhoto(widget.index);
          },
          key: UniqueKey(),
          child: FullPhotoBody(widget.index),
        ),
      );

  void _onTap(final BuildContext context, int index) {
    context.read<AddSightModel>().deletePhoto(index);
  }
}
