import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/sight_search_screen/models/search_filter_model.dart';
import 'package:places/ui/screen/sight_search_screen/widgets/sight_search_screen_body.dart';
import 'package:places/ui/screen/widgets/bottom_navigation/bottom_navigation.dart';
import 'package:places/ui/screen/widgets/search_bar.dart';
import 'package:places/ui/screen/widgets/title_app_big_or_small.dart';
import 'package:provider/provider.dart';

///Окно поиска мест
class SightSearchScreen extends StatefulWidget {
  ///
  const SightSearchScreen({final Key? key}) : super(key: key);

  @override
  SightSearchScreenState createState() => SightSearchScreenState();
}

///
class SightSearchScreenState extends State<SightSearchScreen> {
  ///
  int countHistory = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    SearchFilterModel.textEditingControllerFind.clear();

    SearchFilterModel.getListHistory().then(
      (final _) {
        final searchFilterModel = context.read<SearchFilterModel>();
        if (SearchFilterModel.listHistory.isNotEmpty) {
          searchFilterModel.managerSelectionScreen(
            numberScreen: ScreenEnum.historyListScreen,
          );
        } else {
          context.read<SearchFilterModel>()
            ..countFilteredPlaces()
            ..saveFilterSettings()
            ..changeSearch();
        }
        setState(
          () {
            debugPrint('Установка значений');
          },
        );
      },
    );
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
                          SearchFilterModel.textEditingControllerFind,
                      autofocus: true,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigation(0),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: const SightSearchScreenBody(),
      );
}
