import 'dart:math';

import 'package:text_shooting/layer/stage_layer.dart';
import 'package:text_shooting/sprite/base_sprite.dart';
import 'package:text_shooting/sprite/enemy/aim_enemy_bullet_sprite.dart';
import 'package:text_shooting/sprite/enemy/direct_collision_enemy_sprite.dart';
import 'package:text_shooting/sprite/enemy/one_shoot_enemy_sprite.dart';
import 'package:text_shooting/sprite/sprite_const.dart';

class StageActScript {
  int _timeLine = 0;
  StageLayer _stageLayer;

  int collEneCnt = 0;
  int shootEneCnt = 0;

  StageActScript(StageLayer stageLayer) {
    _stageLayer = stageLayer;
  }

  void updateTimeLine() {
    _timeLine++;

    if (_timeLine % 30 == 0 && collEneCnt < 20) {
      BaseSprite player = _stageLayer.getSpritesViaType(SPRITE_PLAYER)[0];

      DirectCollisionEnemySprite enemy =
          new DirectCollisionEnemySprite("撞", player.posX, player.posY);
      enemy.setPosition(
          Random().nextInt(_stageLayer.screenWidth.toInt()).toDouble(),
          0 - enemy.height);
      enemy.settingVelocity();

      _stageLayer.addSprite(enemy);

      collEneCnt++;
    }

    if (_timeLine % 30 == 0 && shootEneCnt < 20 && collEneCnt >= 20) {
      OneShootEnemySprite enemy =
          new OneShootEnemySprite("射", _stageLayer.screenHeight);
      enemy.setPosition(
          Random().nextInt(_stageLayer.screenWidth.toInt()).toDouble(),
          0 - enemy.height);

      _stageLayer.addSprite(enemy);

      checkOnShootSprite();

      shootEneCnt++;
    }
  }

  void checkOnShootSprite() {
    _stageLayer.getSpritesViaType(SPRITE_ENEMY).forEach((BaseSprite sprite) {
      if (sprite.tag != null && sprite.tag == ONE_SHOOT_ENEMY_EXT_TAG) {
        OneShootEnemySprite enemy = sprite as OneShootEnemySprite;
        if (enemy.isAtPosition && !enemy.isShooting) {
          BaseSprite player = _stageLayer.getSpritesViaType(SPRITE_PLAYER)[0];
          AimEnemyBulletSprite bullet =
              AimEnemyBulletSprite("彈", player.posX, player.posY);
          bullet.setPosition(enemy.posX + (enemy.width - bullet.width) / 2,
              enemy.posY + bullet.height);
          bullet.settingVelocity();

          enemy.isShooting = true;

          _stageLayer.addSprite(bullet);
        }
      }
    });
  }

  int get timeLine => _timeLine;
}
