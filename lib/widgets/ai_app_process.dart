import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../theme.dart';

class AIAppProcess extends StatefulWidget {
  const AIAppProcess({super.key});

  @override
  State<AIAppProcess> createState() => _AIAppProcessState();
}

class _AIAppProcessState extends State<AIAppProcess>
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

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startAnimation();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _startAnimation() {
    if (mounted) {
      setState(() => _isVisible = true);
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveBreakpoints.of(context).isMobile;
    
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      color: Theme.of(context).colorScheme.surface,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: Column(
          children: [
            // Section Header
            Text(
              'Our Development Process',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              textAlign: TextAlign.center,
            )
                .animate()
                .fadeIn(delay: 200.ms, duration: 800.ms)
                .slideY(begin: 0.3, end: 0),
            
            const SizedBox(height: 16),
            
            Container(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Text(
                'From concept to deployment, we follow a structured approach to deliver exceptional AI-powered applications that exceed expectations.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              )
                  .animate()
                  .fadeIn(delay: 400.ms, duration: 800.ms)
                  .slideY(begin: 0.2, end: 0),
            ),
            
            const SizedBox(height: 60),
            
            // Process Steps
            if (isMobile) _buildMobileProcess(context) else _buildDesktopProcess(context),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopProcess(BuildContext context) {
    return Column(
      children: [
        // Progress line
        Container(
          height: 4,
          margin: const EdgeInsets.symmetric(horizontal: 60),
          child: AnimatedBuilder(
            animation: _progressAnimation,
            builder: (context, child) {
              return CustomPaint(
                painter: ProcessLinePainter(
                  colorScheme: Theme.of(context).colorScheme,
                  progress: _progressAnimation.value,
                ),
                size: const Size(double.infinity, 4),
              );
            },
          ),
        ),
        
        const SizedBox(height: 40),
        
        // Process steps
        Row(
          children: [
            _buildProcessStep(
              context,
              1,
              'Discovery & Strategy',
              'We begin by understanding your business goals, target users, and the specific challenges you\'re trying to solve. This allows us to develop a comprehensive strategy for your AI application that aligns with your objectives and delivers real value.',
              Icons.explore,
              Duration.zero,
            ),
            _buildProcessStep(
              context,
              2,
              'AI Architecture & Design',
              'Our team designs the AI architecture and user interface for your application, determining the optimal AI technologies to incorporate and how they will enhance the user experience. We create interactive prototypes to visualize the concept before development begins.',
              Icons.architecture,
              const Duration(milliseconds: 200),
            ),
            _buildProcessStep(
              context,
              3,
              'Development & AI Integration',
              'We build your application using industry best practices and cutting-edge technologies, seamlessly integrating AI capabilities. Our development process is agile and transparent, with regular updates and opportunities for feedback.',
              Icons.code,
              const Duration(milliseconds: 400),
            ),
            _buildProcessStep(
              context,
              4,
              'Testing & Refinement',
              'We conduct thorough testing of both the application functionality and AI components, refining the algorithms and user experience based on real-world data and feedback to ensure optimal performance.',
              Icons.bug_report,
              const Duration(milliseconds: 600),
            ),
            _buildProcessStep(
              context,
              5,
              'Deployment & Ongoing Support',
              'We deploy your AI application and provide ongoing support and maintenance, including AI model updates, feature enhancements, and performance optimization to ensure long-term success.',
              Icons.rocket_launch,
              const Duration(milliseconds: 800),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMobileProcess(BuildContext context) {
    final steps = [
      {
        'number': 1,
        'title': 'Discovery & Strategy',
        'description': 'We begin by understanding your business goals, target users, and the specific challenges you\'re trying to solve. This allows us to develop a comprehensive strategy for your AI application that aligns with your objectives and delivers real value.',
        'icon': Icons.explore,
      },
      {
        'number': 2,
        'title': 'AI Architecture & Design',
        'description': 'Our team designs the AI architecture and user interface for your application, determining the optimal AI technologies to incorporate and how they will enhance the user experience. We create interactive prototypes to visualize the concept before development begins.',
        'icon': Icons.architecture,
      },
      {
        'number': 3,
        'title': 'Development & AI Integration',
        'description': 'We build your application using industry best practices and cutting-edge technologies, seamlessly integrating AI capabilities. Our development process is agile and transparent, with regular updates and opportunities for feedback.',
        'icon': Icons.code,
      },
      {
        'number': 4,
        'title': 'Testing & Refinement',
        'description': 'We conduct thorough testing of both the application functionality and AI components, refining the algorithms and user experience based on real-world data and feedback to ensure optimal performance.',
        'icon': Icons.bug_report,
      },
      {
        'number': 5,
        'title': 'Deployment & Ongoing Support',
        'description': 'We deploy your AI application and provide ongoing support and maintenance, including AI model updates, feature enhancements, and performance optimization to ensure long-term success.',
        'icon': Icons.rocket_launch,
      },
    ];

    return Column(
      children: steps.asMap().entries.map((entry) {
        int index = entry.key;
        Map<String, dynamic> step = entry.value;
        
        return Column(
          children: [
            _buildMobileProcessStep(
              context,
              step['number'],
              step['title'],
              step['description'],
              step['icon'],
              Duration(milliseconds: index * 200),
            ),
            if (index < steps.length - 1) 
              _buildVerticalConnector(context, Duration(milliseconds: index * 200 + 100)),
          ],
        );
      }).toList(),
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
    return Expanded(
      child: Column(
        children: [
          // Step circle
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.primary,
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: Theme.of(context).colorScheme.onPrimary,
                  size: 24,
                ),
                const SizedBox(height: 2),
                Text(
                  stepNumber.toString(),
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
              .animate()
              .fadeIn(delay: Duration(milliseconds: 600 + delay.inMilliseconds), duration: 600.ms)
              .scale(begin: const Offset(0.5, 0.5))
              .shimmer(delay: Duration(milliseconds: 1200 + delay.inMilliseconds), duration: 1500.ms),
          
          const SizedBox(height: 24),
          
          // Step content
          Container(
            constraints: const BoxConstraints(maxWidth: 200),
            child: Column(
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  textAlign: TextAlign.center,
                )
                    .animate()
                    .fadeIn(delay: Duration(milliseconds: 800 + delay.inMilliseconds), duration: 600.ms)
                    .slideY(begin: 0.2, end: 0),
                
                const SizedBox(height: 12),
                
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                    height: 1.4,
                  ),
                  textAlign: TextAlign.center,
                )
                    .animate()
                    .fadeIn(delay: Duration(milliseconds: 1000 + delay.inMilliseconds), duration: 600.ms)
                    .slideY(begin: 0.2, end: 0),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileProcessStep(
    BuildContext context,
    int stepNumber,
    String title,
    String description,
    IconData icon,
    Duration delay,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Step circle
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).colorScheme.primary,
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Theme.of(context).colorScheme.onPrimary,
                size: 20,
              ),
              const SizedBox(height: 2),
              Text(
                stepNumber.toString(),
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        )
            .animate()
            .fadeIn(delay: Duration(milliseconds: 600 + delay.inMilliseconds), duration: 600.ms)
            .scale(begin: const Offset(0.5, 0.5)),
        
        const SizedBox(width: 20),
        
        // Step content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              )
                  .animate()
                  .fadeIn(delay: Duration(milliseconds: 700 + delay.inMilliseconds), duration: 600.ms)
                  .slideX(begin: 0.2, end: 0),
              
              const SizedBox(height: 8),
              
              Text(
                description,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                  height: 1.4,
                ),
              )
                  .animate()
                  .fadeIn(delay: Duration(milliseconds: 800 + delay.inMilliseconds), duration: 600.ms)
                  .slideX(begin: 0.2, end: 0),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildVerticalConnector(BuildContext context, Duration delay) {
    return Container(
      width: 2,
      height: 40,
      margin: const EdgeInsets.only(left: 29),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.primary.withOpacity(0.3),
          ],
        ),
      ),
    )
        .animate()
        .fadeIn(delay: Duration(milliseconds: 900 + delay.inMilliseconds), duration: 400.ms)
        .scaleY(begin: 0.0, end: 1.0);
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
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    // Background line
    paint.color = colorScheme.outline.withOpacity(0.3);
    canvas.drawLine(
      Offset(0, size.height / 2),
      Offset(size.width, size.height / 2),
      paint,
    );

    // Progress line
    paint.shader = LinearGradient(
      colors: [
        colorScheme.primary,
        colorScheme.secondary,
      ],
    ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    
    canvas.drawLine(
      Offset(0, size.height / 2),
      Offset(size.width * progress, size.height / 2),
      paint,
    );
  }

  @override
  bool shouldRepaint(ProcessLinePainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}