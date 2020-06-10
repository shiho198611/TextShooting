import 'package:text_shooting/sprite/enemy_sprite.dart';

const String ONE_SHOOT_ENEMY_EXT_TAG = "one_shoot_enemy";

class OneShootEnemySprite extends EnemySprite {
  bool isAtPosition = false;
  bool isShooting = false;
  int v = 6;
  int waitTime = 0;
  double screenHeight;

  OneShootEnemySprite(String showTxt, double screenHeight) : super(showTxt) {
    this.screenHeight = screenHeight;
    tag = ONE_SHOOT_ENEMY_EXT_TAG;
  }

  @override
  void act(int timeLine) {
    if (posY >= screenHeight / 2) {
      if (isAtPosition) {
        if (timeLine - waitTime >= 50) {
          v = 6;
        }
      } else {
        v = 0;
        waitTime = timeLine;
        isAtPosition = true;
      }
    }

    setPosition(posX, posY + v);
  }
}
