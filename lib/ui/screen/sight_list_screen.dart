import 'package:flutter/material.dart';
import 'package:places/ui/screen/sight_card.dart';

import '../../mocks.dart';

class SightListScreen extends StatefulWidget {
  const SightListScreen({Key key}) : super(key: key);

  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(128.0),
          child: AppBar(
            toolbarHeight:120,
            centerTitle: false,
            elevation: 0,
            backgroundColor: Colors.white,
            title: Column(
              children: [
                SizedBox(
                  height: 40,),
                  Container(
                    width: double.infinity,
                    child: RichText(
                      maxLines: 2,
                      text: const TextSpan(
                          text: 'С',
                          style: const TextStyle(
                            color: Color(0xFF4CAF50),
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                            height: 1.11,
                          ),
                          children: [
                            const TextSpan(
                                text: 'писок\n',
                                style: TextStyle(
                                  color: Color(0xFF3B3E5B),
                                ),
                                children: [
                                  const TextSpan(
                                      text: 'и',
                                      style: const TextStyle(
                                        color: Color(0xFFFCDD3D),
                                      ),
                                      children: [
                                        const TextSpan(
                                          text: 'нтересных мест',
                                          style: const TextStyle(
                                            color: Color(0xFF3B3E5B),
                                          ),
                                        ),
                                      ]),
                                ]),
                          ]),
                    ),
                  ),

              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 0),
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
        ));
  }
}
