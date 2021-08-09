import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/theme/color_palette.dart';
import 'package:places/ui/theme/font_collection.dart';
import 'package:places/ui/theme/labels.dart';

//Карточка из списка достопримечательностей
class SightCard extends StatelessWidget {
  final Sight sight;
  final String goNeed;
  final String goal;

  SightCard(
    this.sight, {
    Key key,
    this.goNeed = '',
    this.goal = '',
  }) : super(key: key);

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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(
            children: [
              Container(
                height: 96,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(16),
                      topLeft: Radius.circular(16)),
                  child: Image.network(
                    sight.url,
                    fit: BoxFit.fitWidth,
                    loadingBuilder: (context, child, progress) {
                      return progress == null
                          ? child
                          : const UnconstrainedBox(
                              child: const SizedBox(
                                height: 10,
                                width: 10,
                                child: const CircularProgressIndicator(),
                              ),
                            );
                    },
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
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sight.name,
                  maxLines: 5,
                  style: FontCollection.fontBasicColor16h20w500,
                ),
                goNeed != '' && goal == ''
                    ? Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          goNeed,
                          maxLines: 5,
                          style: FontCollection.greenColor14h18w400,
                        ),
                      )
                    : const SizedBox(
                        height: 0,
                      ),
                goNeed == '' && goal != ''
                    ? Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          goal,
                          maxLines: 5,
                          style: FontCollection.fontBasicColor14h18w400,
                        ),
                      )
                    : const SizedBox(
                        height: 0,
                      ),
                Text(
                  Labels.shortDescription,
                  style: FontCollection.fontBasicColorLight14h18w400,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16)
        ]));
  }
}
