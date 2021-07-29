import 'package:flutter/material.dart';
import 'package:places/ui/screen/sight_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Задача  4.2-1',
      home: SightListScreen(),
    );
  }
}

class MyApp1 extends StatelessWidget {
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
            Text(
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
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

//---------------Задание 3.6-4
class MyFirstWidget extends StatelessWidget {
  MyFirstWidget({Key key}) : super(key: key);

  int countColl = 0;

  //String getContext() {
  //  return context.runtimeType.toString();
  //}

  @override
  Widget build(BuildContext context) {

    //print('Текуший контекст: ${getContext()}');

    countColl += 1;
    print(countColl);
    return Container(
      child: Center(
        child: Text('Hello!'),
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
      child: Center(
        child: Text('Hello!'),
      ),
    );
  }
}
//-----------------------------------------------------------
