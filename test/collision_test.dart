import 'package:flutter_test/flutter_test.dart';
import 'package:text_shooting/sprite/text_player_sprite.dart';

void main() {

  test("Right upper collision expected true", () {

    var fakeColl1 = TextPlayerSprite("a");
    var fakeColl2 = TextPlayerSprite("b");

    fakeColl1.setPosition(0, 0);
    fakeColl1.width = 100;
    fakeColl1.height = 100;

    fakeColl2.setPosition(50, 50);
    fakeColl2.width = 100;
    fakeColl2.height = 100;

    bool result = fakeColl1.defineCollision(fakeColl2.getCollisionRange());

    expect(result, true);
  });

  test("Left under collision expected true", () {

    var fakeColl1 = TextPlayerSprite("a");
    var fakeColl2 = TextPlayerSprite("b");

    fakeColl1.setPosition(0, 0);
    fakeColl1.width = 100;
    fakeColl1.height = 100;

    fakeColl2.setPosition(-50, -50);
    fakeColl2.width = 100;
    fakeColl2.height = 100;

    bool result = fakeColl1.defineCollision(fakeColl2.getCollisionRange());

    expect(result, true);
  });

  test("out range collision expected false", () {
    var fakeColl1 = TextPlayerSprite("a");
    var fakeColl2 = TextPlayerSprite("b");

    fakeColl1.setPosition(0, 0);
    fakeColl1.width = 100;
    fakeColl1.height = 100;

    fakeColl2.setPosition(101, 101);
    fakeColl2.width = 100;
    fakeColl2.height = 100;

    bool result = fakeColl1.defineCollision(fakeColl2.getCollisionRange());

    expect(result, false);
  });

  test("just fit collision expected true", () {
    var fakeColl1 = TextPlayerSprite("a");
    var fakeColl2 = TextPlayerSprite("b");

    fakeColl1.setPosition(0, 0);
    fakeColl1.width = 100;
    fakeColl1.height = 100;

    fakeColl2.setPosition(100, 100);
    fakeColl2.width = 100;
    fakeColl2.height = 100;

    bool result = fakeColl1.defineCollision(fakeColl2.getCollisionRange());

    expect(result, true);
  });

}