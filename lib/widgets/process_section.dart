import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../theme.dart';

class ProcessSection extends StatefulWidget {
  const ProcessSection({super.key});

  @override
  State<ProcessSection> createState() => _ProcessSectionState();
}

class _ProcessSectionState extends State<ProcessSection>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _progressAnimation;
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    _progressAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _startAnimation() {
    if (!_isVisible) {
      setState(() {
        _isVisible = true;
      });
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            colorScheme.surface,
            colorScheme.surfaceVariant.withOpacity(0.3),
          ],
        ),
      ),
      child: Column(
        children: [
          // Section Header
          Column(
            children: [
              Text(
                'Our Process',
                style: textTheme.displaySmall?.copyWith(
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.w700,
                ),
              )
                  .animate()
                  .fadeIn(duration: 600.ms)
                  .slideY(begin: 0.3, end: 0),
              const SizedBox(height: 16),
              Container(
                constraints: const BoxConstraints(maxWidth: 600),
                child: Text(
                  'From initial consultation to final delivery, we follow a structured approach to ensure your AI project succeeds at every step.',
                  style: textTheme.bodyLarge?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    height: 1.6,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
                  .animate()
                  .fadeIn(duration: 600.ms, delay: 200.ms)
                  .slideY(begin: 0.3, end: 0),
            ],
          ),
          const SizedBox(height: 60),
          
          // Process Steps
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 900) {
                return _buildDesktopProcess(context);
              } else {
                return _buildMobileProcess(context);
              }
            },
          ),
          
          // Start Process Button
          const SizedBox(height: 60),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: colorScheme.primary.withOpacity(0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: ElevatedButton(
              onPressed: _startAnimation,
              style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.primary,
                foregroundColor: colorScheme.onPrimary,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.play_circle_filled,
                    color: colorScheme.onPrimary,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'See Process in Action',
                    style: textTheme.labelLarge?.copyWith(
                      color: colorScheme.onPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          )
              .animate()
              .fadeIn(duration: 600.ms, delay: 1000.ms)
              .scale(begin: const Offset(0.8, 0.8), end: const Offset(1, 1)),
        ],
      ),
    );
  }

  Widget _buildDesktopProcess(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return Container(
      constraints: const BoxConstraints(maxWidth: 1200),
      child: Column(
        children: [
          // Process Flow
          Stack(
            children: [
              // Connection Lines
              AnimatedBuilder(
                animation: _progressAnimation,
                builder: (context, child) {
                  return CustomPaint(
                    size: const Size(1200, 200),
                    painter: ProcessLinePainter(
                      colorScheme: colorScheme,
                      progress: _progressAnimation.value,
                    ),
                  );
                },
              ),
              
              // Process Steps
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildProcessStep(
                    context,
                    1,
                    'Consultation',
                    'Initial discussion about your needs and project requirements',
                    Icons.chat_bubble_outline,
                    0.ms,
                  ),
                  _buildProcessStep(
                    context,
                    2,
                    'Planning',
                    'Detailed project planning and timeline development',
                    Icons.engineering,
                    200.ms,
                  ),
                  _buildProcessStep(
                    context,
                    3,
                    'Development',
                    'Implementation and iterative development process',
                    Icons.code,
                    400.ms,
                  ),
                  _buildProcessStep(
                    context,
                    4,
                    'Testing',
                    'Quality assurance and comprehensive testing',
                    Icons.bug_report,
                    600.ms,
                  ),
                  _buildProcessStep(
                    context,
                    5,
                    'Delivery',
                    'Final delivery and ongoing support',
                    Icons.rocket_launch,
                    800.ms,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMobileProcess(BuildContext context) {
    return Column(
      children: [
        _buildProcessStep(
          context,
          1,
          'Consultation',
          'Initial discussion about your needs and project requirements',
          Icons.chat_bubble_outline,
          0.ms,
        ),
        _buildVerticalConnector(context, 0.ms),
        _buildProcessStep(
          context,
          2,
          'Planning',
          'Detailed project planning and timeline development',
          Icons.engineering,
          200.ms,
        ),
        _buildVerticalConnector(context, 200.ms),
        _buildProcessStep(
          context,
          3,
          'Development',
          'Implementation and iterative development process',
          Icons.code,
          400.ms,
        ),
        _buildVerticalConnector(context, 400.ms),
        _buildProcessStep(
          context,
          4,
          'Testing',
          'Quality assurance and comprehensive testing',
          Icons.bug_report,
          600.ms,
        ),
        _buildVerticalConnector(context, 600.ms),
        _buildProcessStep(
          context,
          5,
          'Delivery',
          'Final delivery and ongoing support',
          Icons.rocket_launch,
          800.ms,
        ),
      ],
    );
  }

  Widget _buildProcessStep(
    BuildContext context,
    int stepNumber,
    String title,
    String description,
    IconData icon,
    Duration delay,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    
    return Container(
      width: 200,
      child: Column(
        children: [
          // Step Circle
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  colorScheme.primary,
                  colorScheme.secondary,
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: colorScheme.primary.withOpacity(0.3),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Icon(
                  icon,
                  color: colorScheme.onPrimary,
                  size: 32,
                ),
                Positioned(
                  bottom: 5,
                  right: 5,
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: colorScheme.surface,
                      border: Border.all(
                        color: colorScheme.primary,
                        width: 2,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        stepNumber.toString(),
                        style: textTheme.labelMedium?.copyWith(
                          color: colorScheme.primary,
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
              .animate()
              .fadeIn(duration: 600.ms, delay: delay)
              .scale(begin: const Offset(0.5, 0.5), end: const Offset(1, 1))
              .then()
              .shimmer(duration: 1500.ms, delay: delay + 600.ms),
          
          const SizedBox(height: 16),
          
          // Step Content
          Column(
            children: [
              Text(
                title,
                style: textTheme.titleMedium?.copyWith(
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              )
                  .animate()
                  .fadeIn(duration: 600.ms, delay: delay + 300.ms)
                  .slideY(begin: 0.3, end: 0),
              
              const SizedBox(height: 8),
              
              Text(
                description,
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
              )
                  .animate()
                  .fadeIn(duration: 600.ms, delay: delay + 500.ms)
                  .slideY(begin: 0.3, end: 0),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildVerticalConnector(BuildContext context, Duration delay) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return Container(
      height: 40,
      width: 2,
      margin: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            colorScheme.primary.withOpacity(0.6),
            colorScheme.secondary.withOpacity(0.6),
          ],
        ),
      ),
    )
        .animate()
        .fadeIn(duration: 600.ms, delay: delay + 400.ms)
        .scaleY(begin: 0, end: 1);
  }
}

class ProcessLinePainter extends CustomPainter {
  final ColorScheme colorScheme;
  final double progress;

  ProcessLinePainter({
    required this.colorScheme,
    required this.progress,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = LinearGradient(
        colors: [
          colorScheme.primary,
          colorScheme.secondary,
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path();
    final stepWidth = size.width / 4;
    final y = size.height / 2;

    // Draw the connecting lines between process steps
    for (int i = 0; i < 4; i++) {
      final startX = (i + 1) * stepWidth - stepWidth * 0.4;
      final endX = (i + 1) * stepWidth + stepWidth * 0.4;
      final currentProgress = (progress * 4 - i).clamp(0.0, 1.0);
      
      if (currentProgress > 0) {
        final currentEndX = startX + (endX - startX) * currentProgress;
        path.moveTo(startX, y);
        path.lineTo(currentEndX, y);
      }
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(ProcessLinePainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}