import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/svg_icons.dart';

class SelectCategory extends StatefulWidget {
  final TypePlace? typePlaceSelectedActual;

  SelectCategory({Key? key, TypePlace? this.typePlaceSelectedActual})
      : super(key: key);

  @override
  _SelectCategoryState createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {
  TypePlace? typePlaceSelected;

  @override
  Widget build(BuildContext context) {
    typePlaceSelected = widget.typePlaceSelectedActual;
    return Scaffold(
      bottomSheet: bottomSheetWidget(context),
      appBar: AppBar(
        title: Text(
          Labels.category,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          children: [
            for (var i = 0; i < TypePlace.values.toList().length; i++) ...[
              ElementList(TypePlace.values.toList()[i]),
              const Divider(),
            ]
          ],
        ),
      ),
    );
  }

  Widget ElementList(TypePlace typePlace) {
    return InkWell(
      onTap: () {
        if (typePlaceSelected == typePlace) {
          typePlaceSelected = null;
        } else {
          typePlaceSelected = typePlace;
        }
        setState(() {});
      },
      child: SizedBox(
        height: 48,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              Labels.TypePlaceString(typePlace),
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
            ),
            if (typePlaceSelected == typePlace)
              SvgPicture.asset(
                SvgIcons.tick,
                color: ColorPalette.greenColor,
              ),
          ],
        ),
      ),
    );
  }

  //Кнопка "Создать"
  Widget bottomSheetWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints.tightFor(height: 48),
        child: ElevatedButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.zero),
            elevation: MaterialStateProperty.all(0),
            backgroundColor: typePlaceSelected == null
                ? MaterialStateProperty.all<Color>(ColorPalette.dmBasicColor)
                : MaterialStateProperty.all<Color>(ColorPalette.greenColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                Labels.save,
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: typePlaceSelected == null
                          ? ColorPalette.lmFontHeadline2.withOpacity(0.56)
                          : ColorPalette.lmPrimaryColor,
                    ),
              ),
            ],
          ),
          onPressed: typePlaceSelected == null
              ? null
              : () {
                  Navigator.pop(context, typePlaceSelected);
                },
        ),
      ),
    );
  }
}
