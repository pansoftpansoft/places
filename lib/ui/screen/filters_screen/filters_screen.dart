import 'package:flutter/material.dart';
import 'package:places/ui/screen/filters_screen/model/filters_screen_model.dart';
import 'package:places/ui/screen/filters_screen/widgets/app_bar_title.dart';
import 'package:places/ui/screen/filters_screen/widgets/bottom_sheet_button_show.dart';
import 'package:places/ui/screen/filters_screen/widgets/filters_screen_body.dart';
import 'package:provider/provider.dart';

///Экран фильтров
class FiltersScreen extends StatelessWidget {
  ///Конструктор
  const FiltersScreen({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    context.read<FiltersScreenModel>().getDataFromRepository();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: const AppBarTitle(),
      ),
      bottomSheet: const BottomSheetButtonShow(),
      body: const FiltersScreenBody(),
    );
  }
}
