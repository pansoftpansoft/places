import 'package:flutter/material.dart';
import 'package:places/data/repository/place_repository.dart';
import 'package:places/ui/screen/list_places_screen/widgets/floating_button.dart';
import 'package:places/ui/screen/list_places_screen/widgets/list_places_screen_landscape.dart';
import 'package:places/ui/screen/list_places_screen/widgets/list_places_screen_portrait.dart';
import 'package:places/ui/screen/widgets/bottom_navigation/bottom_navigation.dart';
import 'package:provider/provider.dart';

///Список достопримечательностей
class ListPlacesScreen extends StatefulWidget {
  ///Конструктор
  const ListPlacesScreen({Key? key}) : super(key: key);

  @override
  ListPlacesScreenState createState() => ListPlacesScreenState();
}

///
class ListPlacesScreenState extends State<ListPlacesScreen> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => OrientationBuilder(
        builder: (
          context,
          orientation,
        ) {
          return Provider(
            create: (_)=>PlaceRepository(),
            child: Scaffold(
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
            ),
          );
        },
      );

  @override
  void dispose() {
    super.dispose();
  }
}
