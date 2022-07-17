import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/blocs/visiting_screen/visiting_screen_bloc.dart';
import 'package:places/ui/res/img.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/visiting_screen/widgets/app_bar_visiting.dart';
import 'package:places/ui/screen/visiting_screen/widgets/tab1_widget.dart';
import 'package:places/ui/screen/visiting_screen/widgets/tab2_widget.dart';
import 'package:places/ui/screen/widgets/bottom_navigation/bottom_navigation.dart';

///Окно в котором можно выбрать
///места которые хочешь посетить и которые уже посетил
class VisitingScreen extends StatefulWidget {
  ///
  const VisitingScreen({Key? key}) : super(key: key);

  @override
  _VisitingScreenState createState() => _VisitingScreenState();
}

///
class _VisitingScreenState extends State<VisitingScreen> {
  @override
  void initState() {
    super.initState();

    debugPrint(' 1111= ${11111}');
    //context.read<VisitingScreenBloc>().state=VisitingScreenLoadInSuccess();
    context.read<VisitingScreenBloc>().add(VisitingScreenLoad());
  }

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(120),
            child: AppBarVisiting(),
          ),
          bottomNavigationBar: BottomNavigation(2),
          body: Padding(
            padding: const EdgeInsets.all(paddingPage),
            child: TabBarView(
              children: <Widget>[
                BlocBuilder<VisitingScreenBloc, VisitingScreenState>(
                  builder: (context, state) {
                    if (state is VisitingScreenLoadInSuccess) {
                      return Tab1Widget();
                    }

                    return Padding(
                      padding: const EdgeInsets.only(
                        top: heightSizeBox12,
                        bottom: iconSize29,
                      ),
                      child: Image.asset(
                        ellipse107,
                        height: iconSize29,
                        width: iconSize29,
                      ),
                    );
                  },
                ),
                const Tab2Widget(),
              ],
            ),
          ),
        ),
      );
}
