import 'package:flutter/material.dart';
import 'package:places/data/interactor/add_place_interactor.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/add_place_screen/widgets/list_view_builder.dart';
import 'package:places/ui/screen/widgets/sized_box_12.dart';
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
  Widget build(final BuildContext context) => Column(
        children: [
          SizedBox(
            height: heightSizeBox72,
            width: double.infinity,
            child: Row(
              children: [
                Consumer<AddPlaceInteractor>(
                  builder: (
                    final context,
                    final place,
                    final child,
                  ) =>
                      const Expanded(
                    child: ListViewBuilder(),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox12(),
        ],
      );
}
