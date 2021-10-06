import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/add_sight_screen/widgets/app_bar_add_sight.dart';
import 'package:places/ui/screen/add_sight_screen/widgets/bottom_sheet_widget.dart';
import 'package:places/ui/screen/add_sight_screen/widgets/divider_opacity.dart';
import 'package:places/ui/screen/add_sight_screen/widgets/list_view_photo_add.dart';
import 'package:places/ui/screen/add_sight_screen/widgets/select_category.dart';
import 'package:places/ui/screen/add_sight_screen/widgets/title_field.dart';
import 'package:places/ui/screen/widgets/text_field_icon.dart';

//Экран добавления карточек
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
      bottomSheet: BottomSheetWidget(context: context),
      appBar: const PreferredSize(
          preferredSize: Size(double.infinity, kToolbarHeight),
          child: AppBarAddSight()),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.paddingPage),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 72,
                width: double.infinity,
                child: Row(
                  children: [
                    const ListViewPhotoAdd(),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              // Заголовок 'Ктегория'
              const TitleField(Labels.categories),
              // Разделитель
              const SizedBox(height: 12),
              // Кнопка выбора категории
              SelectTypePlace(context),
              //Дивайдер
              const DividerOpacity(),
              // Разделитель
              const SizedBox(height: 24),
              // Заголовок "Название"
              const TitleField(Labels.namePlace),
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
                  const Expanded(
                    child: TitleField(Labels.lat),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  const Expanded(
                    child: TitleField(
                      Labels.lon,
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
                  const TitleField(
                    Labels.description,
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

  //Выбор категории
  Widget SelectTypePlace(BuildContext context) {
    return SizedBox(
      height: 32,
      child: TextButton(
        style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero)),
        onPressed: () async {
          typePlaceSelected = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  SelectCategory(typePlaceSelectedActual: typePlaceSelected),
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
                  : Labels.TypePlaceString(typePlaceSelected as TypePlace),
              style:
                  Theme.of(context).textTheme.subtitle2!.copyWith(fontSize: 16),
            ),
            SvgPicture.asset(
              SvgIcons.view,
            ),
          ],
        ),
      ),
    );
  }
}
