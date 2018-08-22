import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gradient_buttons/gradient_widgets.dart';
import 'package:gradient_buttons/gradients.dart';
import 'package:gradient_buttons/clippers.dart';
import 'package:path_parsing/path_parsing.dart';

// inspired from https://www.tenniswood.co.uk/post/160767831482
class LoginPage extends StatelessWidget {
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

  Widget _buildBackground(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    String halpEllipsePath =
        'M-48.35,33.095C-21.509,2.145 17.176,-16.352 59.126,-14.058C134.541,-9.932 192.134,59.835 187.659,141.645C183.184,223.454 118.325,286.524 42.91,282.398C6.777,280.422 -25.266,263.376 -48.35,237.156L-48.35,33.095Z';

    var pathPrinter = new PathBuilder();
    writeSvgPathDataToPath(halpEllipsePath, pathPrinter);
    var paint = new Paint()
      ..strokeWidth = 45.0
      ..shader =
          blueshGradient.createShader(Rect.fromLTWH(0.0, 0.0, 100.0, 300.0))
      ..style = PaintingStyle.stroke;

    return Transform.scale(
        scale: 1.75,
        child: Transform.translate(
            offset: Offset(width / 8, height / 4),
            child: CustomPaint(
                painter:
                    new PathPainter(p: pathPrinter.path, redPainter: paint))));
  }

  Widget _buildFooter(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Center(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GradientButton(
              gradient: whiteGradient,
              callback: () => {},
              textStyle: TextStyle(color: Colors.black, fontSize: 16.0),
              shapeRadius: BorderRadius.circular(5.0),
              child: Text(
                "Sign in",
              ),
              increaseHeightBy: 5.0,
              increaseWidthBy: width / 2,
            ),
          ]),
    );
  }

  Widget _buildInputs() {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 0.0),
      elevation: 20.0,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                filled: false,
                hintText: 'Username',
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                filled: false,
                hintText: 'Password',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
        padding: const EdgeInsets.only(top: 100.0, left: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Sign In',
              style: new TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.w100),
            ),
            Text(
              'Log in with your\nusername or email',
              style: new TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w100),
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        _buildBackground(context),
        new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: _buildHeader(),
            ),
            Expanded(flex: 1, child: _buildInputs()),
            Expanded(flex: 2, child: _buildFooter(context)),
          ],
        ),
      ],
    ));
  }
}

class PathPainter extends CustomPainter {
  PathPainter({this.p, this.redPainter});

  final Path p;

  final Paint redPainter;

  @override
  bool shouldRepaint(PathPainter old) => true;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPath(p, redPainter);
  }
}

class PathBuilder extends PathProxy {
  var path = Path();
  @override
  void close() {
    path.close();
  }

  @override
  void cubicTo(
      double x1, double y1, double x2, double y2, double x3, double y3) {
    path.cubicTo(x1, y1, x2, y2, x3, y3);
  }

  @override
  void lineTo(double x, double y) {
    path.lineTo(x, y);
  }

  @override
  void moveTo(double x, double y) {
    path.moveTo(x, y);
  }
}
