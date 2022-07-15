import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/blocs/visiting_screen/visiting_screen_bloc.dart';

import 'package:places/data/interactor/visiting_interactor.dart';
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
  VisitingScreenState createState() => VisitingScreenState();
}

///
class VisitingScreenState extends State<VisitingScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 2,
        child: BlocProvider<VisitingScreenBloc>(
          create: (context) =>
              VisitingScreenBloc(context.read<VisitingInteractor>()),
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
                  BlocBuilder<VisitingScreenBloc,VisitingScreenEvent>(
                    builder: (context, state) {
                      return const Tab1Widget();
                    },
                  ),
                  const Tab2Widget(),
                ],
              ),
            ),
          ),
        ),
      );
}
