import 'package:alia_dev_test/app/App_Helpers/Constants.dart';
import 'package:alia_dev_test/app/App_Helpers/helpers.dart';
import 'package:flutter/material.dart';

class CustomVerticalSlider extends StatefulWidget {
  final double min;
  final double max;
  final double value;
  final ValueChanged<double> onChanged;

  const CustomVerticalSlider({
    Key? key,
    required this.min,
    required this.max,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  _CustomVerticalSliderState createState() => _CustomVerticalSliderState();
}

class _CustomVerticalSliderState extends State<CustomVerticalSlider> {
  @override
  Widget build(BuildContext context) {
    int divisions = ((widget.max - widget.min) / 10).round(); // Calculate the number of divisions

    return RotatedBox(
      quarterTurns: 3,
      child: SliderTheme(
        data: SliderTheme.of(context).copyWith(
          activeTrackColor: getPrimaryColor(),
          inactiveTrackColor: HexColor("F1EDE3"),
          trackHeight: 22.0,
          thumbShape: CustomSliderThumbCircle(
            thumbRadius: 25,
            emoji: "😃",
          ),
          overlayColor: getPrimaryColor().withAlpha(32),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
        ),
        child: Slider(
          value: widget.value,
          min: widget.min,
          max: widget.max,
          divisions: divisions,
          onChanged: (value) {
            double roundedValue = (value / 10).round() * 10.0; // Round to nearest multiple of 10
            widget.onChanged(roundedValue);
          },
        ),
      ),
    );
  }
}

class CustomSliderThumbCircle extends SliderComponentShape {
  final double thumbRadius;
  final String emoji;

  CustomSliderThumbCircle({
    required this.thumbRadius,
    required this.emoji,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    final paint = Paint()
      ..color = sliderTheme.thumbColor!
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, thumbRadius, paint);

    TextSpan span = TextSpan(
      style: TextStyle(
        fontSize: thumbRadius,
        color: Colors.black,
      ),
      text: emoji,
    );

    TextPainter tp = TextPainter(
      text: span,
      textAlign: TextAlign.center,
      textDirection: textDirection,
    );
    tp.layout();
    tp.paint(
      canvas,
      Offset(center.dx - tp.width / 2, center.dy - tp.height / 2),
    );
  }
}
