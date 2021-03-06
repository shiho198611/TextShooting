import 'dart:ui';
import 'dart:math';

import 'package:text_shooting/collision/collision_actor.dart';
import 'package:text_shooting/sprite/sprite_const.dart';

abstract class BaseSprite implements CollisionActor {

  String tag;
//  SpriteType spriteType = SpriteType.NONE;

  int spriteType = SPRITE_NONE;

  Rectangle posRect;

  double posX = 0;
  double posY = 0;

  double width = 0;
  double height = 0;

  Offset position;
  bool isCollision;

  BaseSprite() {
    position = Offset(posX, posY);
    isCollision = true;
  }

  void setPosition(double x, double y) {
    position = position.translate(x - posX, y - posY);

    posX = x;
    posY = y;
  }

  @override
  Rectangle getCollisionRange() {
    return Rectangle(posX, posY, width, height);
  }

  void draw(Canvas canvas);
  void act(int timeLine);

}