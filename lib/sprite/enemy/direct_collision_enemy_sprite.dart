import 'dart:math';

import 'package:text_shooting/sprite/enemy_sprite.dart';

class DirectCollisionEnemySprite extends EnemySprite {
  int v = 5;

  double vX;
  double vY;

  double _pDX;
  double _pDY;

  DirectCollisionEnemySprite(String showTxt, double playerDX, double playerDY)
      : super(showTxt) {
    _pDX = playerDX;
    _pDY = playerDY;
  }

  void settingVelocity() {
    double dx = _pDX - posX;
    double dy = _pDY - posY;

    vX = v * cos(atan2(dy, dx));
    vY = v * sin(atan2(dy, dx));
  }

  @override
  void act(int timeLine) {
    this.setPosition(posX + vX, posY + vY);
  }
}
