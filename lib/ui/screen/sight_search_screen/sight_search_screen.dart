import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/Widgets/bottom_navigation.dart';
import 'package:places/ui/screen/sight_search_screen/models/search_filter_model.dart';
import 'package:places/ui/screen/sight_search_screen/widgets/sight_card_for_search.dart';
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
    final Future<void> f1 = SearchFilterModel.getListHistory();
    f1.then((final _) {
      final SearchFilterModel searchFilterModel =
          context.read<SearchFilterModel>();
      if (SearchFilterModel.listHistory.isNotEmpty) {
        searchFilterModel.managerSelectionScreen(
          numberScreen: ScreenEnum.historyListScreen,
        );
      } else {
        searchFilterModel.managerSelectionScreen();
      }
      setState(() {});
    });
  }

  @override
  Widget build(final BuildContext context) => Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(170),
          child: AppBar(
            toolbarHeight: double.infinity,
            centerTitle: false,
            elevation: 0,
            title: const TitleAppBigOrSmall(),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  Sizes.paddingPage,
                  0,
                  Sizes.paddingPage,
                  Sizes.paddingPage,
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
        bottomNavigationBar: BottomNavigation(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.paddingPage,
          ),
          child: Consumer<SearchFilterModel>(
            builder: (
              final BuildContext context,
              final SearchFilterModel cart,
              final Widget? child,
            ) {
              switch (SearchFilterModel.selectedScreen) {
                case ScreenEnum.loadScreen:
                  return loadScreen();
                case ScreenEnum.emptyScreen:
                  return emptyScreen(
                    textHeader: nothingWasFound,
                    textComment: tryChangingTheSearchParameter,
                    svgIcon: SvgIcons.search,
                    colorTextAll: ColorPalette.dmFontSubtitle2,
                  );
                case ScreenEnum.listOfFoundPlacesScreen:
                  return listOfFoundPlacesScreen();
                case ScreenEnum.historyListScreen:
                  return const HistoryListScreen();
                case ScreenEnum.errorScreen:
                  return emptyScreen(
                    textHeader: 'Ошибка загрузки данных',
                    textComment: tryAgain,
                    svgIcon: SvgIcons.delete,
                  );
                default:
                  return emptyScreen(
                    textHeader: unknownError,
                    textComment: tryAgain,
                    svgIcon: SvgIcons.delete,
                  );
              }
            },
          ),
        ),
      );

  ///Список найденых мест
  Widget listOfFoundPlacesScreen() => ListView.separated(
        itemCount: mocksSearch.length,
        shrinkWrap: true,
        itemBuilder: (final BuildContext context, final int index) =>
            SightCardSearch(mocksSearch[index]),
        separatorBuilder: (
          final BuildContext context,
          final int index,
        ) =>
            const Padding(
          padding: EdgeInsets.fromLTRB(
            56 + Sizes.paddingPage,
            0,
            0,
            0,
          ),
          child: Divider(
            height: 0.8,
          ),
        ),
      );

  ///Пустой экран
  Widget emptyScreen({
    final String textHeader = '',
    final String textComment = '',
    final String svgIcon = '',
    final Color colorTextAll = Colors.red,
  }) =>
      Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              svgIcon,
              width: 60,
              color: colorTextAll,
            ),
            Text(
              textHeader,
              style: TextStyle(color: colorTextAll, fontSize: 18),
            ),
            Text(
              textComment,
              style: TextStyle(color: colorTextAll, fontSize: 14),
            ),
          ],
        ),
      );

  ///экран лоадера
  Widget loadScreen() => Container(
        alignment: Alignment.center,
        child: const CircularProgressIndicator(),
      );
}
