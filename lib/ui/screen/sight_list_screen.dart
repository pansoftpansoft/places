import 'package:flutter/material.dart';

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
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        toolbarHeight: 154,
        backgroundColor: Colors.white,
        title: Container(
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
      ),
    );
  }
}
