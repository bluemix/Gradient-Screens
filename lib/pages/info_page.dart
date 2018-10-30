import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

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
              GradientText(
                'STRIKE A POSE',
                gradient: Gradients.hersheys,
                shaderRect: Rect.fromLTWH(0.0, 0.0, 50.0, 50.0),
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w100),
              ),
              GradientText(
                'Struck it for a funny picture',
                gradient: Gradients.hersheys..colors.reversed,
                shaderRect: Rect.fromLTWH(0.0, 0.0, 50.0, 50.0),
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w100),
              ),

              Divider(),
              CircularGradientButton(
                  gradient: Gradients.cosmicFusion,
                  child: Icon(
                    Icons.favorite,
                    size: 28.0,
                    color: Colors.white,
                  ),
                  callback: () => print(''))
            ],
          ),
        ),
      ],
    );
  }
}
