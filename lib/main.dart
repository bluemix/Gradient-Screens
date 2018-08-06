import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Gradient Buttons',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Gradient Buttons'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    BoxDecoration gradientBackDecoration() {
      return const BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: const <Color>[
            Color(0xffF55B9A), // <color name="violet_red">#F55B9A</color>
            Color(0xffF9B16E), // <color name="rajah">#F9B16E</color>
          ],
        ),
      );
    }
final ThemeData theme = Theme.of(context);
    final ButtonThemeData buttonTheme =
        ButtonTheme.of(context).copyWith(padding: const EdgeInsets.all(0.0));

    Widget gradientContainer(double incHeightBy, Widget child) => new Container(
          height: buttonTheme.height + incHeightBy,
          width: buttonTheme.minWidth,
          decoration: gradientBackDecoration(),
          child: Center(child: child),
        );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RawMaterialButton(
              fillColor: Colors.transparent,

              padding: const EdgeInsets.all(0.0),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              textStyle: theme.textTheme.button.copyWith(color: Colors.white),
              onPressed: () => print('button pressed'),
              child: gradientContainer(0.0, Text('Gradient'),),
            ),
            Divider(),
            FloatingActionButton(
              foregroundColor: Colors.white,
              onPressed: () => print('FAB clicked'),
              elevation: 4.0,
              
              child: gradientContainer(30.0, Icon(Icons.add, size: 30.0,)),
            ),
            // new MaterialButton(
            //   height: 40.0,
            //   minWidth: 70.0,
            //   padding: buttonTheme.padding,
            //   color: Theme.of(context).primaryColor,
            //   textColor: Colors.white,
            //   child: gradientContainer(),
            //   onPressed: () => {},
            //   splashColor: Colors.redAccent,
            // ),
            // RaisedButton(
            //   color: Colors.orangeAccent,
            //   onPressed: () => print('button pressed'),
            //   padding: const EdgeInsets.all(0.0),
            //   child: Container(
            //     color: Colors.teal,
            //     child: Padding(
            //       padding: const EdgeInsets.all(5.0),
            //       child: Text(
            //         'Press me',
            //         style: TextStyle(color: Colors.white),
            //       ),
            //     ),
            //   ),
            // ),
            // Material(
            //   elevation: 3.0,
            //   child: InkWell(
            //     onTap: () => print('physical model clicked'),
            //     highlightColor: Colors.teal,
            //     splashColor: Colors.yellow,
            //     radius: 15.0,
            //     child: AnimatedPhysicalModel(
            //       shape: BoxShape.rectangle,
            //       elevation: 3.0,
            //       color: Colors.lightBlueAccent,
            //       child: Text('Animated Physical Model'),
            //       duration: Duration(seconds: 1),
            //       curve: Curves.fastOutSlowIn,
            //       borderRadius: BorderRadius.zero,
            //       shadowColor: Colors.greenAccent,
            //     ),
            //   ),
            // ),

          ],
        ),
      ),
    );
  }
}
