
import 'package:text_shooting/sprite/text_sprite.dart';

abstract class BulletSprite extends TextSprite {

  double bulletSpeed;

  BulletSprite(String playerTxt) : super(playerTxt);

  void setBulletSpeed();
  double getBulletSpeed();

}