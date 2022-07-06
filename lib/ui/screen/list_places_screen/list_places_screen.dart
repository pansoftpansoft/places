import 'package:flutter/material.dart';
import 'package:places/data/interactor/list_places_screen_interactor.dart';
import 'package:places/ui/screen/list_places_screen/widgets/floating_button.dart';
import 'package:places/ui/screen/list_places_screen/widgets/list_places_screen_landscape.dart';
import 'package:places/ui/screen/list_places_screen/widgets/list_places_screen_portrait.dart';
import 'package:places/ui/screen/widgets/bottom_navigation/bottom_navigation.dart';
import 'package:provider/provider.dart';

///Список достопримечательностей
class ListPlacesScreen extends StatefulWidget {
  ///Конструктор
  const ListPlacesScreen({final Key? key}) : super(key: key);

  @override
  ListPlacesScreenState createState() => ListPlacesScreenState();
}

///
class ListPlacesScreenState extends State<ListPlacesScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ListPlacesScreenInteractor>().load();
  }

  @override
  Widget build(BuildContext context) => OrientationBuilder(
        builder: (
          context,
          orientation,
        ) {
          return Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: orientation == Orientation.portrait
                ? const FloatingButton()
                : null,
            bottomNavigationBar: orientation == Orientation.portrait
                ? BottomNavigation(0)
                : null,
            body: orientation == Orientation.portrait
                ? const ListPlacesScreenPortrait()
                : const ListPlacesScreenLandscape(),
          );
        },
      );

  @override
  void dispose() {
    context.read<ListPlacesScreenInteractor>().closeStream();
    super.dispose();
  }
}
