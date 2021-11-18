import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/add_sight_screen/widgets/app_bar_add_sight.dart';
import 'package:places/ui/screen/add_sight_screen/widgets/bottom_sheet_create_button.dart';
import 'package:places/ui/screen/add_sight_screen/widgets/divider_opacity.dart';
import 'package:places/ui/screen/add_sight_screen/widgets/list_view_photo_add.dart';
import 'package:places/ui/screen/add_sight_screen/widgets/photo_show_dialog.dart';
import 'package:places/ui/screen/add_sight_screen/widgets/row_text_field_lat_and_lon.dart';
import 'package:places/ui/screen/add_sight_screen/widgets/select_type_place.dart';
import 'package:places/ui/screen/add_sight_screen/widgets/title_field.dart';
import 'package:places/ui/screen/widgets/text_field_icon/text_field_icon.dart';

///Экран добавления карточек
class AddSightScreen extends StatefulWidget {
  /// Конструктор
  const AddSightScreen({final Key? key}) : super(key: key);

  @override
  FiltersScreenState createState() => FiltersScreenState();
}

/// Стейт
class FiltersScreenState extends State<AddSightScreen> {
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
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future(() {
      showDialog<void>(
        context: context,
        builder: (final context) => const PhotoShowDialog(),
      );
    });
  }

  @override
  Widget build(final BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: true,
        bottomSheet: const BottomSheetCreateButton(),
        appBar: const PreferredSize(
          preferredSize: Size(double.infinity, kToolbarHeight),
          child: AppBarAddSight(),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(paddingPage),
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
                const SelectTypePlace(),
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
                          actionOnSubmitted: (final value) {
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
                  child: RowTextFieldLatAndLon(
                      textEditingControllerLat: _textEditingControllerLat,
                      focusNodeLat: _focusNodeLat,
                      focusNodeLon: _focusNodeLon,
                      textEditingControllerLon: _textEditingControllerLon,
                      focusNodeDescription: _focusNodeDescription,),
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
                      onPressed: () {
                        if (kDebugMode) {
                          print('Нажата кнопка "Указать на карте"');
                        }
                      },
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
                          actionOnSubmitted: (final value) {
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
//Widget selectTypePlace(final BuildContext context) =>
}
