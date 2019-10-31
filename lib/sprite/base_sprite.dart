import 'dart:ui';
import 'dart:math';

import 'package:text_shooting/sprite/sprite_type.dart';

abstract class BaseSprite {

  String tag;
  SpriteType spriteType = SpriteType.NONE;

  Rectangle posRect;
  Rectangle collRect;

  BaseSprite() {
    collRect = Rectangle(0, 0, 0, 0);
    posRect = Rectangle(0, 0, 0, 0);
  }

  void draw(Canvas canvas);
  bool isCollision(Rectangle anotherObject);

}