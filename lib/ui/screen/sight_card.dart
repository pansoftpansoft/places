import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/theme/color_palette.dart';
import 'package:places/ui/theme/font_collection.dart';
import 'package:places/ui/theme/labels.dart';

//Карточка из списка достопримечательностей
class SightCard extends StatelessWidget {
  final Sight sight;

  SightCard(this.sight, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      color: ColorPalette.cardColor,
      shadowColor: Colors.blueGrey,
      elevation: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: AspectRatio(
              aspectRatio: 3 / 2,
              child: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 16,
                    top: 16,
                    child: Text(
                      sight.type,
                      style: FontCollection.fontWhiteColor14h18w700,
                    ),
                  ),
                  Positioned(
                    right: 18,
                    top: 19,
                    child: Container(
                      width: 20,
                      height: 18,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints.tightFor(
                      width: MediaQuery.of(context).size.width / 2 - 16 * 2),
                  child: Text(
                    sight.name,
                    maxLines: 5,
                    style: FontCollection.fontBasicColor16h20w500,
                  ),
                ),
                Text(
                  Labels.shortDescription,
                  style: FontCollection.fontBasicColorLight14h18w400,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16)
        ],
      ),
    );
  }
}
