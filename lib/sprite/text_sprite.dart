import 'dart:math';
import 'dart:ui';

import 'package:flutter/painting.dart';
import 'package:text_shooting/collision/collision_actor.dart';
import 'package:text_shooting/sprite/base_sprite.dart';

class TextSprite extends BaseSprite {

  String drawTxt;
  TextSpan textSpan;
  TextStyle textStyle;
  TextPainter textPainter;
  int life;

  bool firstLayout = true;

  TextSprite(String playerTxt) {

    this.drawTxt = playerTxt;

    textStyle = TextStyle(fontSize: 24, color: Color.fromARGB(255, 255, 0, 0));
    textSpan = TextSpan(text: playerTxt, style: textStyle);
    
    textPainter = TextPainter(text: textSpan, textAlign: TextAlign.left, textDirection: TextDirection.ltr);
  }

  @override
  void draw(Canvas canvas) {

    if(firstLayout) {
      textPainter.layout();
      _settingSpriteSize();

      firstLayout = false;
    }

    canvas.save();
    textPainter.paint(canvas, position);
    canvas.restore();
  }

  @override
  void collisionObject(CollisionActor object) {}

  @override
  bool defineCollision(Rectangle<num> aimRect) {
    if(isCollision) {
      return aimRect.intersects(getCollisionRange());
    }
    else {
      return false;
    }
  }

  void _settingSpriteSize() {
    if(textPainter != null && width == 0 && height == 0) {
      width = textPainter.width;
      height = textPainter.height;
    }
  }

  void debug(Canvas canvas) {
    //draw collision range
    Rect rect = new Rect.fromLTWH(posX, posY, width, height);

    Paint rectPaint = Paint();
    rectPaint.style = PaintingStyle.stroke;
    rectPaint.color = Color.fromARGB(255, 255, 0, 0);

    canvas.drawRect(rect, rectPaint);
  }

}