import 'package:flutter/material.dart';
import 'package:places/data/model/place_type.dart';
import 'package:places/data/interactor/filters_screen_interactor.dart';
import 'package:places/ui/screen/filters_screen/widgets/category_icon_svg_icon.dart';
import 'package:provider/provider.dart';

///Макет кнопки фильтра
class CategoryIcon extends StatefulWidget {
  final PlaceType placeType;

  const CategoryIcon(
    this.placeType, {
    final Key? key,
  }) : super(key: key);

  @override
  State<CategoryIcon> createState() => _CategoryIconState();
}

class _CategoryIconState extends State<CategoryIcon> {
  @override
  Widget build(final BuildContext context) => Consumer<FiltersScreenInteractor>(
        builder: (
          final context,
          final cart,
          final child,
        ) =>
            Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: CategoryIconSvgIcon(widget.placeType,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              widget.placeType.namePlaceTranslate,
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
      );
}
