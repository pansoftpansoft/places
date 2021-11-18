import 'package:flutter/material.dart';
import 'package:places/ui/screen/add_sight_screen/models/add_sight_model.dart';
import 'package:places/ui/screen/add_sight_screen/widgets/list_view_builder.dart';
import 'package:provider/provider.dart';

///
class ListViewPhotoAdd extends StatefulWidget {
  ///
  const ListViewPhotoAdd({
    final Key? key,
  }) : super(key: key);

  @override
  State<ListViewPhotoAdd> createState() => _ListViewPhotoAddState();
}

class _ListViewPhotoAddState extends State<ListViewPhotoAdd> {
  @override
  Widget build(final BuildContext context) => Consumer<AddSightModel>(
        builder: (
          final context,
          final sight,
          final child,
        ) =>
            const Expanded(
          child: ListViewBuilder(),
        ),
      );
}
