import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gradient_buttons/gradient_widgets.dart';
import 'package:gradient_buttons/gradients.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BoxDecoration gradientBack() {
      return const BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomCenter,
          colors: const <Color>[
            Color(0xffD3CCE3),
            Color(0xffE9E4F0),
          ],
        ),
      );
    }

    final double itemHeight = 350.0;
    Widget _buildImage() {
      return new Padding(
        padding: const EdgeInsets.symmetric(vertical: 0.0),
        child: new Container(
          height: itemHeight,
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image:
                  new ExactAssetImage('images/jack-finnigan-543633-unsplash.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    }

    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          decoration: gradientBack(),
        ),
        new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 15.0),
                  child: Card(
                    elevation: 10.0,
                    margin: const EdgeInsets.all(5.0),
                    child: _buildImage(),
                  )),
              Text(
                'STRIKE A POSE',
                style: gradientTextStyle(
                    TextStyle(fontSize: 40.0, fontWeight: FontWeight.w100),
                    hersheysGradient, width: 400.0, height: 100.0),
              ),
              Text(
                'اللي ما أعرف ترجمتها بالعربي',
                style: gradientTextStyle(
                    TextStyle(fontSize: 24.0, fontWeight: FontWeight.w100),
                    hersheysGradientAr, width: 500.0, height: 100.0),
              ),
              Divider(),
              CircualrGradientButton(
                  cosmicFusionGradient,
                  Icon(
                    Icons.favorite,
                    size: 28.0,
                    color: Colors.white,
                  ),
                  () => print(''))
            ],
          ),
        ),
      ],
    );
  }
}
