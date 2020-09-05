import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coven 888',
      home: CovenHomePage(),
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
        backgroundColor: Colors.black,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}

class CovenHomePage extends StatefulWidget {
  @override
  _CovenHomePageState createState() => _CovenHomePageState();
}

class _CovenHomePageState extends State<CovenHomePage> {
  double mult = 0.65;
  var colors = [Colors.red, Colors.orange, Colors.yellow, Colors.green, Colors.blue, Colors.indigo, Colors.purple];
  var sigilColor = Colors.white;
  int sigilState = -1;

  void alterImage() {
    setState(() {
      sigilState++;
      if (sigilState > 6) {
        sigilState = 0;
      }
      var materialColor = colors[sigilState];
      sigilColor = materialColor;
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.black,
        body: new Container(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Text(
                    'COVEN888',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 100.0,
                      fontFamily: 'Unica One'
                    )
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {
                  alterImage();
                },
                child: AnimatedContainer(
                  duration: new Duration(milliseconds: 300),
                  curve: Curves.easeInCubic,
                  color: sigilColor,
                  child: Image(
                    image: new AssetImage("assets/images/covenbg.png"),
                    height: MediaQuery.of(context).size.height * 0.75,
                    colorBlendMode: BlendMode.colorBurn,
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}