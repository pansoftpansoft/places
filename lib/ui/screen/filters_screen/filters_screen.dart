import 'package:flutter/material.dart';
import 'package:places/type_place.dart';
import 'package:places/ui/screen/filters_screen/widgets/bottom_sheet_button_show.dart';
import 'package:places/ui/screen/filters_screen/widgets/filters_screen_body.dart';
import 'package:places/ui/screen/filters_screen/widgets/title_filter.dart';
import 'package:places/ui/screen/sight_search_screen/models/search_filter_model.dart';
import 'package:provider/provider.dart';

///Экран фильтров
class FiltersScreen extends StatelessWidget {
  ///Конструктор
  const FiltersScreen({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {

    //Сохраняем настройки фильтра на случай выхода бех применения фильтра
    context.read<SearchFilterModel>().getFilterSettings();

    context.read<SearchFilterModel>().setFilteredPlaces();

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const TitleFilter(),
      ),
      bottomSheet: const BottomSheetButtonShow(),
      body: const FiltersScreenBody(),
    );
  }

  ///Установка выделения нажатой кнопки фильтра
  static void setButtonSelect(
    final BuildContext context,
    final TypePlace nameKey,
  ) {

    context.read<SearchFilterModel>().setTypePlaceSelected(nameKey);
    setFilter(context);
  }

  ///Установка фильтра
  static void setFilter(final BuildContext context) {
    context.read<SearchFilterModel>().countFilteredPlacesSet();
  }
}
