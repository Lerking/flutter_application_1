import 'package:flutter/material.dart';

const backgroundAzure = Color(0xFFF0FFFF);
const alBlue = Color(0xFF11387F);
const alBlueDark = Color(0xFF1138C8);
const greyishBrown = Color(0xFF3D3935);
const greyishWhite = Color(0xFFFBFBFB);
const focusGreen = Color(0xFF04AA6D);

const List<Widget> navigators = <Widget>[
  Text('Home'),
  Text('Lead time'),
  Text('Load factor'),
  Text('Production site'),
  Text('ALSIS code'),
  Text('Taxonomy code'),
  Text('News')
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundAzure,
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter(int amount) {
    setState(() {
      _counter += amount;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = TextButton.styleFrom(
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
    );
    final List<bool> _selectedNavigator = <bool>[
      true,
      false,
      false,
      false,
      false,
      false,
      false
    ];
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.

        actions: <Widget>[
          ToggleButtons(
            onPressed: (int index) {
              setState(() {
                // The button that is tapped is set to true, and the others to false.
                for (int i = 0; i < _selectedNavigator.length; i++) {
                  _selectedNavigator[i] = i == index;
                }
              });
            },
            selectedColor: greyishWhite,
            fillColor: focusGreen,
            color: greyishWhite,
            constraints: const BoxConstraints(
              minHeight: 60.0,
              minWidth: 80.0,
            ),
            isSelected: _selectedNavigator,
            children: navigators,
          ),
        ],
        backgroundColor: alBlue,
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ButtonTheme(
              buttonColor: Colors.red,
              child: ButtonBar(
                alignment: MainAxisAlignment.center,
                children: <Widget>[
                  //TODO: talk about how the buttons will convert from row to column if exceeds width
                  ElevatedButton(
                    child: Text('1'),
                    onPressed: () {
                      _incrementCounter(1);
                    },
                  ),
                  ElevatedButton(
                    child: Text('2'),
                    onPressed: () {
                      _incrementCounter(2);
                    },
                  ),
                  ElevatedButton(
                    child: Text('3'),
                    onPressed: () {
                      _incrementCounter(3);
                    },
                  ),
                  ElevatedButton(
                    child: Text('4'),
                    onPressed: () {
                      _incrementCounter(4);
                    },
                  ),
                ],
              ),
            ),
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
        onPressed: () => _incrementCounter(1),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
