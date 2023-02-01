import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/data/model/place_type.dart';
import 'package:places/ui/screen/filters_screen/bloc/filter_bloc.dart';
import 'package:places/ui/screen/filters_screen/widgets/category_icon_svg_icon.dart';

///Макет кнопки фильтра
class CategoryIcon extends StatefulWidget {
  final PlaceType placeType;

  const CategoryIcon(
    this.placeType, {
    Key? key,
  }) : super(key: key);

  @override
  State<CategoryIcon> createState() => _CategoryIconState();
}

class _CategoryIconState extends State<CategoryIcon> {
  @override
  Widget build(BuildContext context) =>
      BlocBuilder<FilterBloc, FilterState>(
        builder: (context, state) => Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: CategoryIconSvgIcon(
                widget.placeType,
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
