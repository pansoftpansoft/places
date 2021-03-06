import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/type_place.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/select_category/select_category.dart';

///
class SelectTypePlace extends StatefulWidget {
  ///
  const SelectTypePlace({Key? key}) : super(key: key);

  @override
  State<SelectTypePlace> createState() => _SelectTypePlaceState();
}

class _SelectTypePlaceState extends State<SelectTypePlace> {
  TypePlace? _typePlaceSelected;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 32,
        child: TextButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
          ),
          onPressed: () async {
            await _onPressed();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                _typePlaceSelected == null
                    ? notSelected
                    : typePlaceString(_typePlaceSelected as TypePlace),
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(fontSize: 16),
              ),
              SvgPicture.asset(
                SvgIcons.view,
              ),
            ],
          ),
        ),
      );

  Future<void> _onPressed() async {
    TypePlace? typePlaceResponse;
    typePlaceResponse = await Navigator.push(
      context,
      MaterialPageRoute<TypePlace>(
        builder: (context) =>
            SelectCategory(typePlaceSelectedActual: _typePlaceSelected),
      ),
    );

    if (typePlaceResponse != null) {
      _typePlaceSelected = typePlaceResponse;
    }

    debugPrint('вернули ${_typePlaceSelected.toString()}');
    setState(() {
      debugPrint('Выбор категории');
    });
  }
}
