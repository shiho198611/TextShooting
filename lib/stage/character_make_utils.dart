
import 'package:text_shooting/sprite/sprite_type.dart';
import 'package:text_shooting/sprite/text_sprite.dart';

class CharacterMakeUtils {

  static TextSprite createPlayer(String playerTxt) {
    var player = TextSprite(playerTxt);
    player.setPosition(200, 400);
    player.spriteType = SpriteType.PLAYER;
    player.life = 10;
    return player;
  }

  static TextSprite createEnemy(String enemyTxt) {
    var enemy = TextSprite(enemyTxt);
    enemy.spriteType = SpriteType.ENEMY;
    enemy.life = 1;
    return enemy;
  }

  static TextSprite createBackGround(String bgTxt) {
    var bg = TextSprite(bgTxt);
    bg.spriteType = SpriteType.BACKGROUND;
    bg.isCollision = false;
    return bg;
  }

}