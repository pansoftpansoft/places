import 'package:flutter/material.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/screen/add_place_screen/widgets/add_place_screen_body_button_map.dart';
import 'package:places/ui/screen/add_place_screen/widgets/add_place_screen_body_field_description.dart';
import 'package:places/ui/screen/add_place_screen/widgets/add_place_screen_body_field_name.dart';
import 'package:places/ui/screen/add_place_screen/widgets/add_place_screen_body_head_lat_lon.dart';
import 'package:places/ui/screen/add_place_screen/widgets/divider_opacity.dart';
import 'package:places/ui/screen/add_place_screen/widgets/list_view_photo_add.dart';
import 'package:places/ui/screen/add_place_screen/widgets/row_text_field_lat_and_lon.dart';
import 'package:places/ui/screen/add_place_screen/widgets/title_field.dart';
import 'package:places/ui/screen/select_category/widgets/select_type_place.dart';
import 'package:places/ui/screen/widgets/sized_box_12.dart';
import 'package:places/ui/screen/widgets/sized_box_24.dart';
import 'package:places/ui/screen/widgets/sized_box_48.dart';

class AddPlaceScreenBody extends StatelessWidget {
  final TextEditingController _textEditingControllerNamePlace;
  final FocusNode _focusNodeNamePlace;
  final FocusNode _focusNodeLat;
  final TextEditingController _textEditingControllerLat;
  final FocusNode _focusNodeLon;
  final TextEditingController _textEditingControllerLon;
  final FocusNode _focusNodeDescription;
  final TextEditingController _textEditingControllerDescription;

  const AddPlaceScreenBody({
    Key? key,
    required TextEditingController textEditingControllerNamePlace,
    required FocusNode focusNodeNamePlace,
    required FocusNode focusNodeLat,
    required TextEditingController textEditingControllerLat,
    required FocusNode focusNodeLon,
    required TextEditingController textEditingControllerLon,
    required FocusNode focusNodeDescription,
    required TextEditingController textEditingControllerDescription,
  })  : _textEditingControllerNamePlace = textEditingControllerNamePlace,
        _focusNodeNamePlace = focusNodeNamePlace,
        _focusNodeLat = focusNodeLat,
        _textEditingControllerLat = textEditingControllerLat,
        _focusNodeLon = focusNodeLon,
        _textEditingControllerLon = textEditingControllerLon,
        _focusNodeDescription = focusNodeDescription,
        _textEditingControllerDescription = textEditingControllerDescription,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const ListViewPhotoAdd(),
        // Заголовок 'Ктегория'
        const TitleField(categories),
        // Кнопка выбора категории
        const SelectTypePlace(),
        //Дивайдер
        const DividerOpacity(),
        // Разделитель
        const SizedBox24(),
        // Заголовок "Название"
        const TitleField(namePlace),
        // Поле ввода "Название"
        const SizedBox12(),
        AddPlaceScreenBodyFieldName(
          textEditingControllerNamePlace: _textEditingControllerNamePlace,
          focusNodeNamePlace: _focusNodeNamePlace,
          focusNodeLat: _focusNodeLat,
        ),
        //Загаловки "Широта" и "Долгота
        const SizedBox24(),
        const AddPlaceScreenBodyHeadLatLon(),
        // Поля ввода широты и долготы
        const SizedBox12(),
        RowTextFieldLatAndLon(
          textEditingControllerLat: _textEditingControllerLat,
          focusNodeLat: _focusNodeLat,
          focusNodeLon: _focusNodeLon,
          textEditingControllerLon: _textEditingControllerLon,
          focusNodeDescription: _focusNodeDescription,
        ),
        // Кнопка "Указать на карте"
        const AddPlaceScreenBodyButtonMap(),
        // Разделитель
        const SizedBox24(),
        //Заголовок "Описание"
        const TitleField(description),
        const SizedBox12(),
        // Разделитель
        AddPlaceScreenBodyFieldDescription(
          textEditingControllerDescription: _textEditingControllerDescription,
          focusNodeDescription: _focusNodeDescription,
        ),
        // Добавлен, чтобы не закрывала нижняя кнопка
        const SizedBox48(),
      ],
    );
  }
}
