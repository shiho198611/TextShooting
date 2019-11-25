
import 'package:flutter/painting.dart';
import 'package:text_shooting/sprite/base_sprite.dart';

class StageLayer {

  List<BaseSprite> sprites;

  StageLayer() {
    sprites = List();
  }

  void addSprite(BaseSprite sprite) {
    sprites.add(sprite);
  }

  void removeSprite(BaseSprite sprite) {
    sprites.remove(sprite);
  }

  void removeSpriteViaTag(String tag) {
    for(int i = 0; i<sprites.length;i++) {
      BaseSprite tmp = sprites[i];
      if(tmp.tag != null && tmp.tag == tag) {
        sprites.remove(tmp);
      }
    }
  }

  void drawSprites(Canvas canvas) {
    for(int i=0;i<sprites.length;i++) {
      sprites[i].draw(canvas);
    }
  }

}