import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/add_sight_screen/widgets/select_category.dart';
import 'package:places/ui/screen/widgets/text_field_icon.dart';

//Экран фильтров

class AddSightScreen extends StatefulWidget {
  AddSightScreen({Key? key}) : super(key: key);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<AddSightScreen> {
  TypePlace? typePlaceSelected;
  FocusNode _focusNodeNamePlace = FocusNode();
  FocusNode _focusNodeLat = FocusNode();
  FocusNode _focusNodeLon = FocusNode();
  FocusNode _focusNodeDescription = FocusNode();

  final TextEditingController _textEditingControllerNamePlace =
      TextEditingController();

  final TextEditingController _textEditingControllerLat =
      TextEditingController();

  final TextEditingController _textEditingControllerLon =
      TextEditingController();

  final TextEditingController _textEditingControllerDescription =
      TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      bottomSheet: bottomSheetWidget(context),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            textBaseline: TextBaseline.alphabetic,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            children: [
              Expanded(
                child: TextButton(
                  style: ButtonStyle(
                    alignment: Alignment.centerLeft,
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.all(0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    Labels.cancel,
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          fontSize: 16,
                        ),
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  Labels.newPlace,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              const Expanded(
                child: SizedBox(
                  width: 30,
                ),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.paddingPage),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Заголовок 'Ктегория'
              Opacity(
                opacity: Sizes.opacityText,
                child: Text(
                  Labels.categories,
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        fontSize: 12,
                      ),
                ),
              ),
              // Разделитель
              const SizedBox(height: 12),
              // Кнопка выбора категории
              SizedBox(
                height: 32,
                child: TextButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.zero)),
                  onPressed: () async {
                    typePlaceSelected = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SelectCategory(
                            typePlaceSelectedActual: typePlaceSelected),
                      ),
                    );
                    setState(() {});
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        typePlaceSelected == null
                            ? Labels.notSelected
                            : Labels.TypePlaceString(
                                typePlaceSelected as TypePlace),
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
              ),
              //Дивайдер
              const Opacity(
                  opacity: Sizes.opacityText,
                  child: Divider(
                    color: ColorPalette.lmTabBarUnSelect,
                    thickness: 0.8,
                  )),
              // Разделитель
              const SizedBox(height: 24),
              // Заголовок "Название"
              Text(
                Labels.namePlace,
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(fontSize: 12),
              ),
              // Разделитель
              const SizedBox(height: 12),
              // Поле ввода "Название"
              SizedBox(
                height: 40,
                child: Row(
                  children: [
                    Expanded(
                      child: TextFieldIcon(
                        controller: _textEditingControllerNamePlace,
                        focusNode: _focusNodeNamePlace,
                        focusNodeNext: _focusNodeLat,
                        svgIconSuffixForText: SvgIcons.clear,
                        svgIconSuffixForTextColor: Colors.black,
                        heightIcon: 20,
                        borderRadius: 8,
                        maxLines: 1,
                        actionIconSuffixForText: () {
                          _textEditingControllerNamePlace.clear();
                        },
                        actionOnSubmitted: (value) {
                          _focusNodeLat.requestFocus();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              //Загаловки "Широта" и "Долгота
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      Labels.lat,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .copyWith(fontSize: 12),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Text(
                      Labels.lon,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .copyWith(fontSize: 12),
                    ),
                  ),
                ],
              ),
              // Разделитель
              const SizedBox(height: 12),
              // Поля ввода широты и долготы
              SizedBox(
                height: 40,
                child: Row(
                  children: [
                    Expanded(
                      child: TextFieldIcon(
                        controller: _textEditingControllerLat,
                        focusNode: _focusNodeLat,
                        focusNodeNext: _focusNodeLon,
                        keyboardType: TextInputType.number,
                        svgIconSuffixForText: SvgIcons.clear,
                        svgIconSuffixForTextColor: Colors.black,
                        heightIcon: 20,
                        borderRadius: 8,
                        maxLines: 1,
                        actionIconSuffixForText: () {
                          _textEditingControllerLat.clear();
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r"^\d*?\.?\d*?$")),
                        ],
                        actionOnSubmitted: (value) {
                          _focusNodeLon.requestFocus();
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFieldIcon(
                        controller: _textEditingControllerLon,
                        focusNode: _focusNodeLon,
                        focusNodeNext: _focusNodeDescription,
                        keyboardType: TextInputType.number,
                        svgIconSuffixForText: SvgIcons.clear,
                        svgIconSuffixForTextColor: Colors.black,
                        heightIcon: 20,
                        borderRadius: 8,
                        maxLines: 1,
                        actionIconSuffixForText: () {
                          _textEditingControllerLon.clear();
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r"^\d*?\.?\d*?$")),
                        ],
                        actionOnSubmitted: (value) {
                          _focusNodeDescription.requestFocus();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              // Разделитель
              const SizedBox(height: 15),
              // Кнопка "Указать на карте"
              Row(
                children: [
                  TextButton(
                    style: ButtonStyle(
                      alignment: Alignment.centerLeft,
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.all(0),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      Labels.specifyOnMap,
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          fontSize: 16, color: ColorPalette.greenColor),
                    ),
                  ),
                ],
              ),
              // Разделитель
              const SizedBox(height: 24),
              //Заголовок "Описание"
              Row(
                children: [
                  Text(
                    Labels.description,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(fontSize: 12),
                  ),
                ],
              ),
              // Разделитель
              const SizedBox(height: 12),
              //Поле ввода описание
              SizedBox(
                height: 80,
                child: Row(
                  children: [
                    Expanded(
                      child: TextFieldIcon(
                        controller: _textEditingControllerDescription,
                        focusNode: _focusNodeDescription,
                        svgIconSuffixForText: SvgIcons.clear,
                        svgIconSuffixForTextColor: Colors.black,
                        heightIcon: 20,
                        borderRadius: 8,
                        maxLines: 5,
                        actionIconSuffixForText: () {
                          _textEditingControllerDescription.clear();
                        },
                        actionOnSubmitted: (value) {
                          _focusNodeDescription.unfocus();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              // Добавлен, чтобы не закрывала нижняя кнопка
              const SizedBox(height: 48),
            ],
          ),
        ),
      ),
    );
  }

  //Кнопка "Создать"

  Widget bottomSheetWidget(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Padding(
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
                backgroundColor:
                    MaterialStateProperty.all<Color>(ColorPalette.greenColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Labels.create,
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
                  'Ивановская площадь — площадь в Московском Кремле, одна из древнейших площадей Москвы. Возникла после постройки в 1329 году каменной церкви Иоанна Лествичника, «что под колоколы», которая разделила ранее единую городскую площадь на две части. Её восточная часть по Иоанновской церкви стала позднее именоваться Ивановской, западная — Соборной площадью. В XIV—XV веках южную и восточную стороны площади занимали дворы удельных князей Московского дома.',
                  TypePlace.park,
                ),
              );
              print('Это кнопка "Создать" размер массива ${mocks.length}');
            },
          ),
        ),
      ),
    );
  }
}
