import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/models/search_filter_model.dart';
import 'package:places/ui/screen/sight_card_for_search.dart';
import 'package:places/ui/screen/widgets/search_history_list.dart';
import 'package:places/ui/screen/widgets/title_app.dart';
import 'package:places/ui/screen/Widgets/bottom_navigation.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screen/widgets/search_bar.dart';
import 'package:provider/provider.dart';

/*
Окно поиска мест
*/
class SightSearchScreen extends StatefulWidget {
  const SightSearchScreen({Key? key}) : super(key: key);

  @override
  _SightSearchScreenState createState() => _SightSearchScreenState();
}

class _SightSearchScreenState extends State<SightSearchScreen> {
  int countHistory=0;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    SearchFilterModel.textEditingControllerFind.clear();
    Future<void> f1 =  SearchFilterModel.getListHistory();
    f1.then((_) {
      var searchFilterModel = context.read<SearchFilterModel>();
      if (SearchFilterModel.listHistory.length>0){
        searchFilterModel.ManagerSelectionScreen(
            numberScreen: ScreenEnum.historyListScreen);
      }else{
        searchFilterModel.ManagerSelectionScreen();
      }
      setState(() {});
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(170.0),
        child: AppBar(
          toolbarHeight: double.infinity,
          centerTitle: false,
          elevation: 0,
          title: const TitleApp(),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                  Sizes.paddingPage, 0, Sizes.paddingPage, Sizes.paddingPage),
              child: Stack(
                children: [
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
            horizontal: Sizes.paddingPage, vertical: 0),
        child: Consumer<SearchFilterModel>(
          builder: (context, cart, child) {
            switch (SearchFilterModel.selectedScreen) {
              case ScreenEnum.loadScreen:
                return LoadScreen();
              case ScreenEnum.emptyScreen:
                return EmptyScreen(
                    textHeader: Labels.nothingWasFound,
                    textComment: Labels.tryChangingTheSearchParameter,
                    svgIcon: SvgIcons.search,
                    colorTextAll: ColorPalette.dmFontSubtitle2);
              case ScreenEnum.listOfFoundPlacesScreen:
                return ListOfFoundPlacesScreen();
              case ScreenEnum.historyListScreen:
                return const HistoryListScreen();
              case ScreenEnum.errorScreen:
                return EmptyScreen(
                    textHeader: 'Ошибка загрузки данных',
                    textComment: Labels.tryAgain,
                    svgIcon: SvgIcons.delete,
                    colorTextAll: Colors.red);
              default:
                return EmptyScreen(
                    textHeader: Labels.unknownError,
                    textComment: Labels.tryAgain,
                    svgIcon: SvgIcons.delete,
                    colorTextAll: Colors.red);
            }
          },
        ),
      ),
    );
  }

  //Список найденых мест
  Widget ListOfFoundPlacesScreen() {
    return ListView.separated(
      itemCount: mocksSearch.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return SightCardSearch(mocksSearch[index]);
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Padding(
          padding: const EdgeInsets.fromLTRB(56 + Sizes.paddingPage, 0, 0, 0),
          child: Divider(
            height: 0.8,
          ),
        );
      },
    );
  }

  //Пустой экран
  Widget EmptyScreen(
      {String textHeader = '',
      String textComment = '',
      String svgIcon = '',
      Color colorTextAll = Colors.red}) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
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
  }

  //экран лоадера
  Widget LoadScreen() {
    return Container(
      alignment: Alignment.center,
      child: const CircularProgressIndicator(),
    );
  }
}
