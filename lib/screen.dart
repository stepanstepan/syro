import 'package:flutter/cupertino.dart';
import 'modules/markov.dart';
import 'modules/sequencer8.dart';
import 'modules/wire.dart';

const double DEFAULT_SCALE = 1.0;

class Screen extends StatefulWidget {
  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  double _scale = DEFAULT_SCALE;
  double _scaleBefore;
  Offset _startingFocalPoint;
  Offset _previousOffset;
  Offset _offset = new Offset(0.0, 0.0);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // behavior: HitTestBehavior.translucent,
      onScaleStart: (ScaleStartDetails details) {
        _scaleBefore = _scale;
        _previousOffset = _offset;
        _startingFocalPoint = details.focalPoint;
      },
      onScaleUpdate: (ScaleUpdateDetails details) {
        final double newScale = _scaleBefore * details.scale;
        final Offset normalizedOffset = (_startingFocalPoint - _previousOffset) / _scaleBefore;
        final Offset newOffset = details.focalPoint - normalizedOffset * newScale;

        setState(() {
          _scale = newScale;
          _offset = newOffset;
        });
      },
      child: Container(
        color: Color(0xff0d0d0d),
        child: Transform(
          transform: new Matrix4.identity()
            ..translate(_offset.dx, _offset.dy)
            ..scale(_scale),
          child: Stack(
            children: <Widget>[
              Sequencer8(x: 100, y: 200),
              Markov(x: 400, y: 500),
              Wire(startX: 117, startY: 383, endX: 417, endY: 515)
            ],
          )
        )
      )
    );
  }

}