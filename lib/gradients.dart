import 'package:flutter/material.dart';


Widget _gradientContainer(
    BuildContext context, Gradient gradient, double incHeightBy, Widget child) {
  final ButtonThemeData buttonTheme =
      ButtonTheme.of(context).copyWith(padding: const EdgeInsets.all(0.0));
  return new Container(
    height: buttonTheme.height + incHeightBy,
    width: buttonTheme.minWidth,
    decoration: BoxDecoration(gradient: gradient),
    child: Center(child: child),
  );
}

class CircualrGradientButton extends StatelessWidget {
  CircualrGradientButton(this.gradient, this.child, this.callback,
      {this.elevation = 2.0});

  final Widget child;
  final Gradient gradient;
  final VoidCallback callback;
  final double elevation;


  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: elevation,
      onPressed: () => callback,
      child: _gradientContainer(context, gradient, 30.0, child),
    );
  }
}

class GradientButton extends StatelessWidget {
  GradientButton(this.gradient, this.child, this.callback,
      {this.shape, this.shapeRadius, this.textStyle, this.elevation = 2.0});

  final Widget child;
  final Gradient gradient;
  final VoidCallback callback;
  final ShapeBorder shape;
  final BorderRadius shapeRadius;
  final TextStyle textStyle;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    BorderRadius borderRadiusCopy = shapeRadius ?? BorderRadius.circular(20.0);
    ShapeBorder shapeCopy =
        shape ?? RoundedRectangleBorder(borderRadius: borderRadiusCopy);
    TextStyle textStyleCopy =
        textStyle ?? theme.textTheme.button.copyWith(color: Colors.white);

    return RawMaterialButton(
      fillColor: Colors.transparent,
      padding: const EdgeInsets.all(0.0),
      shape: shapeCopy,
      elevation: elevation,
      textStyle: textStyleCopy,
      onPressed: () => callback,
      child: _gradientContainer(context, gradient, 0.0, child),
    );
  }
}
