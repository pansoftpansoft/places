import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/sizes.dart';

///Кнопка "Создать"
class BottomSheetCreateButton extends StatelessWidget {
  ///
  const BottomSheetCreateButton({
    final Key? key,
  }) : super(key: key);

  ///

  @override
  Widget build(final BuildContext context) => Container(
        color: Theme.of(context).backgroundColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: paddingPage,
            vertical: 8,
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints.tightFor(height: 48),
            child: ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.zero),
                elevation: MaterialStateProperty.all(0),
                backgroundColor:
                    MaterialStateProperty.all<Color>(ColorPalette.greenColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(borderRadiusCard)),
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    create,
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: ColorPalette.lmPrimaryColor,
                        ),
                  ),
                ],
              ),
              onPressed: () {
                mocks.add(
                  Sight(
                    'Ивановская площадь',
                    '55.751426',
                    '37.618879',
                    'https://liveinmsk.ru/up/photos/album/kremlin/1327.jpg',
                    'Ивановская площадь — площадь в Московском Кремле, '
                        'одна из древнейших площадей Москвы. '
                        'Возникла после постройки в 1329 году '
                        'каменной церкви Иоанна Лествичника'
                        ', «что под колоколы», которая разделила ранее '
                        'единую городскую площадь на две части. '
                        'Её восточная часть по Иоанновской церкви '
                        'стала позднее именоваться Ивановской, западная — '
                        'Соборной площадью. В XIV—XV веках южную и восточную '
                        'стороны площади занимали дворы удельных князей '
                        'Московского дома.',
                    TypePlace.park,
                  ),
                );
                if (kDebugMode) {
                  print('Это кнопка "Создать" размер массива ${mocks.length}');
                }
              },
            ),
          ),
        ),
      );
}
