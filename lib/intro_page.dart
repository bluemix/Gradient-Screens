import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gradient_buttons/gradient_widgets.dart';
import 'package:gradient_buttons/gradients.dart';
import 'package:gradient_buttons/clippers.dart';

class IntroPage extends StatelessWidget {
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

  buildBackground() {
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
                        padding: const EdgeInsets.all(20.0),
                        decoration: new BoxDecoration(
                            shape: BoxShape.rectangle,
                            gradient: hotLinearGradient),
                      ),
                    ),
                  ],
                )),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
                  'Enjoy The Wide Range of The Best Songs',
                  style: gradientTextStyle(
                      new TextStyle(
                          fontSize: 50.0,
                          fontFamily: 'GE SS Bold',
                          fontWeight: FontWeight.bold),
                      coldLinearGradient2,
                      height: 100.0,
                      width: 1000.0),
                ),
              ),
              Divider(),
              GradientButton(
                  hotLinearGradient,
                  Text(
                    'Subscribe',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  () => print('button pressed'),
                  increaseWidthBy: 50.0,
                  ),
              // Divider(),
              // CircualrGradientButton(
              //     hotLinearGradient,
              //     Icon(
              //       Icons.favorite,
              //       size: 30.0,
              //       color: Colors.white,
              //     ),
              //     () => print(''))
            ],
          ),
        ),
      ],
    ));
  }
}
