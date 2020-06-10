
import 'package:text_shooting/sprite/enemy/direct_collision_enemy_sprite.dart';
import 'package:flutter/painting.dart';

class AimEnemyBulletSprite extends DirectCollisionEnemySprite {

  AimEnemyBulletSprite(String showTxt, double playerDX, double playerDY) : super(showTxt, playerDX, playerDY) {
    v = 7;
  }

  @override
  TextStyle getDefineTextStyle() {
    return TextStyle(fontSize: 16, color: Color.fromARGB(255, 140, 20, 211));
  }

}