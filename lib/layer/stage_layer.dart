import 'package:flutter/painting.dart';
import 'package:text_shooting/sprite/base_sprite.dart';

class StageLayer {
  List<BaseSprite> sprites;

  double _screenWidth;
  double _screenHeight;

  int cnt = 0;

  StageLayer(double screenWidth, double screenHeight) {
    sprites = List();
    _screenWidth = screenWidth;
    _screenHeight = screenHeight;
  }

  void addSprite(BaseSprite sprite) {
    sprites.add(sprite);
  }

  void removeSprite(BaseSprite sprite) {
    sprites.remove(sprite);
  }

  void removeSpriteViaTag(String tag) {
    for (int i = 0; i < sprites.length; i++) {
      BaseSprite tmp = sprites[i];
      if (tmp.tag != null && tmp.tag == tag) {
        sprites.remove(tmp);
      }
    }
  }

  void removeOutRangeSprite() {
    for (int i = 0; i < sprites.length; i++) {
      BaseSprite tmp = sprites[i];

      if (tmp.posX <= tmp.width * -2 ||
          tmp.posX >= _screenWidth + tmp.width * 2 ||
          tmp.posY <= tmp.height * -2 ||
          tmp.posY >= _screenHeight + tmp.height * 2) {
        sprites.remove(tmp);
      }
    }
  }

  void drawSprites(Canvas canvas) {
    sprites.sort(
        (BaseSprite a, BaseSprite b) => a.spriteType.compareTo(b.spriteType));
    for (int i = 0; i < sprites.length; i++) {
      sprites[i].draw(canvas);
    }
  }

  void actSprites(int timeLine) {
    for (int i = 0; i < sprites.length; i++) {
      sprites[i].act(timeLine);
    }
  }

  List<BaseSprite> getSpritesViaType(int type) {
    List<BaseSprite> result = List();
    for (int i = 0; i < sprites.length; i++) {
      BaseSprite sprite = sprites[i];
      if (sprite.spriteType == type) {
        result.add(sprite);
      }
    }
    return result;
  }

  double get screenHeight => _screenHeight;

  double get screenWidth => _screenWidth;
}
