
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:text_shooting/layer/stage_layer.dart';
import 'package:text_shooting/sprite/text_sprite.dart';

class Stage extends RenderBox {

  static const double TIME_STEP = 1 / 60;
  int _frameCallbackId;

  StageLayer playerLayer;
  StageLayer enemyLayer;


  Stage(BuildContext context) {}


  void _scheduleTick() {
    _frameCallbackId = SchedulerBinding.instance.scheduleFrameCallback(_tick);
  }

  void _tick(Duration timestamp) {
    if (!attached) return;
    _scheduleTick();
    markNeedsPaint();
  }

  @override
  void attach(PipelineOwner owner) {
    super.attach(owner);
    _scheduleTick();
  }

  @override
  void paint(PaintingContext context, Offset offset) {

    playerLayer.drawSprites(context.canvas);

  }

  @override
  void performLayout() {
    size = constraints.biggest;

    testFun();
  }

  void testFun() {
    playerLayer = StageLayer();
    enemyLayer = StageLayer();

    TextSprite player = TextSprite("測");
    player.setPosition(50, 50);

    TextSprite player2 = TextSprite("試");
    player2.setPosition(100, 100);

    playerLayer.addSprite(player);
    playerLayer.addSprite(player2);

  }

}