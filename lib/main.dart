import 'package:flutter/material.dart';
import 'package:gradient_buttons/pages/genres_page.dart';
import 'package:gradient_buttons/pages/info_page.dart';
import 'package:gradient_buttons/pages/intro_page.dart';
import 'package:gradient_buttons/pages/login_page.dart';
import 'package:gradient_buttons/utils.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Gradient Screens',
      theme: appTheme(),
      builder: (BuildContext context, Widget child) {
        return appDirectionality(child);
      },
      debugShowCheckedModeBanner: true,
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: new TabBarView(children: [
          IntroPage(),
          InfoPage(),
          GenresPage(),
          LoginPage(),
        ]),
      ),
    );
  }
}
