import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../theme.dart';

class ThreeDAnnotationHero extends StatefulWidget {
  const ThreeDAnnotationHero({super.key});

  @override
  State<ThreeDAnnotationHero> createState() => _ThreeDAnnotationHeroState();
}

class _ThreeDAnnotationHeroState extends State<ThreeDAnnotationHero>
    with TickerProviderStateMixin {
  late AnimationController _imageController;
  late AnimationController _particleController;
  late AnimationController _glowController;
  int _currentImageIndex = 0;
  
  final List<String> _imageAssets = [
    '3d-ann.png',
    '3d-ann1.png',
    '3d-ann3.png',
    '3d-ann4.png',
  ];

  @override
  void initState() {
    super.initState();
    
    // Image transition controller - 1 second intervals
    _imageController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    
    // Particle animation controller
    _particleController = AnimationController(
      duration: const Duration(seconds: 8),
      vsync: this,
    )..repeat();
    
    // Glow effect controller
    _glowController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);
    
    // Start image transition cycle
    _startImageTransition();
  }

  void _startImageTransition() {
    _imageController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _currentImageIndex = (_currentImageIndex + 1) % _imageAssets.length;
        });
        _imageController.reset();
        // Quick transition - 1 second total
        Future.delayed(const Duration(milliseconds: 100), () {
          if (mounted) {
            _imageController.forward();
          }
        });
      }
    });
    _imageController.forward();
  }

  @override
  void dispose() {
    _imageController.dispose();
    _particleController.dispose();
    _glowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveBreakpoints.of(context).largerThan(TABLET);
    
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: isDesktop ? 80 : 24,
          vertical: isDesktop ? 80 : 60,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Theme.of(context).colorScheme.tertiary.withOpacity(0.05),
              Theme.of(context).colorScheme.primary.withOpacity(0.05),
            ],
          ),
        ),
        child: Column(
          children: [
            // Breadcrumb Navigation
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 40),
              child: Wrap(
                children: [
                  _buildBreadcrumbItem(context, 'Home', false),
                  _buildBreadcrumbSeparator(context),
                  _buildBreadcrumbItem(context, 'Data Annotation', false),
                  _buildBreadcrumbSeparator(context),
                  _buildBreadcrumbItem(context, '3D Point Cloud Annotation', true),
                ],
              ),
            ),
            
            // Hero Content
            Container(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Column(
                children: [
                  // Title Section
                  Text(
                    '3D Point Cloud Annotation',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.onSurface,
                      height: 1.1,
                    ),
                    textAlign: TextAlign.center,
                  )
                      .animate()
                      .fadeIn(duration: 800.ms)
                      .slideY(begin: 0.3, end: 0),
                  
                  const SizedBox(height: 24),
                  
                  // Subtitle
                  Container(
                    constraints: const BoxConstraints(maxWidth: 800),
                    child: Text(
                      'Transform raw 3D spatial data into structured information for autonomous vehicles, robotics, and smart city applications through precise point cloud annotation.',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        height: 1.5,
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.center,
                    )
                        .animate(delay: 200.ms)
                        .fadeIn(duration: 800.ms)
                        .slideY(begin: 0.3, end: 0),
                  ),
                  
                  const SizedBox(height: 60),
                  
                  // Animated 3D Images Section (Main Animation Area)
                  _buildAnimated3DSection(context, isDesktop),
                  
                  const SizedBox(height: 60),
                  
                  // 3D Annotation Capabilities
                  isDesktop ? _buildDesktopCapabilities(context) : _buildMobileCapabilities(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimated3DSection(BuildContext context, bool isDesktop) {
    return Container(
      height: isDesktop ? 400 : 250,
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Animated background glow
          AnimatedBuilder(
            animation: _glowController,
            builder: (context, child) {
              return Container(
                width: isDesktop ? 500 : 280,
                height: isDesktop ? 320 : 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.primary.withOpacity(
                        0.3 * (0.7 + 0.3 * _glowController.value),
                      ),
                      blurRadius: 40 * (1 + _glowController.value * 0.5),
                      spreadRadius: 10 * _glowController.value,
                    ),
                  ],
                ),
              );
            },
          ),
          
          // Main animated image container with 4 images
          AnimatedBuilder(
            animation: _imageController,
            builder: (context, child) {
              return Transform.scale(
                scale: 0.95 + (0.05 * (1 - (_imageController.value - 0.5).abs() * 2)),
                child: Container(
                  width: isDesktop ? 450 : 260,
                  height: isDesktop ? 280 : 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 30,
                        offset: const Offset(0, 15),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Stack(
                      children: [
                        // Current image with fade transition
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 600),
                          transitionBuilder: (Widget child, Animation<double> animation) {
                            return FadeTransition(
                              opacity: animation,
                              child: ScaleTransition(
                                scale: Tween<double>(
                                  begin: 0.9,
                                  end: 1.0,
                                ).animate(CurvedAnimation(
                                  parent: animation,
                                  curve: Curves.easeOutCubic,
                                )),
                                child: child,
                              ),
                            );
                          },
                          child: Container(
                            key: ValueKey<int>(_currentImageIndex),
                            child: Image.asset(
                              _imageAssets[_currentImageIndex],
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Theme.of(context).colorScheme.primary.withOpacity(0.8),
                                        Theme.of(context).colorScheme.tertiary.withOpacity(0.8),
                                      ],
                                    ),
                                  ),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.view_in_ar,
                                          size: isDesktop ? 60 : 40,
                                          color: Colors.white,
                                        ),
                                        const SizedBox(height: 12),
                                        Text(
                                          '3D Point Cloud ${_currentImageIndex + 1}',
                                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        
                        // Image counter indicator
                        Positioned(
                          top: 12,
                          left: 12,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              '${_currentImageIndex + 1}/4',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          
          // Enhanced floating particles
          ..._buildFloatingParticles(context, isDesktop),
          
          // 3D annotation labels
          ..._buildFloating3DLabels(context, isDesktop),
        ],
      ),
    )
        .animate(delay: 600.ms)
        .fadeIn(duration: 1000.ms)
        .slideY(begin: 0.3, end: 0);
  }

  List<Widget> _buildFloatingParticles(BuildContext context, bool isDesktop) {
    return List.generate(8, (index) {
      return AnimatedBuilder(
        animation: _particleController,
        builder: (context, child) {
          final offset = (_particleController.value + (index * 0.125)) % 1.0;
          final radius = isDesktop ? 250 : 150;
          final x = radius * 0.8 * (offset - 0.5) + (30 * (index % 4));
          final y = 40 * (offset - 0.5) * (index % 2 == 0 ? 1 : -1) + (15 * ((index % 3) - 1));
          
          return Transform.translate(
            offset: Offset(x, y),
            child: Transform.scale(
              scale: 0.4 + (0.6 * ((offset + 0.5) % 1.0)),
              child: Container(
                width: 5 + (index % 2) * 2,
                height: 5 + (index % 2) * 2,
                decoration: BoxDecoration(
                  color: [
                    Theme.of(context).colorScheme.primary,
                    Theme.of(context).colorScheme.secondary,
                    Theme.of(context).colorScheme.tertiary,
                  ][index % 3].withOpacity(0.7),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: [
                        Theme.of(context).colorScheme.primary,
                        Theme.of(context).colorScheme.secondary,
                        Theme.of(context).colorScheme.tertiary,
                      ][index % 3].withOpacity(0.3),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    });
  }

  List<Widget> _buildFloating3DLabels(BuildContext context, bool isDesktop) {
    return [
      // Top-right label
      Positioned(
        top: isDesktop ? 30 : 15,
        right: isDesktop ? 50 : 25,
        child: AnimatedBuilder(
          animation: _particleController,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, 8 * (_particleController.value - 0.5)),
              child: _buildFloatingLabel(
                context,
                Icons.view_in_ar,
                'Bounding Boxes',
                Theme.of(context).colorScheme.primary,
              ),
            );
          },
        ),
      ),
      
      // Bottom-left label
      Positioned(
        bottom: isDesktop ? 50 : 25,
        left: isDesktop ? 30 : 15,
        child: AnimatedBuilder(
          animation: _particleController,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, -12 * (_particleController.value - 0.5)),
              child: _buildFloatingLabel(
                context,
                Icons.scatter_plot,
                'Point Cloud',
                Theme.of(context).colorScheme.secondary,
              ),
            );
          },
        ),
      ),
      
      // Top-left label
      Positioned(
        top: isDesktop ? 60 : 30,
        left: isDesktop ? 60 : 30,
        child: AnimatedBuilder(
          animation: _glowController,
          builder: (context, child) {
            return Transform.scale(
              scale: 1 + (0.08 * _glowController.value),
              child: _buildFloatingLabel(
                context,
                Icons.radar,
                'LiDAR',
                Theme.of(context).colorScheme.tertiary,
              ),
            );
          },
        ),
      ),
    ];
  }

  Widget _buildFloatingLabel(BuildContext context, IconData icon, String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.9),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: Colors.white),
          const SizedBox(width: 4),
          Text(
            text,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBreadcrumbItem(BuildContext context, String text, bool isActive) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isActive 
            ? Theme.of(context).colorScheme.primary.withOpacity(0.1)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: isActive 
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.onSurfaceVariant,
          fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildBreadcrumbSeparator(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Icon(
        Icons.chevron_right,
        size: 16,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
    );
  }

  Widget _buildDesktopCapabilities(BuildContext context) {
    return Wrap(
      spacing: 20,
      runSpacing: 20,
      alignment: WrapAlignment.center,
      children: [
        _buildCapabilityItem(context, Icons.view_in_ar, '3D Bounding\nBoxes', 0),
        _buildCapabilityItem(context, Icons.scatter_plot, 'Point Cloud\nSegmentation', 200),
        _buildCapabilityItem(context, Icons.radar, 'LiDAR\nProcessing', 400),
        _buildCapabilityItem(context, Icons.precision_manufacturing, 'Spatial\nAnalysis', 600),
      ],
    );
  }

  Widget _buildMobileCapabilities(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(child: _buildCapabilityItem(context, Icons.view_in_ar, '3D Bounding\nBoxes', 0)),
            const SizedBox(width: 16),
            Expanded(child: _buildCapabilityItem(context, Icons.scatter_plot, 'Point\nSegmentation', 200)),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(child: _buildCapabilityItem(context, Icons.radar, 'LiDAR\nProcessing', 400)),
            const SizedBox(width: 16),
            Expanded(child: _buildCapabilityItem(context, Icons.precision_manufacturing, 'Spatial\nAnalysis', 600)),
          ],
        ),
      ],
    );
  }

  Widget _buildCapabilityItem(BuildContext context, IconData icon, String label, int delay) {
    return Container(
      width: ResponsiveBreakpoints.of(context).largerThan(TABLET) ? 180 : null,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.tertiary.withOpacity(0.1),
            blurRadius: 15,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.tertiary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              size: 20,
              color: Theme.of(context).colorScheme.tertiary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    )
        .animate(delay: Duration(milliseconds: delay))
        .fadeIn(duration: 600.ms)
        .slideY(begin: 0.3, end: 0)
        .then()
        .shimmer(duration: 1000.ms, color: Theme.of(context).colorScheme.tertiary.withOpacity(0.3));
  }
}