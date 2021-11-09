import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/sight_search_screen/models/search_filter_model.dart';
import 'package:places/ui/screen/sight_search_screen/widgets/empty_screen.dart';
import 'package:places/ui/screen/sight_search_screen/widgets/list_of_found_places_screen.dart';
import 'package:places/ui/screen/sight_search_screen/widgets/load_screen.dart';
import 'package:places/ui/screen/widgets/bottom_navigation.dart';
import 'package:places/ui/screen/widgets/search_bar.dart';
import 'package:places/ui/screen/widgets/search_history_list.dart';
import 'package:places/ui/screen/widgets/title_app.dart';
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
        final SearchFilterModel searchFilterModel =
            context.read<SearchFilterModel>();
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
        bottomNavigationBar: BottomNavigationList(0),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: paddingPage,
          ),
          child: Consumer<SearchFilterModel>(
            builder: (
              final BuildContext context,
              final SearchFilterModel cart,
              final Widget? child,
            ) {
              switch (SearchFilterModel.selectedScreen) {
                case ScreenEnum.loadScreen:
                  return const LoadScreen();
                case ScreenEnum.emptyScreen:
                  return EmptyScreen(
                    textHeader: nothingWasFound,
                    textComment: tryChangingTheSearchParameter,
                    svgIcon: SvgIcons.search,
                    colorTextAll: ColorPalette.dmFontSubtitle2,
                  );
                case ScreenEnum.listOfFoundPlacesScreen:
                  return const ListOfFoundPlacesScreen();
                case ScreenEnum.historyListScreen:
                  return const HistoryListScreen();
                case ScreenEnum.errorScreen:
                  return EmptyScreen(
                    textHeader: 'Ошибка загрузки данных',
                    textComment: tryAgain,
                    svgIcon: SvgIcons.delete,
                  );
                default:
                  return EmptyScreen(
                    textHeader: unknownError,
                    textComment: tryAgain,
                    svgIcon: SvgIcons.delete,
                  );
              }
            },
          ),
        ),
      );
}
