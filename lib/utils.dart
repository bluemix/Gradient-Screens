import 'package:flutter/widgets.dart';

Directionality appDirectionality(Widget child) {
  return new Directionality(
    textDirection: TextDirection.rtl,
    child: new Builder(
      builder: (BuildContext context) {
        return new MediaQuery(
          data: MediaQuery.of(context).copyWith(
                textScaleFactor: 1.0,
              ),
          child: child,
        );
      },
    ),
  );
}