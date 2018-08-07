import 'package:flutter/material.dart';
import 'package:gradient_buttons/utils.dart';
import 'package:gradient_buttons/wavy_clipper.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Gradient Buttons',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      builder: (BuildContext context, Widget child) {
        return appDirectionality(child);
      },
      debugShowCheckedModeBanner: false,
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
  buildBackground() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          decoration: gradientBack(),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Center(),
            ),
            Expanded(
                flex: 1,
                child: Stack(
                  fit: StackFit.loose,
                  children: <Widget>[
                    ClipPath(
                      clipper: BottomWaveClipper(),
                      child: new Container(
                        // height: height * 0.25,
                        // width: width * 1.0,
                        padding: const EdgeInsets.all(20.0),
                        decoration: new BoxDecoration(
                          shape: BoxShape.rectangle,
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: const <Color>[
                              Color(
                                  0xffF55B9A), // <color name="bleu_de_france">#388DE3</color>
                              Color(
                                  0xffF9B16E), // <color name="summer_sky">#2BB2DF</color>
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        )
      ],
    );
  }

  BoxDecoration gradientBack() {
    return const BoxDecoration(
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomCenter,
        colors: const <Color>[
          Color(0xff2596B3), // <color name="pelorous">#2596B3</color>
          Color(0xff5FC9E2), // <color name="viking">#5FC9E2</color>
        ],
      ),
    );
  }

  BoxDecoration gradientButtonBack() {
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

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ButtonThemeData buttonTheme =
        ButtonTheme.of(context).copyWith(padding: const EdgeInsets.all(0.0));
    
    final Shader linearGradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomCenter,
      colors: <Color>[
        Color(0xfff20BDFF),
        Color(0xffA5FECB),
      ],
    ).createShader(Rect.fromLTWH(0.0, 0.0, 1000.0, 100.0));
    
    final Shader linearGradient2 = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomCenter,
      colors: <Color>[
        Color(0xaaE8E8E8),
        Color(0xffE8E8E8),
      ],
    ).createShader(Rect.fromLTWH(0.0, 0.0, 1000.0, 100.0));

    Widget gradientContainer(double incHeightBy, Widget child) => new Container(
          height: buttonTheme.height + incHeightBy,
          width: buttonTheme.minWidth,
          decoration: gradientButtonBack(),
          child: Center(child: child),
        );

    return new Scaffold(
        // appBar: new AppBar(
        //   title: new Text(widget.title),
        // ),
        body: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        buildBackground(),
        new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'مو غالي ، شتكفيك كلمة الغالي ؛',
                  style: new TextStyle(
                      fontSize: 55.0,
                      fontFamily: 'GE SS Bold',
                      fontWeight: FontWeight.bold,
                      foreground: Paint()..shader = linearGradient),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'يال ما جنت ع البال ، صرت إنت',
                  style: new TextStyle(
                      fontSize: 19.0,
                      fontFamily: 'GE SS Light',
                      foreground: Paint()..shader = linearGradient2),
                ),
              ),
              Divider(),
              RawMaterialButton(
                fillColor: Colors.transparent,
                padding: const EdgeInsets.all(0.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                textStyle: theme.textTheme.button.copyWith(color: Colors.white),
                onPressed: () => print('button pressed'),
                child: gradientContainer(
                  0.0,
                  Text('بالي', style: TextStyle(fontFamily: 'GE SS Light', fontSize: 18.0),),
                ),
              ),
              Divider(),
              FloatingActionButton(
                foregroundColor: Colors.white,
                onPressed: () => print('FAB clicked'),
                elevation: 4.0,
                child: gradientContainer(
                    30.0,
                    Icon(
                      Icons.favorite,
                      size: 30.0,
                    )),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
