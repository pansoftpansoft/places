import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/type_place.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/add_sight_screen/widgets/select_category.dart';

///
class SelectTypePlace extends StatefulWidget {
  ///
  const SelectTypePlace({final Key? key}) : super(key: key);

  @override
  State<SelectTypePlace> createState() => _SelectTypePlaceState();
}

class _SelectTypePlaceState extends State<SelectTypePlace> {
  TypePlace? _typePlaceSelected;

  @override
  Widget build(final BuildContext context) => SizedBox(
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
    TypePlace? _typePlaceResponse;
    _typePlaceResponse = await Navigator.push(
      context,
      MaterialPageRoute<TypePlace>(
        builder: (final context) =>
            SelectCategory(typePlaceSelectedActual: _typePlaceSelected),
      ),
    );

    if (_typePlaceResponse != null) {
      _typePlaceSelected = _typePlaceResponse;
    }

    debugPrint('вернули ${_typePlaceSelected.toString()}');
    setState(() {
      debugPrint('Выбор категории');
    });
  }
}
