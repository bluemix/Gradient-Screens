import 'package:flutter/material.dart';
import 'package:gradient_buttons/info_page.dart';
import 'package:gradient_buttons/intro_page.dart';
import 'package:gradient_buttons/utils.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Gradient Buttons',
      theme: appTheme(),
      builder: (BuildContext context, Widget child) {
        return appDirectionality(child);
      },
      debugShowCheckedModeBanner: false,
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
      length: 2,
      child: Scaffold(
        body: new TabBarView(children: [
          IntroPage(),
          InfoPage()
        ]),
      ),
    );
  }
}
