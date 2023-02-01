import 'package:flutter/material.dart';
import 'package:places/data/interactor/search_screen_interactor.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/widgets/search_bar.dart';
import 'package:places/ui/screen/widgets/title_app_big_or_small.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
                    SearchScreenInteractor.textEditingControllerFind,
                autofocus: true,
                focusNode: FocusNode(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
