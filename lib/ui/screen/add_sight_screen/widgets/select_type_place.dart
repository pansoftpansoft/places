import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/mocks.dart';
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

            TypePlace? _typePlaceRespons;
            _typePlaceRespons = await Navigator.push(
              context,
              MaterialPageRoute<TypePlace>(
                builder: (final BuildContext context) =>
                    SelectCategory(typePlaceSelectedActual: _typePlaceSelected),
              ),

            );

            if(_typePlaceRespons!=null){
              _typePlaceSelected = _typePlaceRespons;
            }

            debugPrint('вернули ${_typePlaceSelected.toString()}');
            setState(() {
              if (kDebugMode) {
                print('Выбор категории');
              }
            });
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
}
