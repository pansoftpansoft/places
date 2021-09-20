import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/models/search_filter_model.dart';
import 'package:provider/provider.dart';


/*
Список историй поиска мест
сораняет текст поиска при нажатии кнопки ентер.
*/
class HistoryListScreen extends StatelessWidget {
  const HistoryListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
      future: SearchFilterModel.getListHistory(),
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(Labels.youLooking,
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    color: ColorPalette.lmFontSubtitle2.withOpacity(0.56))),
            Flexible(child: ListHistory()),
            TextButton(
              style: ButtonStyle(
                  padding:
                      MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero)),
              onPressed: () {
                var _searchFilterModel = context.read<SearchFilterModel>();
                _searchFilterModel.ClearHistory();
              },
              child: Text(
                Labels.clearHistory,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: ColorPalette.greenColor),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget ListHistory() {
    return Consumer<SearchFilterModel>(
      builder: (context, cart, child) {
        return Container(
          child: ListView.separated(
            itemCount: SearchFilterModel.listHistory.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  var _searchFilterModel = context.read<SearchFilterModel>();
                  _searchFilterModel.SearchPlaceForDynamicText(
                    SearchFilterModel.listHistory[index].historyText,
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(SearchFilterModel.listHistory[index].historyText,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(color: ColorPalette.lmFontSubtitle2)),
                    const SizedBox(
                      height: 50,
                    ),
                    InkWell(
                      onTap: () {
                        var _searchFilterModel =
                            context.read<SearchFilterModel>();
                        _searchFilterModel.DeleteHistory(
                            SearchFilterModel.listHistory[index].historyText);
                      },
                      child: SvgPicture.asset(
                        SvgIcons.delete,
                        height: 24,
                        color: ColorPalette.lmFontSubtitle2,
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(
                height: 0.8,
              );
            },
          ),
        );
      },
    );
  }
}
