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
          child: Text(
            'Список\nинтересных мест',
            style: const TextStyle(
              color: Color(0xFF3B3E5B),
              fontSize: 32,
              fontWeight: FontWeight.w700,
              height: 1.11,
            ),
          ),
        ),
      ),
    );
  }
}
