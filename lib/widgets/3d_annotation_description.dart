import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../theme.dart';

class ThreeDAnnotationDescription extends StatefulWidget {
  const ThreeDAnnotationDescription({super.key});

  @override
  State<ThreeDAnnotationDescription> createState() => _ThreeDAnnotationDescriptionState();
}

class _ThreeDAnnotationDescriptionState extends State<ThreeDAnnotationDescription>
    with TickerProviderStateMixin {
  late AnimationController _rotateController;
  late AnimationController _pulseController;
  late AnimationController _liveProjectController;

  @override
  void initState() {
    super.initState();
    _rotateController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat();
    
    _pulseController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    
    // Live Project animation controller
    _liveProjectController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _rotateController.dispose();
    _pulseController.dispose();
    _liveProjectController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveBreakpoints.of(context).largerThan(TABLET);
    
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : 24,
        vertical: isDesktop ? 120 : 80,
      ),
      child: isDesktop ? _buildDesktopLayout(context) : _buildMobileLayout(context),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 1200),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: _buildTextContent(context),
          ),
          const SizedBox(width: 80),
          Expanded(
            flex: 2,
            child: _buildLiveProjectImageContent(context),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        _buildTextContent(context),
        const SizedBox(height: 60),
        _buildLiveProjectImageContent(context),
      ],
    );
  }

  Widget _buildTextContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Main Title
        Text(
          'What is 3D Point Cloud Annotation?',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w700,
            color: Theme.of(context).colorScheme.onSurface,
            height: 1.2,
          ),
        )
            .animate()
            .fadeIn(duration: 800.ms)
            .slideX(begin: -0.3, end: 0),
        
        const SizedBox(height: 24),
        
        // Description
        Text(
          '3D Point Cloud Annotation is the process of labeling and categorizing three-dimensional spatial data captured by LiDAR sensors, depth cameras, and other 3D scanning technologies. This specialized form of data annotation transforms raw point cloud data into structured information that AI systems can interpret and learn from.',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            height: 1.6,
          ),
        )
            .animate(delay: 200.ms)
            .fadeIn(duration: 800.ms)
            .slideX(begin: -0.3, end: 0),
        
        const SizedBox(height: 32),
        
        // Our Services Section
        Text(
          'At ImplementAI MH UG, we provide expert 3D annotation services to help you build robust perception models for autonomous vehicles, robotics, smart city applications, and other spatial AI systems. Our team specializes in creating precise 3D bounding boxes, semantic segmentation, and instance segmentation for point cloud data.',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            height: 1.6,
          ),
        )
            .animate(delay: 400.ms)
            .fadeIn(duration: 800.ms)
            .slideX(begin: -0.3, end: 0),
        
        const SizedBox(height: 32),
        
        // Expertise Section
        Text(
          'We combine specialized annotation tools with skilled human annotators to deliver high-quality 3D datasets that enable your AI systems to accurately perceive and interpret the three-dimensional world around them.',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            height: 1.6,
          ),
        )
            .animate(delay: 600.ms)
            .fadeIn(duration: 800.ms)
            .slideX(begin: -0.3, end: 0),
        
        const SizedBox(height: 48),
        
        // 3D Applications
        _build3DApplications(context),
        
        const SizedBox(height: 48),
        
        // CTA Button
        ElevatedButton.icon(
          onPressed: () {
            Navigator.pushNamed(context, '/book-demo');
          },
          icon: Icon(
            Icons.calendar_month,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          label: Text(
            'Book A Consultation',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        )
            .animate(delay: 1200.ms)
            .fadeIn(duration: 600.ms)
            .slideY(begin: 0.3, end: 0)
            .then()
            .shimmer(duration: 2000.ms, color: Colors.white.withOpacity(0.3)),
      ],
    );
  }

  Widget _build3DApplications(BuildContext context) {
    final applications = [
      {'icon': Icons.directions_car, 'title': 'Autonomous Vehicles', 'description': 'Perception models for self-driving cars'},
      {'icon': Icons.precision_manufacturing, 'title': 'Robotics', 'description': 'Spatial awareness for robotic systems'},
      {'icon': Icons.location_city, 'title': 'Smart Cities', 'description': 'Urban planning and traffic management'},
      {'icon': Icons.view_in_ar, 'title': '3D Mapping', 'description': 'High-precision spatial mapping'},
      {'icon': Icons.security, 'title': 'Surveillance', 'description': '3D security and monitoring systems'},
      {'icon': Icons.architecture, 'title': 'Construction', 'description': 'Building information modeling'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '3D Annotation Applications We Support',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        )
            .animate(delay: 800.ms)
            .fadeIn(duration: 600.ms)
            .slideX(begin: -0.3, end: 0),
        
        const SizedBox(height: 24),
        
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: ResponsiveBreakpoints.of(context).largerThan(TABLET) ? 2 : 1,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: ResponsiveBreakpoints.of(context).largerThan(TABLET) ? 3.5 : 4,
          ),
          itemCount: applications.length,
          itemBuilder: (context, index) {
            final app = applications[index];
            return Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      app['icon'] as IconData,
                      color: Theme.of(context).colorScheme.primary,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          app['title'] as String,
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          app['description'] as String,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
                .animate(delay: Duration(milliseconds: 1000 + (index * 100)))
                .fadeIn(duration: 600.ms)
                .slideY(begin: 0.3, end: 0);
          },
        ),
      ],
    );
  }

  Widget _buildLiveProjectImageContent(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 400,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.green.withOpacity(0.3),
                blurRadius: 30,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                // Background image (3d-ann2.png)
                Positioned.fill(
                  child: Image.asset(
                    '3d-ann2.png',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.green.withOpacity(0.8),
                              Colors.teal.withOpacity(0.8),
                            ],
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.play_circle_filled,
                            size: 60,
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                
                // Animated overlay gradient
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.6),
                      ],
                    ),
                  ),
                ),
                
                // Live Project label with cool animation
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: AnimatedBuilder(
                    animation: _liveProjectController,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: 1 + (0.05 * _liveProjectController.value),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                          decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.green.withOpacity(0.6),
                                blurRadius: 20 * (1 + _liveProjectController.value),
                                spreadRadius: 2 * _liveProjectController.value,
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AnimatedBuilder(
                                animation: _liveProjectController,
                                builder: (context, child) {
                                  return Transform.rotate(
                                    angle: _liveProjectController.value * 2 * 3.14159,
                                    child: Container(
                                      width: 10,
                                      height: 10,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.white.withOpacity(0.8),
                                            blurRadius: 10,
                                            spreadRadius: 2,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(width: 12),
                              Text(
                                'LIVE PROJECT',
                                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                
                // Recording indicator
                Positioned(
                  top: 15,
                  right: 15,
                  child: AnimatedBuilder(
                    animation: _pulseController,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: 1 + (0.1 * _pulseController.value),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.red.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 6,
                                height: 6,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'REC',
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        
        // Enhanced floating 3D indicators (existing ones)
        ..._buildFloating3DIndicators(context),
      ],
    )
        .animate(delay: 600.ms)
        .fadeIn(duration: 800.ms)
        .slideY(begin: 0.3, end: 0)
        .then()
        .shimmer(
          duration: 3000.ms,
          color: Colors.green.withOpacity(0.2),
        );
  }

  List<Widget> _buildFloating3DIndicators(BuildContext context) {
    return [
      Positioned(
        top: 30,
        right: 30,
        child: AnimatedBuilder(
          animation: _rotateController,
          builder: (context, child) {
            return Transform.rotate(
              angle: _rotateController.value * 2 * 3.14159,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.tertiary.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.view_in_ar,
                      size: 16,
                      color: Theme.of(context).colorScheme.onTertiary,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '3D Objects',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onTertiary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      Positioned(
        bottom: 80,
        left: 20,
        child: AnimatedBuilder(
          animation: _pulseController,
          builder: (context, child) {
            return Transform.scale(
              scale: 1 + (_pulseController.value * 0.1),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.scatter_plot,
                      size: 16,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '2.3M Points',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      Positioned(
        top: 120,
        left: 40,
        child: AnimatedBuilder(
          animation: _rotateController,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, (_rotateController.value - 0.5) * 10),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.radar,
                      size: 16,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'LiDAR',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSecondary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    ];
  }
}