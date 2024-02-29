import 'package:flutter/material.dart';

void main() {
  Dev dev1 = Dev(name: '1', surname: '2');
  print(dev1);
  dev1.surname = 'slon';
  print(dev1);
  runApp(MyApp());
}

class AppName {
  final String _name;

  AppName(this._name);

  String get name => _name;
}

class Dev {
  late String _name ;
  late String _surname;

  Dev({name, surname}) {
    _name = name;
    _surname = surname;
  }

  set surname(String newSurname) {_surname = newSurname;}

  @override
  String toString() => '$_name $_surname';
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final appName = AppName('Flutter First Task');
  final developer = Dev(name: 'Yehor', surname: 'Bilovus');

  void updateSurname({newSurname}) {
    developer.surname = newSurname;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    updateSurname(newSurname: '');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter First Task',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        useMaterial3: true,
      ),
      home: MyHomePage(title: '${appName.name} Home Page', developer: developer),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.developer});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final Dev developer;
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Developer of this app is: ${widget.developer}',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
