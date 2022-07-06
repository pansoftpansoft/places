import 'package:flutter/material.dart';
import 'package:places/data/interactor/search_screen_model.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/search_places_screen/widgets/search_places_screen_body_switch.dart';
import 'package:places/ui/screen/widgets/bottom_navigation/bottom_navigation.dart';
import 'package:places/ui/screen/widgets/search_bar.dart';
import 'package:places/ui/screen/widgets/title_app_big_or_small.dart';



///Окно поиска мест
class SearchPlacesScreen extends StatefulWidget {
  ///
  const SearchPlacesScreen({final Key? key}) : super(key: key);

  @override
  SearchPlacesScreenState createState() => SearchPlacesScreenState();
}

///
class SearchPlacesScreenState extends State<SearchPlacesScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) => Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(110),
          child: AppBar(
            iconTheme: IconThemeData(
              color: Theme.of(context).iconTheme.color,
            ),
            toolbarHeight: double.infinity,
            centerTitle: false,
            elevation: 0,
            title: const TitleAppBigOrSmall(small: true),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  paddingPage,
                  0,
                  paddingPage,
                  paddingPage,
                ),
                child: Stack(
                  children: <Widget>[
                    SearchBar(
                      textEditingController:
                          SearchScreenModel.textEditingControllerFind,
                      autofocus: true,
                      focusNode: FocusNode(),
                    ),
                  ],
                ),
              ),
            ),
          ),
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
