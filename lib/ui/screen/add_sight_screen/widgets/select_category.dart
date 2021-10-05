import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/res/svg_icons.dart';

class SelectCategory extends StatefulWidget {
  final TypePlace? typePlaceSelectedActual;
  TypePlace? typePlaceSelected;

  SelectCategory({Key? key, TypePlace? this.typePlaceSelectedActual})
      : super(key: key);

  @override
  _SelectCategoryState createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {
  @override
  Widget build(BuildContext context) {
    if (widget.typePlaceSelectedActual != null &&
        widget.typePlaceSelected == null) {
      widget.typePlaceSelected = widget.typePlaceSelectedActual;
    }
    return Scaffold(
      bottomSheet: bottomSheetWidget(context),
      appBar: AppBar(
        title: Text(
          Labels.category,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.paddingPage, vertical: 24),
          child: Column(
            children: [
              for (var i = 0; i < TypePlace.values.toList().length; i++) ...[
                ElementList(TypePlace.values.toList()[i]),
                const Divider(),
              ]
            ],
          ),
        ),
      ),
    );
  }

  Widget ElementList(TypePlace typePlace) {
    return InkWell(
      onTap: () {
        if (widget.typePlaceSelected == typePlace) {
          widget.typePlaceSelected = null;
        } else {
          widget.typePlaceSelected = typePlace;
          setState(() {});
        }
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
            if (widget.typePlaceSelected == typePlace)
              SvgPicture.asset(
                SvgIcons.tick,
                color: ColorPalette.greenColor,
              ),
          ],
        ),
      ),
    );
  }

  //Кнопка "Сохранить"
  Widget bottomSheetWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.paddingPage,
        vertical: Sizes.paddingPage/2,
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints.tightFor(height: 48),
        child: ElevatedButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.zero),
            elevation: MaterialStateProperty.all(0),
            backgroundColor: widget.typePlaceSelected == null
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
                      color: widget.typePlaceSelected == null
                          ? ColorPalette.lmFontHeadline2.withOpacity(Sizes.opacityText)
                          : ColorPalette.lmPrimaryColor,
                    ),
              ),
            ],
          ),
          onPressed: widget.typePlaceSelected == null
              ? null
              : () {
                  Navigator.pop(context, widget.typePlaceSelected);
                },
        ),
      ),
    );
  }
}
