import 'package:flutter/material.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/widgets/icon_button_special.dart';

class SightCardBodyIconDelete extends StatelessWidget {
  final bool iconDelete;
  final VoidCallback? actionOnDelete;

  const SightCardBodyIconDelete({
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
          : const IconButtonSpecial(
              SvgIcons.heartTransparent,
            ),
    );
  }
}
