
import 'dart:math';
import 'dart:ui';

import 'package:flutter/painting.dart';
import 'package:text_shooting/sprite/base_sprite.dart';

class TextPlayerSprite extends BaseSprite {

  String playerTxt;
  TextSpan textSpan;
  TextStyle textStyle;
  TextPainter textPainter;

  TextPlayerSprite(String playerTxt) {

    this.playerTxt = playerTxt;

    textStyle = TextStyle(fontSize: 16, color: Color.fromARGB(255, 255, 0, 0));
    textSpan = TextSpan(text: playerTxt, style: textStyle);
    
    textPainter = TextPainter(text: textSpan, textAlign: TextAlign.left, textDirection: TextDirection.ltr);
  }

  @override
  void draw(Canvas canvas) {
    textPainter.layout();
    textPainter.paint(canvas, new Offset(100, 100));
  }

  @override
  bool isCollision(Rectangle anotherObject) {
    return false;
  }
}