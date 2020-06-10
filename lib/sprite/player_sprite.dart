
import 'package:flutter/widgets.dart';
import 'package:text_shooting/sprite/sprite_const.dart';
import 'package:text_shooting/sprite/text_sprite.dart';

class PlayerSprite extends TextSprite {

  PlayerSprite(String playerTxt) : super(playerTxt);

  @override
  TextStyle getDefineTextStyle() {
    return TextStyle(fontSize: 24, color: Color.fromARGB(255, 255, 0, 0));
  }

  @override
  int getDefineSpriteType() {
    return SPRITE_PLAYER;
  }

}