import 'package:flutter/material.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/screen/Widgets/bottom_navigation.dart';
import 'package:places/ui/screen/add_sight_screen.dart';
import 'package:places/ui/screen/sight_card.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/res/svg_icons.dart';

//Список достопримечательностей
class SightListScreen extends StatefulWidget {
  const SightListScreen({Key? key}) : super(key: key);

  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(128.0),
        child: AppBar(
          toolbarHeight: 120,
          centerTitle: false,
          elevation: 0,
          title: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Container(
                width: double.infinity,
                child: Text(
                  'Список\nинтересных мест',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: floatingActionButton(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
          child: Column(
            children: [
              SightCard(mocks[0]),
              SightCard(mocks[1]),
              SightCard(mocks[2]),
              SightCard(mocks[3]),
              SightCard(mocks[4]),
            ],
          ),
        ),
      ),
    );
  }

  DecoratedBox floatingActionButton(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ColorPalette.greenColorLightGradient,
              ColorPalette.greenColorStrongGradient,
            ],
          ),
          borderRadius: BorderRadius.all(Radius.circular(25))),
      child: FloatingActionButton.extended(
        elevation: 0,
        backgroundColor: Colors.transparent,
        icon: SvgPicture.asset(
          SvgIcons.plus,
        ),
        label: Text(Labels.newPlace.toUpperCase(), style: null),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (context) => AddSightScreen(),
            ),
          );
          setState(() {});
        },
      ),
    );
  }
}
