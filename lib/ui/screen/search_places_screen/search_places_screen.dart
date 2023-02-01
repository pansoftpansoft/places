import 'package:flutter/material.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/search_places_screen/widgets/app_bar_widget.dart';
import 'package:places/ui/screen/search_places_screen/widgets/search_places_screen_body_switch.dart';
import 'package:places/ui/screen/widgets/bottom_navigation/bottom_navigation.dart';

///Окно поиска мест
class SearchPlacesScreen extends StatelessWidget {
  ///
  const SearchPlacesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(110),
        child: AppBarWidget(),
      ),
      bottomNavigationBar: BottomNavigation(0),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: paddingPage,
        ),
        child: SearchPlacesScreenBodySwitch(),
      ),
    );
  }
}
