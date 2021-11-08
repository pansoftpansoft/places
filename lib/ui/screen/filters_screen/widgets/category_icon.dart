import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/filters_screen/filters_screen.dart';
import 'package:places/ui/screen/sight_search_screen/models/search_filter_model.dart';
import 'package:provider/provider.dart';

///Макет кнопки фильтра
class CategoryIcon extends StatefulWidget {
  ///
  const CategoryIcon(
    final this.nameIcon,
    final this.nameKey,
    final this.svgIcons, {
    final Key? key,
  }) : super(key: key);

  ///
  final String nameIcon;

  ///
  final TypePlace nameKey;

  ///
  final String svgIcons;

  @override
  State<CategoryIcon> createState() => _CategoryIconState();
}

class _CategoryIconState extends State<CategoryIcon> {
  @override
  Widget build(final BuildContext context) => Consumer<SearchFilterModel>(
        builder: (
          final BuildContext context,
          final SearchFilterModel cart,
          final Widget? child,
        ) =>
            Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Ink(
                  decoration: const ShapeDecoration(
                    color: ColorPalette.greenColorLight,
                    shape: CircleBorder(),
                  ),
                  child: IconButton(
                    iconSize: 53,
                    //color: ,
                    onPressed: () {
                      FiltersScreen.setButtonSelect(context, widget.nameKey);
                      FiltersScreen.setFilter(context);
                      setState(() {
                        if (kDebugMode) {
                          print('Обновить даные');
                        }
                      });
                    },
                    icon: SvgPicture.asset(
                      widget.svgIcons,
                      height: 40,
                      color: ColorPalette.greenColor,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -4,
                  right: -4,
                  child: SearchFilterModel.filterMap[widget.nameKey]!
                      ? SvgPicture.asset(
                          SvgIcons.tickChoice,
                          height: 25,
                        )
                      : const SizedBox(
                          height: 0,
                          width: 0,
                        ),
                ),
              ],
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
