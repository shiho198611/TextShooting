


import 'dart:math';

import 'package:flutter/rendering.dart';
import 'package:text_shooting/layer/stage_layer.dart';
import 'package:text_shooting/sprite/base_sprite.dart';
import 'package:text_shooting/stage/character_make_utils.dart';

class Director {

  StageLayer playerLayer;
  StageLayer enemyLayer;
  StageLayer bulletLayer;

  double screenWidth;
  double screenHeight;

  Director(double width, double height) {
    playerLayer = StageLayer();
    enemyLayer = StageLayer();
    bulletLayer = StageLayer();

    screenWidth = width;
    screenHeight = height;

  }

  void initSetting() {
    var player = CharacterMakeUtils.createPlayer("測");
    player.setPosition(screenWidth/2, screenHeight - 100);

    playerLayer.addSprite(player);

    for(int i=0;i<30;i++) {

      var enemy = CharacterMakeUtils.createEnemy("敵");
      enemy.setPosition(Random().nextDouble() * (screenWidth-100), Random().nextDouble() * 50);

      enemyLayer.addSprite(enemy);
    }

  }

  void testAct() {
    for(int i=0;i<enemyLayer.sprites.length;i++) {
      BaseSprite enemy = enemyLayer.sprites[i];
      if(enemy.posY > screenHeight + enemy.height) {
        enemyLayer.removeSprite(enemy);
      }
      else {
        enemy.setPosition(enemy.posX, enemy.posY + 1);
      }
    }
  }

  void drawLayer(Canvas canvas) {
    playerLayer.drawSprites(canvas);
    enemyLayer.drawSprites(canvas);
    bulletLayer.drawSprites(canvas);
  }

}