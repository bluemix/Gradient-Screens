import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:gradient_buttons/utils.dart';


class BeKindPage extends StatelessWidget {
  BoxDecoration gradientBack() {
    return BoxDecoration(
      image: new DecorationImage(
          image: new AssetImage("images/flower.jpg"),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black87, BlendMode.multiply)),
//      backgroundBlendMode: BlendMode.lighten,
//      color: Colors.lightBlue,
//      gradient: const LinearGradient(
//        begin: Alignment.topLeft,
//        end: Alignment.bottomCenter,
//        colors: const <Color>[
//          Color(0xff313245), // <color name="tuna">#313245</color>
//          Color(0xff835052), // <color name="solid_pink">#835052</color>
//        ],
//      ),
    );
  }

  static Future<TextStyle> texturedText(TextStyle textStyle,
      ) async {
    ui.Image img;
    img = await ImageLoader.load("images/texture2.jpg");
    Float64List matrix4 = new Matrix4.identity().storage;
    return textStyle.copyWith(
        foreground: Paint()
          ..shader = ImageShader(img, TileMode.mirror, TileMode.mirror, matrix4));
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
          ],
        )
      ],
    );
  }

  Widget tt = new FutureBuilder<TextStyle>(
    future: texturedText(
        TextStyle(fontSize: 80.0, fontWeight: FontWeight.w900, fontFamily: 'GE SS')), // a Future<String> or null
    builder: (BuildContext context, AsyncSnapshot<TextStyle> snapshot) {
      switch (snapshot.connectionState) {
        case ConnectionState.none:
          return new Text('Press button to start');
        case ConnectionState.waiting:
          return new Text('Awaiting result...');
        default:
          if (snapshot.hasError)
            return new Text('Error: ${snapshot.error}');
          else
            return new Text(
              'BE KIND',
              textAlign: TextAlign.start,
              style: snapshot.data,
            );
      }
    },
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        buildBackground(),
        new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                child: tt,
              ),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: Text('It feels good.',
                    style: TextStyle(
                        color: Colors.white, fontSize: 24.0, fontFamily: 'GE SS', fontWeight: FontWeight.w200)),
              ),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: Text('Maz Jobrani',
                    style: TextStyle(
                        color: Colors.white, fontSize: 14.0, fontFamily: 'GE SS', fontWeight: FontWeight.w200)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
