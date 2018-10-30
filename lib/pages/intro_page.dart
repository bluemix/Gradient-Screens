import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:gradient_buttons/clippers.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

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
                            gradient: Gradients.hotLinear),
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
                child:
                GradientText(
                  'Enjoy The Wide Range of The Best Songs',
                  gradient: Gradients.coldLinear,
                  shaderRect: Rect.fromLTWH(0.0, 0.0, 200.0, 100.0),
                  style: TextStyle(
                      fontSize: 54.0,
                      fontFamily: 'GE SS',
                      fontWeight: FontWeight.w900),
                ),
              ),
              Divider(),
              GradientButton(
                  gradient: Gradients.hotLinear,
                  child: Text(
                    'Subscribe',

                    style: TextStyle(fontSize: 22.0),
                  ),
                  callback: () => print('button pressed'),
                  increaseWidthBy: 50.0,
                  ),
            ],
          ),
        ),
      ],
    ));
  }
}
