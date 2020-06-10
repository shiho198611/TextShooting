import 'dart:math';
import 'dart:ui';

import 'package:flutter/painting.dart';
import 'package:text_shooting/collision/collision_actor.dart';
import 'package:text_shooting/sprite/base_sprite.dart';
import 'package:text_shooting/sprite/sprite_define.dart';

abstract class TextSprite extends BaseSprite implements SpriteDefine {

  String drawTxt;
  TextSpan textSpan;
  TextPainter textPainter;
  int life;

  bool firstLayout = true;

  TextSprite(String playerTxt) {

    this.drawTxt = playerTxt;

    textSpan = TextSpan(text: playerTxt, style: getDefineTextStyle());
    spriteType = getDefineSpriteType();
    
    textPainter = TextPainter(text: textSpan, textAlign: TextAlign.left, textDirection: TextDirection.ltr);
    textPainter.layout();

    width = textPainter.size.width;
    height = textPainter.size.height;

  }

  @override
  void draw(Canvas canvas) {

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

  void act(int timeLine) {}

  void debug(Canvas canvas) {
    //draw collision range
    Rect rect = new Rect.fromLTWH(posX, posY, width, height);

    Paint rectPaint = Paint();
    rectPaint.style = PaintingStyle.stroke;
    rectPaint.color = Color.fromARGB(255, 255, 0, 0);

    canvas.drawRect(rect, rectPaint);
  }

}