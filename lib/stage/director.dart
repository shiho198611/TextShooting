import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:text_shooting/layer/stage_layer.dart';
import 'package:text_shooting/sprite/base_sprite.dart';
import 'package:text_shooting/sprite/bullet_sprite.dart';
import 'package:text_shooting/sprite/player_bullet_sprite.dart';
import 'package:text_shooting/sprite/player_sprite.dart';
import 'package:text_shooting/sprite/sprite_const.dart';
import 'package:text_shooting/stage/character_make_utils.dart';
import 'package:text_shooting/stage/stage_act_script.dart';

const int PLAYER_TRANSLATE_X = 3;
const int SHOOTING_RATE = 30;

class Director {
  PlayerSprite mPlayer;
  StageLayer _stageLayer;
  StageActScript _stageActScript;

  double screenWidth;
  double screenHeight;

  bool _mIsPlayerRightMove = false;
  bool _mIsPlayerLeftMove = false;

  int _mShootingRateCnt = 0;

  Director(double width, double height) {
    _stageLayer = StageLayer(width, height);
    _stageActScript = StageActScript(_stageLayer);

    screenWidth = width;
    screenHeight = height;
  }

  void initSetting() {
    mPlayer = CharacterMakeUtils.createPlayer("測");
    mPlayer.setPosition(screenWidth / 2, screenHeight - 100);

    _stageLayer.addSprite(mPlayer);
  }

  void testBulletAct() {
    for (int i = 0; i < _stageLayer.sprites.length; i++) {
      BaseSprite sprite = _stageLayer.sprites[i];

      if (sprite.spriteType == SPRITE_BULLET ||
          sprite.spriteType == SPRITE_EN_BULLET) {
        sprite.setPosition(
            sprite.posX, sprite.posY + (sprite as BulletSprite).bulletSpeed);
      }
    }
  }

  void drawLayer(Canvas canvas) {
    _stageLayer.drawSprites(canvas);
  }

  void collisionCheck() {
    List<BaseSprite> playerBullets =
        _stageLayer.getSpritesViaType(SPRITE_BULLET);
    List<BaseSprite> enemies = _stageLayer.getSpritesViaType(SPRITE_ENEMY);

    for (int i = 0; i < playerBullets.length; i++) {
      bool isColl = false;

      for (int j = 0; j < enemies.length; j++) {
        BaseSprite bullet = playerBullets[i];
        BaseSprite enemy = enemies[j];

        isColl = bullet.defineCollision(enemy.getCollisionRange());
        if (isColl) {
          playerBullets.remove(bullet);
          enemies.remove(enemy);

          _stageLayer.removeSprite(bullet);
          _stageLayer.removeSprite(enemy);

          break;
        }
      }

      if (isColl) {
        continue;
      }
    }
  }

  void _handlePlayerMove() {
    if (_mIsPlayerRightMove && mPlayer.posX < (screenWidth - mPlayer.width)) {
      double transX = mPlayer.posX + PLAYER_TRANSLATE_X;
      if (transX > screenWidth - mPlayer.width) {
        transX = screenWidth - mPlayer.width;
      }
      mPlayer.setPosition(transX, mPlayer.posY);
    } else if (_mIsPlayerLeftMove && mPlayer.posX > 0) {
      double transX = mPlayer.posX - PLAYER_TRANSLATE_X;
      if (transX < 0) {
        transX = 0;
      }
      mPlayer.setPosition(transX, mPlayer.posY);
    }
  }

  void gameLogic() {
    _stageLayer.removeOutRangeSprite();

    _stageLayer.actSprites(_stageActScript.timeLine);

    _stageActScript.updateTimeLine();

    testBulletAct();

    collisionCheck();
    _handlePlayerMove();

    shootingPlayerBullet();
  }

  void shootingPlayerBullet() {
    if (_mShootingRateCnt > SHOOTING_RATE) {
      PlayerBulletSprite pb = CharacterMakeUtils.createInitPlayerBullet("彈");
      pb.setPosition(
          mPlayer.posX + (mPlayer.width / 2 - (pb.width / 2)), mPlayer.posY);
      _stageLayer.addSprite(pb);
      _mShootingRateCnt = 0;
      return;
    }

    _mShootingRateCnt++;
  }

  void movingPlayerTapDown(double dx, double dy) {
    if (dx >= screenWidth / 2) {
      _mIsPlayerRightMove = true;
    } else if (dx <= screenWidth / 2) {
      _mIsPlayerLeftMove = true;
    }
  }

  void movingPlayerTapUp(double dx, double dy) {
    _mIsPlayerLeftMove = false;
    _mIsPlayerRightMove = false;
  }
}
