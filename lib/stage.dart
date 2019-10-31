
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:text_shooting/layer/stage_layer.dart';
import 'package:text_shooting/sprite/text_player_sprite.dart';

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

  }

  @override
  void performLayout() {
    size = constraints.biggest;

    testFun();
  }

  void testFun() {
    playerLayer = StageLayer();
    enemyLayer = StageLayer();

    TextPlayerSprite player = TextPlayerSprite("測");
    

  }

}