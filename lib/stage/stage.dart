
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:text_shooting/stage/director.dart';

class Stage extends RenderBox {

  static const double TIME_STEP = 1 / 60;
  int _frameCallbackId;

  Director director;

  Stage(BuildContext context) {}

  void _scheduleTick() {
    _frameCallbackId = SchedulerBinding.instance.scheduleFrameCallback(_tick);

//    if(director != null) {
//      director.testAct();
//    }
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

    if(director != null) {

      director.testAct();

      director.drawLayer(context.canvas);
    }

  }

  @override
  void performLayout() {
    size = constraints.biggest;

    director = new Director(size.width, size.height);
    director.initSetting();
  }

}