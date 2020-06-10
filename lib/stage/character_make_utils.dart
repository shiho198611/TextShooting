
import 'package:text_shooting/sprite/enemy_sprite.dart';
import 'package:text_shooting/sprite/player_bullet_sprite.dart';
import 'package:text_shooting/sprite/player_sprite.dart';
import 'package:text_shooting/sprite/text_sprite.dart';

class CharacterMakeUtils {

  static TextSprite createPlayer(String playerTxt) {
    var player = PlayerSprite(playerTxt);
    player.setPosition(200, 400);
    player.life = 10;
    return player;
  }

  static TextSprite createEnemy(String enemyTxt) {
    var enemy = EnemySprite(enemyTxt);
    enemy.life = 1;
    return enemy;
  }

//  static TextSprite createBackGround(String bgTxt) {
//    var bg = TextSprite(bgTxt);
//    bg.spriteType = SpriteType.BACKGROUND;
//    bg.isCollision = false;
//    return bg;
//  }

  static PlayerBulletSprite createInitPlayerBullet(String pbTxt) {
    var playerBullet = PlayerBulletSprite(pbTxt);
    return playerBullet;
  }

}