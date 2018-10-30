import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'dart:ui' as ui;
import 'dart:async';

var lightGrayColor = new Color(0xFFD6D6D6);
var loblollyColor = new Color(0xFFB9B9B9); // <color name="loblolly">#B9B9B9</color>
ThemeData appTheme() {
  return new ThemeData(
      hintColor: Colors.grey[100], //

      fontFamily: 'GE SS Light',
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(color: Colors.white),
        hintStyle: TextStyle(color: loblollyColor),
        // border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.yellow, style: BorderStyle.none)),
        border: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red, style: BorderStyle.none)),
      ),
      accentColor: Colors.lime);
}

Directionality appDirectionality(Widget child) {
  return new Directionality(
    textDirection: TextDirection.ltr,
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


// taken from https://github.com/kyorohiro/check_api_and_platform/blob/afa0365b053f5bf0df658c09813556e68e720994/flutter_c/lib/demo/3ddemo_drawvertex.dart#L108-L125
class ImageLoader {
  static AssetBundle getAssetBundle() => (rootBundle != null)
      ? rootBundle
      : new NetworkAssetBundle(new Uri.directory(Uri.base.origin));

  static Future<ui.Image> load(String url) async {
    ImageStream stream = new AssetImage(url, bundle: getAssetBundle()).resolve(ImageConfiguration.empty);
    Completer<ui.Image> completer = new Completer<ui.Image>();
    void listener(ImageInfo frame, bool _) {
      final ui.Image image = frame.image;
      completer.complete(image);
      stream.removeListener(listener,);
    }
    stream.addListener(listener);
    return completer.future;
  }
}
