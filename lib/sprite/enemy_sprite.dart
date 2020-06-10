
import 'package:flutter/painting.dart';
import 'package:text_shooting/sprite/sprite_const.dart';
import 'package:text_shooting/sprite/text_sprite.dart';

class EnemySprite extends TextSprite {

  EnemySprite(String showTxt) : super(showTxt);

  @override
  TextStyle getDefineTextStyle() {
    return TextStyle(fontSize: 24, color: Color.fromARGB(255, 0, 255, 0));
  }

  @override
  int getDefineSpriteType() {
    return SPRITE_ENEMY;
  }

}