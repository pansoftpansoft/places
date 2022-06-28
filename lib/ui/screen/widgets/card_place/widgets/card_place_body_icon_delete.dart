import 'package:flutter/material.dart';
import 'package:places/data/model/place.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/widgets/icon_button_special.dart';


class CardPlaceBodyIconDelete extends StatelessWidget {
  final bool iconDelete;
  final VoidCallback? actionOnDelete;
  final Place _place;

  const CardPlaceBodyIconDelete(this._place, {
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
          : IconButtonSpecial(
        _place.isFavorites
            ? SvgIcons.heartFull
            : SvgIcons.heartTransparent,
        onPressed: actionOnDelete,
      ),
    );
  }
}
