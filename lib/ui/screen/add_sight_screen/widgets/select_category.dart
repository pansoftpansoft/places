import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/add_sight_screen/widgets/bottom_sheet_save_button.dart';

/// Сисок категорий мест с возможностью выбора
class SelectCategory extends StatefulWidget {
  ///
  SelectCategory({
    final Key? key,
    this.typePlaceSelected,
    this.typePlaceSelectedActual,
  }) : super(key: key);

  ///
  final TypePlace? typePlaceSelectedActual;

  ///
  TypePlace? typePlaceSelected;

  @override
  _SelectCategoryState createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {
  @override
  Widget build(final BuildContext context) {
    if (widget.typePlaceSelectedActual != null &&
        widget.typePlaceSelected == null) {
      widget.typePlaceSelected = widget.typePlaceSelectedActual;
    }

    return Scaffold(
      bottomSheet: BottomSheetSaveButton(widget),
      appBar: AppBar(
        title: Text(
          category,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: paddingPage,
                vertical: 24,
              ),
              child: ListView(
                children: <Widget>[
                  for (int i = 0;
                      i < TypePlace.values.toList().length;
                      i++) ...<Widget>[
                    elementList(TypePlace.values.toList()[i]),
                    const Divider(),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget elementList(final TypePlace typePlace) => InkWell(
        onTap: () {
          print('${widget.typePlaceSelected} == ${typePlace}');
          if (widget.typePlaceSelected == typePlace) {
            widget.typePlaceSelected = null;
          } else {
            widget.typePlaceSelected = typePlace;
          }
          setState(() {
            if (kDebugMode) {
              print('Обновить даные');
            }
          });
        },
        child: SizedBox(
          height: 48,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                typePlaceString(typePlace),
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
              ),
              if (widget.typePlaceSelected == typePlace)
                SvgPicture.asset(
                  SvgIcons.tick,
                  color: ColorPalette.greenColor,
                ),
            ],
          ),
        ),
      );
//Кнопка "Сохранить"
}
