import 'package:flutter/material.dart';
import 'package:places/ui/screen/bottom_navigation.dart';
import 'package:places/ui/screen/sight_card.dart';

import '../../mocks.dart';

//Список достопримечательностей
class SightListScreen extends StatefulWidget {
  const SightListScreen({Key key}) : super(key: key);

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
}
