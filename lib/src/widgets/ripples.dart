import 'package:flutter/material.dart';
import 'package:lectly_client_user_mobile/src/constants/colors.dart';
import 'package:lectly_client_user_mobile/src/widgets/buttons/record_button_widget.dart';

import 'animation.dart';
import 'containers/background_container_widget.dart';
import 'curve_waves.dart';

class RipplesAnimation extends StatefulWidget {
  const RipplesAnimation({
    Key? key,
    this.size = 80.0,
    this.color = AppColors.accentColor,
    required this.child,
  }) : super(key: key);
  final double size;
  final Color color;
  final Widget child;
  @override
  _RipplesAnimationState createState() => _RipplesAnimationState(child);
}

class _RipplesAnimationState extends State<RipplesAnimation>
    with TickerProviderStateMixin {
  Widget child;
  _RipplesAnimationState(this.child);
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _button() {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(widget.size),
        child: DecoratedBox(
          decoration: BoxDecoration(gradient: AppColors.background),
          child: ScaleTransition(
              scale: Tween(begin: 0.98, end: 1.0).animate(
                CurvedAnimation(
                  parent: _controller,
                  curve: const CurveWave(),
                ),
              ),
              child: child),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CirclePainter(
        _controller,
        color: widget.color,
      ),
      child: SizedBox(
        width: widget.size * 4.125,
        height: widget.size * 4.125,
        child: _button(),
      ),
    );
  }
}
