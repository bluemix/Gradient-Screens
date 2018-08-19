import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gradient_buttons/gradient_widgets.dart';
import 'package:gradient_buttons/gradients.dart';

class GenresPage extends StatelessWidget {
  final double increaseWidthBy = 50.0;

  GradientButton buildGradientButton(Gradient gradient, String text) {
    return GradientButton(
      gradient: gradient,
      child: Text(text),
      callback: () {},
      increaseWidthBy: increaseWidthBy,
    );
  }

  @override
  Widget build(BuildContext context) {
    List<GradientButton> buttons = [];
    buttons.add(buildGradientButton(serveGradient, 'INDIE ROCK'));
    buttons.add(buildGradientButton(blushGradient, 'POP'));
    buttons.add(buildGradientButton(serveGradient, 'FOLK'));
    buttons.add(buildGradientButton(serveGradient, 'ROCK'));
    buttons.add(buildGradientButton(byDesignGradient, 'BLUES'));
    buttons.add(buildGradientButton(rainbowBlueGradient, 'JAZZ'));
    buttons.add(buildGradientButton(serveGradient, 'COUNTRY'));
    buttons.add(buildGradientButton(aliGradient, 'POPULAR'));
    buttons.add(buildGradientButton(serveGradient, 'TECNHO'));

    // buttons.add(GradientButton(serveGradient, Text('ALTERNATIVE'), (){}));

    BoxDecoration gradientBack() {
      return const BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomCenter,
          colors: const <Color>[
            Color(0xff2f353c),
            Color(0xff181f27),
          ],
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
            child: Column(
          children: <Widget>[
            Expanded(
              child: Center(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Pick your preffered music type',
                    style: TextStyle(color: Colors.white, fontSize: 22.0),
                  ),
                  Text(
                    'Tab once on your favorite genres',
                    style: TextStyle(color: Colors.grey, fontSize: 16.0),
                  ),
                ],
              )),
            ),
            Expanded(
              flex: 2,
                child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                childAspectRatio: 4.0,
                padding: const EdgeInsets.all(15.0),
                children: List.generate(buttons.length, (index) {
                  return Center(
                    child: buttons[index],
                  );
                }),
              ),
            )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50.0),
              child: GradientButton(
                gradient: backToFutureGradient,
                child: Text('NEXT'),
                callback: () {},
                increaseWidthBy: 75.0,
              ),
            )
          ],
        )),
      ],
    );
  }
}
