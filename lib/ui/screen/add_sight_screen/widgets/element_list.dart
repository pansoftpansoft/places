import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/svg_icons.dart';

///
class ElementList extends StatefulWidget {
  final TypePlace typePlace;
  TypePlace? typePlaceSelected;

  ElementList(
    this.typePlace, {
    this.typePlaceSelected,
    Key? key,
  }) : super(key: key);

  @override
  State<ElementList> createState() => _ElementListState();
}

class _ElementListState extends State<ElementList> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        debugPrint('${widget.typePlaceSelected} == ${widget.typePlace}');
        widget.typePlaceSelected = widget.typePlaceSelected == widget.typePlace
            ? null
            : widget.typePlace;
        setState(() {
          debugPrint('Обновить даные');
        });
      },
      child: SizedBox(
        height: 48,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              typePlaceString(widget.typePlace),
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
            ),
            if (widget.typePlaceSelected == widget.typePlace)
              SvgPicture.asset(
                SvgIcons.tick,
                color: ColorPalette.greenColor,
              ),
          ],
        ),
      ),
    );
  }
}

//
// Widget elementList(
//     final TypePlace typePlace,
//     TypePlace? typePlaceSelected,
//     ) =>
//     InkWell(
//       onTap: () {
//         debugPrint('$typePlaceSelected == $typePlace');
//         typePlaceSelected = typePlaceSelected == typePlace ? null : typePlace;
//         setState(() {
//           if (kDebugMode) {
//             print('Обновить даные');
//           }
//         });
//       },
//       child: SizedBox(
//         height: 48,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             Text(
//               typePlaceString(typePlace),
//               style: Theme.of(context).textTheme.headline4!.copyWith(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w400,
//               ),
//             ),
//             if (typePlaceSelected == typePlace)
//               SvgPicture.asset(
//                 SvgIcons.tick,
//                 color: ColorPalette.greenColor,
//               ),
//           ],
//         ),
//       ),
//     );
// //Кнопка "Сохранить"
// }
