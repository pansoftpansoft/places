import 'package:flutter/material.dart';
import 'package:places/ui/screen/filters_screen/widgets/app_bar_title.dart';
import 'package:places/ui/screen/filters_screen/widgets/button_show.dart';
import 'package:places/ui/screen/filters_screen/widgets/filters_screen_body.dart';

///Экран фильтров
class FiltersScreen extends StatelessWidget {
  ///Конструктор
  const FiltersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: const AppBarTitle(),
      ),
      bottomSheet: const ButtonShow(),
      body: const FiltersScreenBody(),
    );
  }
}
