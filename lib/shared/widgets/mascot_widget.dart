import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class MascotWidget extends StatelessWidget {
  final double size;
  final String emotion; // 'happy', 'thinking', 'celebrating', 'sad'
  final bool animated;

  const MascotWidget({
    super.key,
    this.size = 120,
    this.emotion = 'happy',
    this.animated = true,
  });

  String get _emoji {
    switch (emotion) {
      case 'thinking':
        return '🐰';
      case 'celebrating':
        return '🎉';
      case 'sad':
        return '🥺';
      case 'happy':
      default:
        return '🐰';
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget rabbit = Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color(0xFF7CB342),
          width: 4,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF7CB342).withValues(alpha: 0.3),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Center(
        child: Text(
          _emoji,
          style: TextStyle(fontSize: size * 0.55),
        ),
      ),
    );

    if (!animated) return rabbit;

    // Duyguya göre animasyon
    switch (emotion) {
      case 'celebrating':
        return rabbit
            .animate(onPlay: (c) => c.repeat())
            .shake(duration: 600.ms, hz: 4)
            .scaleXY(begin: 1, end: 1.15, duration: 300.ms);
      
      case 'thinking':
        return rabbit
            .animate(onPlay: (c) => c.repeat(reverse: true))
            .rotate(begin: -0.05, end: 0.05, duration: 1000.ms);
      
      case 'sad':
        return rabbit
            .animate(onPlay: (c) => c.repeat(reverse: true))
            .moveY(begin: 0, end: 5, duration: 800.ms);
      
      case 'happy':
      default:
        return rabbit
            .animate(onPlay: (c) => c.repeat(reverse: true))
            .moveY(begin: 0, end: -10, duration: 800.ms, curve: Curves.easeInOut);
    }
  }
}