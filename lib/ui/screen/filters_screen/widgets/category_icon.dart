import 'package:flutter/material.dart';
import 'package:places/type_place.dart';
import 'package:places/ui/screen/filters_screen/widgets/category_icon_svg_icon.dart';
import 'package:places/ui/screen/sight_search_screen/models/search_filter_model.dart';
import 'package:provider/provider.dart';

///Макет кнопки фильтра
class CategoryIcon extends StatefulWidget {
  ///
  final String nameIcon;

  ///
  final TypePlace nameKey;

  ///
  final String svgIcons;

  ///
  const CategoryIcon(
    final this.nameIcon,
    final this.nameKey,
    final this.svgIcons, {
    final Key? key,
  }) : super(key: key);

  @override
  State<CategoryIcon> createState() => _CategoryIconState();
}

class _CategoryIconState extends State<CategoryIcon> {
  @override
  Widget build(final BuildContext context) => Consumer<SearchFilterModel>(
        builder: (
          final context,
          final cart,
          final child,
        ) =>
            Column(
          children: <Widget>[
            CategoryIconSvgIcon(
              widget.nameIcon,
              widget.nameKey,
              widget.svgIcons,
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              widget.nameIcon,
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
      );
}
