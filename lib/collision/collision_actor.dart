
import 'dart:math';

abstract class CollisionActor {

  bool defineCollision(Rectangle aimRect);
  void collisionObject(CollisionActor object);
  Rectangle getCollisionRange();

}