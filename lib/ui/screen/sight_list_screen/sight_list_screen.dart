import 'package:flutter/material.dart';
import 'package:places/ui/screen/sight_list_screen/models/sight_list_screen_model.dart';
import 'package:places/ui/screen/sight_list_screen/widgets/floating_button.dart';
import 'package:places/ui/screen/sight_list_screen/widgets/sight_list_screen_state_body.dart';
import 'package:places/ui/screen/widgets/bottom_navigation/bottom_navigation.dart';
import 'package:provider/provider.dart';

///Список достопримечательностей
class SightListScreen extends StatefulWidget {
  ///Конструктор
  const SightListScreen({final Key? key}) : super(key: key);

  @override
  SightListScreenState createState() => SightListScreenState();
}

///
class SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(final BuildContext context) => Consumer<SightListScreenModel>(
        builder: (
          final context,
          final sight,
          final child,
        ) =>
            Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: const FloatingButton(),
          bottomNavigationBar: BottomNavigation(0),
          body: const SightListScreenStateBody(),
        ),
      );
}
