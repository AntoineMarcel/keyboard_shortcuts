import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keyboard_shortcuts/keyboard_shortcuts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
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
        title: Text('Flutter Demo Home Page'),
        leading: IconButton(
          icon: Icon(Icons.list),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SecondPage()),
          ),
        ),
      ),
      body: KeyBoardShortcuts(
        keysToPress: {LogicalKeyboardKey.controlLeft, LogicalKeyboardKey.keyP},
        onKeysPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SecondPage()),
        ),
        helpLabel: "Go to Second Page",
        child: Center(
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
      ),
      floatingActionButton: KeyBoardShortcuts(
        keysToPress: shortCut(BasicShortCuts.creation),
        onKeysPressed: _incrementCounter,
        helpLabel: "Increment",
        child: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> generatedList =
        List<String>.generate(100, (counter) => "Item $counter");

    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
      ),
      body: KeyBoardShortcuts(
        globalShortcuts: true,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount: generatedList.length,
                  itemBuilder: (BuildContext ctxt, int index) => Center(
                    child: Text(generatedList[index]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
