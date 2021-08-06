import 'package:flutter/material.dart';
import 'package:places/ui/screen/sight_details.dart';
import 'package:places/ui/screen/sight_list_screen.dart';
import 'package:flutter/services.dart';

import 'mocks.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Задача  4.2-1',
      //home: SightListScreen(),
      home: SightDetails(mocks[1]),
    );
  }
}

class MyApp1 extends StatelessWidget {
  MyApp1({
    Key key,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: MyFirstWidgetFull(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

//---------------Задание 3.6-4
class MyFirstWidget extends StatelessWidget {
  MyFirstWidget({Key key}) : super(key: key);

  static int  countColl = 0;

  @override
  Widget build(BuildContext context) {
    //print('Текуший контекст: ${getContext()}');

    //countColl += 1;
    print(countColl);
    return Container(
      child: const Center(
        child: const Text('Hello!'),
      ),
    );
  }
}

class MyFirstWidgetFull extends StatefulWidget {
  MyFirstWidgetFull({Key key}) : super(key: key);

  @override
  _MyFirstWidgetFullState createState() => _MyFirstWidgetFullState();
}

class _MyFirstWidgetFullState extends State<MyFirstWidgetFull> {
  int countColl = 0;

  String getContext() {
    return context.runtimeType.toString();
  }

  @override
  Widget build(BuildContext context) {
    print('Текуший контекст: ${getContext()}');
    countColl += 1;
    print(countColl);
    return Container(
      child: const Center(
        child: const Text('Hello!'),
      ),
    );
  }
}
//-----------------------------------------------------------
