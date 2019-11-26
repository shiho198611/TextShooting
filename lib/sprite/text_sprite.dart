import 'dart:math';
import 'dart:ui';

import 'package:flutter/painting.dart';
import 'package:text_shooting/collision/collision_actor.dart';
import 'package:text_shooting/sprite/base_sprite.dart';
import 'package:text_shooting/sprite/sprite_type.dart';

class TextPlayerSprite extends BaseSprite {

  String playerTxt;
  TextSpan textSpan;
  TextStyle textStyle;
  TextPainter textPainter;

  TextPlayerSprite(String playerTxt) {

    this.spriteType = SpriteType.PLAYER;

    this.playerTxt = playerTxt;

    textStyle = TextStyle(fontSize: 16, color: Color.fromARGB(255, 255, 0, 0));
    textSpan = TextSpan(text: playerTxt, style: textStyle);
    
    textPainter = TextPainter(text: textSpan, textAlign: TextAlign.left, textDirection: TextDirection.ltr);
  }

  @override
  void draw(Canvas canvas) {

    textPainter.layout();
    textPainter.paint(canvas, position);

    _settingSpriteSize();

//    debug(canvas);
  }

  @override
  void collisionObject(CollisionActor object) {
    if(!(object is BaseSprite)) {
      return;
    }

    var collSprite = object as BaseSprite;
    switch(collSprite.spriteType) {
      case SpriteType.ENEMY:
        print("");
        break;
      default:
        

    }
  }

  @override
  bool defineCollision(Rectangle<num> aimRect) {
    return aimRect.intersects(getCollisionRange());
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