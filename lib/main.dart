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
      initialRoute: '/home',
      routes: {
        '/home': (context) => CovenHomePage(),
        '/about': (context) => CovenAboutPage(),
        '/contact': (context) => CovenContactPage()
      },
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

//TODO: remove white edges and white visual noise/specks from sigil
//TODO: fix bottom overflow that appears when shrinking window
class _CovenHomePageState extends State<CovenHomePage> {
  double mult = 0.65;
  var colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple
  ];
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
      appBar: AppBar(
          title: const Text("Coven 888", style: TextStyle(fontSize: 30)),
          centerTitle: true,
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
                child: Text("Home", style: TextStyle(fontSize: 20))),
            FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/about');
                },
                child: Text("About", style: TextStyle(fontSize: 20))),
            FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/contact');
                },
                child: Text("Contact", style: TextStyle(fontSize: 20)))
          ]),
      body: new Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Text('COVEN888',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 100.0,
                        fontFamily: 'Unica One')),
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

class CovenAboutPage extends StatefulWidget {
  @override
  _CovenAboutPageState createState() => _CovenAboutPageState();
}

class AboutTile extends StatelessWidget {
  AboutTile(var picture, var userName, var titleLine, var description) {
    this.picture = picture;
    this.userName = userName;
    this.titleLine = titleLine;
    this.description = description;
  }

  @override
  Widget build(BuildContext context) {
    return _buildAboutTile(
        this.picture, this.userName, this.titleLine, this.description);
  }

//TODO: implement padding so we can take out the SizedBox-es
  Widget _buildAboutTile(
      var picture, var userName, var titleLine, var description) {
    return new Row(
      children: [
        SizedBox(width: 20, height: 200),
        CircleAvatar(backgroundImage: new AssetImage(picture), radius: 75),
        SizedBox(width: 20),
        RichText(
            text: TextSpan(children: [
          TextSpan(
              text: userName,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20)),
          TextSpan(
              text: ' ' + titleLine,
              style: TextStyle(color: Colors.white, fontSize: 20)),
          TextSpan(
              text: '\n' + description, style: TextStyle(color: Colors.white))
        ]))
      ],
    );
  }

  var picture;
  var userName;
  var titleLine;
  var description;
}

class _CovenAboutPageState extends State<CovenAboutPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
            title: const Text("Coven 888", style: TextStyle(fontSize: 30)),
            centerTitle: true,
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                  child: Text("Home", style: TextStyle(fontSize: 20))),
              FlatButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/about');
                  },
                  child: Text("About", style: TextStyle(fontSize: 20))),
              FlatButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/contact');
                  },
                  child: Text("Contact", style: TextStyle(fontSize: 20)))
            ]),
        //TODO: make this column responsive so that the text doesn't clip when shrinking the page
        body: Column(children: <Widget>[
          AboutTile(
              "assets/images/phosphoros.jpeg",
              'Phosphoros',
              'is the Grand Daemon of Coven 888',
              'They are a powerful mage that fucks with potions, rituals, and everything in between.'),
          AboutTile(
              "assets/images/protoneutype.jpeg",
              'protoneutype',
              'is the Technomancer of Coven 888',
              'He journeys within to enable exploration of the cosmos and the web.'),
          AboutTile(
              "assets/images/NFLM.jpeg",
              'NFLM',
              'is the Arch-Mage of Coven 888',
              'He is a chaote that is pretty sure this stuff matters.'),
        ]));
  }
}

class CovenContactPage extends StatefulWidget {
  @override
  _CovenContactPageState createState() => _CovenContactPageState();
}

//TODO: add links to twitter, email, discord
class _CovenContactPageState extends State<CovenContactPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          title: const Text("Coven 888", style: TextStyle(fontSize: 30)),
          centerTitle: true,
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
                child: Text("Home", style: TextStyle(fontSize: 20))),
            FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/about');
                },
                child: Text("About", style: TextStyle(fontSize: 20))),
            FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/contact');
                },
                child: Text("Contact", style: TextStyle(fontSize: 20)))
          ]),
    );
  }
}
