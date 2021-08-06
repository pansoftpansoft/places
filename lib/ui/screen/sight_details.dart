import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/theme/color_palette.dart';
import 'package:places/ui/theme/font_collection.dart';
import 'package:places/ui/theme/labels.dart';

//Подробно о достопримечательности
class SightDetails extends StatelessWidget {
  final Sight sight;

  const SightDetails(this.sight, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 360,
            width: double.infinity,
            color: Colors.green,
            child: Image.network(
              sight.url,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, progress) {
                return progress == null
                    ? child
                    : const UnconstrainedBox(
                        child: const SizedBox(
                          height: 40,
                          width: 40,
                          child: const CircularProgressIndicator(),
                        ),
                      );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sight.name,
                  style: FontCollection.fontBasicColor24h29w700,
                ),
                Row(
                  children: [
                    Text(
                      sight.type,
                      style: FontCollection.fontBasicColor14h18w700,
                    ),
                    const SizedBox(width: 16),
                    Text(
                      'закрыто до 09:00',
                      style: FontCollection.fontBasicColorLight14h18w400,
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Text(
                  sight.details,
                  style: FontCollection.fontBasicColor14h18w400,
                ),
                const SizedBox(height: 24),
                ConstrainedBox(
                  constraints: const BoxConstraints.tightFor(height: 48),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            ColorPalette.buttonColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.gesture_outlined),
                        Text(
                          Labels.buildRoute,
                          style: FontCollection.fontWhiteColor14h18w700,
                        ),
                      ],
                    ),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(height: 24),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.calendar_today_outlined,
                            color: ColorPalette.fontBasicColorLight,
                          ),
                          const SizedBox(width: 9),
                          Text(
                            Labels.schedule,
                            style: FontCollection.fontBasicColorLight14h18w400,
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.favorite_border,
                            color: ColorPalette.fontBasicColor,
                            size: 30,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            Labels.addToFavorites,
                            style: FontCollection.fontBasicColor14h18w400,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
