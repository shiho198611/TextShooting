
import 'package:flutter/painting.dart';
import 'package:text_shooting/sprite/bullet_sprite.dart';
import 'package:text_shooting/sprite/sprite_const.dart';

class PlayerBulletSprite extends BulletSprite {

  PlayerBulletSprite(String playerTxt) : super(playerTxt) {
    setBulletSpeed();
  }

  @override
  void setBulletSpeed() {
    bulletSpeed = -15.0;
  }

  @override
  double getBulletSpeed() {
    return bulletSpeed;
  }

  @override
  int getDefineSpriteType() {
    return SPRITE_BULLET;
  }

  @override
  TextStyle getDefineTextStyle() {
    return TextStyle(fontSize: 16, color: Color.fromARGB(255, 255, 0, 128));
  }
}