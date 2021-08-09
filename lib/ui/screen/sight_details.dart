import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';

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
                          height: 30,
                          width: 30,
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
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF3B3E5B),
                    height: 1.20,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      sight.type,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF3B3E5B),
                        height: 1.40,
                      ),
                    ),
                    SizedBox(width: 16),
                    const Text(
                      'закрыто до 09:00',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF7C7E92),
                        height: 1.40,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Text(
                  sight.details,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF3B3E5B),
                    height: 1.29,
                  ),
                ),
                SizedBox(height: 24),
                ConstrainedBox(
                  constraints: BoxConstraints.tightFor(height: 48),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0xFF4CAF50)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.gesture_outlined),
                        Text(
                          'ПОСТРОИТЬ МАРШРУТ',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFFFFFFFF),
                            height: 1.29,
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {},
                  ),
                ),
                SizedBox(height: 24),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: null,
                        child: Row(
                          children: [
                            const Icon(
                              Icons.calendar_today_outlined,
                              color: Color(0xFF7C7E92),
                            ),
                            SizedBox(width: 9),
                            const Text(
                              'Запланировать',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF7C7E92),
                                height: 1.29,
                              ),
                            ),
                          ],
                        )),
                    TextButton(
                        onPressed: null,
                        child: Row(
                          children: [
                            const Icon(
                              Icons.favorite_border,
                              color: Color(0xFF3B3E5B),
                              size: 30,
                            ),
                            SizedBox(width: 10),
                            const Text(
                              'В избранное',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF3B3E5B),
                                height: 1.29,
                              ),
                            ),
                          ],
                        ))
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
