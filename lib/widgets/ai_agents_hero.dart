import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AiAgentsHero extends StatelessWidget {
  const AiAgentsHero({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Animated background with connecting nodes (neural net style)
        Positioned.fill(
          child: AnimatedBackground(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "AI Agents",
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ).animate().fadeIn(duration: 800.ms).slideY(begin: 0.3),
              const SizedBox(height: 20),
              Text(
                "Autonomous agents to automate business processes, execute tasks, and enable companies to operate without manual intervention.",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.white70,
                    ),
              ).animate().fadeIn(duration: 1000.ms).slideY(begin: 0.5),
            ],
          ),
        ),
      ],
    );
  }
}

// Example animated background widget (neural net style)
class AnimatedBackground extends StatefulWidget {
  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        // Simulate moving nodes and connecting lines
        return CustomPaint(
          painter: NeuralNetworkPainter(_controller.value),
          child: Container(),
        );
      },
    );
  }
}

// Simple neural network painter for background effect
class NeuralNetworkPainter extends CustomPainter {
  final double progress;
  NeuralNetworkPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final nodes = [
      Offset(size.width * 0.2, size.height * 0.3 + 20 * progress),
      Offset(size.width * 0.5, size.height * 0.18 + 60 * progress),
      Offset(size.width * 0.7, size.height * 0.6 - 40 * progress),
      Offset(size.width * 0.4, size.height * 0.8 - 30 * progress),
      Offset(size.width * 0.8, size.height * 0.42 + 40 * progress),
    ];
    final paintNode = Paint()..color = Colors.white.withOpacity(0.85);
    final paintLine = Paint()
      ..color = Colors.cyanAccent.withOpacity(0.4)
      ..strokeWidth = 2;

    // Draw lines between nodes
    for (var i = 0; i < nodes.length - 1; i++) {
      for (var j = i + 1; j < nodes.length; j++) {
        canvas.drawLine(nodes[i], nodes[j], paintLine);
      }
    }

    // Draw nodes
    for (final node in nodes) {
      canvas.drawCircle(node, 12, paintNode);
    }
  }

  @override
  bool shouldRepaint(covariant NeuralNetworkPainter oldDelegate) =>
      oldDelegate.progress != progress;
}