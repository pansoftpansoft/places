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

///Экран добавления карточек
class AddSightScreen extends StatefulWidget {
  /// Конструктор
  const AddSightScreen({final Key? key}) : super(key: key);

  @override
  FiltersScreenState createState() => FiltersScreenState();
}

/// Стейт
class FiltersScreenState extends State<AddSightScreen> {
  TypePlace? _typePlaceSelected;
  final FocusNode _focusNodeNamePlace = FocusNode();
  final FocusNode _focusNodeLat = FocusNode();
  final FocusNode _focusNodeLon = FocusNode();
  final FocusNode _focusNodeDescription = FocusNode();

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
    super.initState();
  }

  @override
  Widget build(final BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: true,
        bottomSheet: const BottomSheetWidget(),
        appBar: const PreferredSize(
          preferredSize: Size(double.infinity, kToolbarHeight),
          child: AppBarAddSight(),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(Sizes.paddingPage),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 72,
                  width: double.infinity,
                  child: Row(
                    children: const <Widget>[
                      ListViewPhotoAdd(),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                // Заголовок 'Ктегория'
                const TitleField(categories),
                // Разделитель
                const SizedBox(height: 12),
                // Кнопка выбора категории
                selectTypePlace(context),
                //Дивайдер
                const DividerOpacity(),
                // Разделитель
                const SizedBox(height: 24),
                // Заголовок "Название"
                const TitleField(namePlace),
                // Разделитель
                const SizedBox(height: 12),
                // Поле ввода "Название"
                SizedBox(
                  height: 40,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextFieldIcon(
                          controller: _textEditingControllerNamePlace,
                          focusNode: _focusNodeNamePlace,
                          focusNodeNext: _focusNodeLat,
                          svgIconSuffixForText: SvgIcons.clear,
                          svgIconSuffixForTextColor: Colors.black,
                          borderRadius: 8,
                          actionIconSuffixForText:
                              _textEditingControllerNamePlace.clear,
                          actionOnSubmitted: (final String value) {
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
                  children: const <Widget>[
                    Expanded(
                      child: TitleField(lat),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TitleField(
                        lon,
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
                    children: <Widget>[
                      Expanded(
                        child: TextFieldIcon(
                          controller: _textEditingControllerLat,
                          focusNode: _focusNodeLat,
                          focusNodeNext: _focusNodeLon,
                          keyboardType: TextInputType.number,
                          svgIconSuffixForText: SvgIcons.clear,
                          svgIconSuffixForTextColor: Colors.black,
                          borderRadius: 8,
                          actionIconSuffixForText:
                              _textEditingControllerLat.clear,
                          inputFormatters: <FilteringTextInputFormatter>[
                            FilteringTextInputFormatter.allow(
                              RegExp(r"^\d*?\.?\d*?$"),
                            ),
                          ],
                          actionOnSubmitted: (final String value) {
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
                          borderRadius: 8,
                          actionIconSuffixForText:
                              _textEditingControllerLon.clear,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(
                              RegExp(r"^\d*?\.?\d*?$"),
                            ),
                          ],
                          actionOnSubmitted: (final String value) {
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
                  children: <Widget>[
                    TextButton(
                      style: ButtonStyle(
                        alignment: Alignment.centerLeft,
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.zero,
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        specifyOnMap,
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              fontSize: 16,
                              color: ColorPalette.greenColor,
                            ),
                      ),
                    ),
                  ],
                ),
                // Разделитель
                const SizedBox(height: 24),
                //Заголовок "Описание"
                Row(
                  children: const <Widget>[
                    TitleField(
                      description,
                    ),
                  ],
                ),
                // Разделитель
                const SizedBox(height: 12),
                //Поле ввода описание
                SizedBox(
                  height: 80,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextFieldIcon(
                          controller: _textEditingControllerDescription,
                          focusNode: _focusNodeDescription,
                          svgIconSuffixForText: SvgIcons.clear,
                          svgIconSuffixForTextColor: Colors.black,
                          borderRadius: 8,
                          maxLines: 5,
                          actionIconSuffixForText:
                              _textEditingControllerDescription.clear,
                          actionOnSubmitted: (final String value) {
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

  ///Выбор категории
  Widget selectTypePlace(final BuildContext context) => SizedBox(
        height: 32,
        child: TextButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
          ),
          onPressed: () async {
            _typePlaceSelected = await Navigator.push(
              context,
              MaterialPageRoute<TypePlace>(
                builder: (final BuildContext context) =>
                    SelectCategory(typePlaceSelectedActual: _typePlaceSelected),
              ),
            );
            setState(() {});
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
