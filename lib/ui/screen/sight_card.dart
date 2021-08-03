import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';

class SightCard extends StatelessWidget {
  final Sight sight;

  SightCard(this.sight, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      color: Color(0xFFF5F5F5),
      shadowColor: Colors.blueGrey,
      elevation: 0,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Stack(children: [
          Container(
            height: 96,
            width: double.infinity,

            decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(16),topRight: Radius.circular(16))),
          ),
          Positioned(
              left: 16,
              top: 16,
              child: Text(
                sight.type,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF7C7E92),
                  height: 1,
                ),
              )),
          Positioned(
            right: 18,
            top: 19,
            child: Container(
              width: 20,
              height: 18,
              color: Colors.green,
            ),
          ),
        ]),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                sight.name,
                maxLines: 3,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF3B3E5B),
                  height: 1.25,
                ),
              ),
              Text(
                'краткое описание',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF7C7E92),
                  height: 1.29,
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
