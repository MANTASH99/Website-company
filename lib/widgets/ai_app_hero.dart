import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:video_player/video_player.dart';
import '../theme.dart';

class AIAppDevelopmentHero extends StatefulWidget {
  const AIAppDevelopmentHero({super.key});

  @override
  State<AIAppDevelopmentHero> createState() => _AIAppDevelopmentHeroState();
}

class _AIAppDevelopmentHeroState extends State<AIAppDevelopmentHero>
    with TickerProviderStateMixin {
  VideoPlayerController? _videoController;
  bool _isVideoInitialized = false;
  late AnimationController _fadeController;
  late AnimationController _pulseController;
  late AnimationController _floatController;
  late AnimationController _rotateController;
  late AnimationController _bounceController;

  @override
  void initState() {
    super.initState();
    
    _fadeController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    
    _pulseController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    
    _floatController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);
    
    _rotateController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat();
    
    _bounceController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);
    
    _initializeVideo();
  }

  Future<void> _initializeVideo() async {
    try {
      _videoController = VideoPlayerController.asset('app-dev.mp4');
      
      await _videoController!.initialize();
      
      if (mounted) {
        setState(() {
          _isVideoInitialized = true;
        });
        
        _videoController!.setLooping(true);
        _videoController!.setVolume(0.0); // Muted
        _videoController!.play();
        _fadeController.forward();
      }
    } catch (e) {
      print('Error initializing video: $e');
      if (mounted) {
        setState(() {
          _isVideoInitialized = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _videoController?.dispose();
    _fadeController.dispose();
    _pulseController.dispose();
    _floatController.dispose();
    _rotateController.dispose();
    _bounceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveBreakpoints.of(context).largerThan(TABLET);
    
    return Container(
      width: double.infinity,
      height: isDesktop ? 500 : 400,
      margin: EdgeInsets.only(
        top: isDesktop ? 20 : 16,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(isDesktop ? 20 : 16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(isDesktop ? 20 : 16),
        child: Stack(
          children: [
            // Video Background
            Positioned.fill(
              child: _buildVideoBackground(context),
            ),
            
            // Gradient Overlay
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.2),
                      Colors.black.withOpacity(0.5),
                    ],
                  ),
                ),
              ),
            ),
            
            // Hero Content
            Positioned.fill(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: isDesktop ? 60 : 24,
                  vertical: isDesktop ? 60 : 40,
                ),
                child: Column(
                  children: [
                    // Breadcrumb Navigation
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(bottom: 30),
                      child: Wrap(
                        children: [
                          _buildBreadcrumbItem(context, 'Home', false),
                          _buildBreadcrumbSeparator(context),
                          _buildBreadcrumbItem(context, 'Services', false),
                          _buildBreadcrumbSeparator(context),
                          _buildBreadcrumbItem(context, 'AI App Development', true),
                        ],
                      ),
                    ),
                    
                    // Main Content
                    Expanded(
                      child: Container(
                        constraints: const BoxConstraints(maxWidth: 1000),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Title Section
                            Text(
                              'AI App Development',
                              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                height: 1.1,
                                fontSize: isDesktop ? null : 28,
                                shadows: [
                                  Shadow(
                                    offset: const Offset(0, 2),
                                    blurRadius: 4,
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            )
                                .animate()
                                .fadeIn(duration: 800.ms, delay: 300.ms)
                                .slideY(begin: 0.3, end: 0),
                            
                            const SizedBox(height: 20),
                            
                            // Subtitle
                            Container(
                              constraints: const BoxConstraints(maxWidth: 700),
                              child: Text(
                                'Transform your ideas into intelligent mobile applications with cutting-edge AI integration and seamless user experiences.',
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  color: const Color(0xFF64B5F6),
                                  height: 1.5,
                                  fontWeight: FontWeight.w500,
                                  fontSize: isDesktop ? null : 16,
                                  shadows: [
                                    Shadow(
                                      offset: const Offset(0, 1),
                                      blurRadius: 3,
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.center,
                              )
                                  .animate(delay: 500.ms)
                                  .fadeIn(duration: 800.ms)
                                  .slideY(begin: 0.3, end: 0),
                            ),
                            
                            const SizedBox(height: 40),
                            
                            // AI App Development Capabilities
                            isDesktop 
                                ? _buildDesktopCapabilities(context) 
                                : _buildMobileCapabilities(context),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoBackground(BuildContext context) {
    if (!_isVideoInitialized || _videoController == null) {
      return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Theme.of(context).colorScheme.primary.withOpacity(0.8),
              Theme.of(context).colorScheme.secondary.withOpacity(0.8),
              Theme.of(context).colorScheme.tertiary.withOpacity(0.8),
            ],
          ),
        ),
        child: Center(
          child: Icon(
            Icons.phone_android,
            size: 120,
            color: Colors.white.withOpacity(0.3),
          ),
        ),
      );
    }

    return FadeTransition(
      opacity: _fadeController,
      child: SizedBox.expand(
        child: FittedBox(
          fit: BoxFit.cover,
          child: SizedBox(
            width: _videoController!.value.size.width,
            height: _videoController!.value.size.height,
            child: VideoPlayer(_videoController!),
          ),
        ),
      ),
    );
  }

  Widget _buildBreadcrumbItem(BuildContext context, String text, bool isActive) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isActive 
            ? Colors.white.withOpacity(0.2)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: isActive 
              ? Colors.white
              : Colors.white.withOpacity(0.8),
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
        color: Colors.white.withOpacity(0.6),
      ),
    );
  }

  Widget _buildDesktopCapabilities(BuildContext context) {
    return Wrap(
      spacing: 20,
      runSpacing: 20,
      alignment: WrapAlignment.center,
      children: [
        _buildCapabilityItem(context, Icons.smart_toy, 'AI\nIntegration', 0),
        _buildCapabilityItem(context, Icons.phone_android, 'Mobile\nDevelopment', 200),
        _buildCapabilityItem(context, Icons.cloud_sync, 'Cloud\nSolutions', 400),
        _buildCapabilityItem(context, Icons.analytics, 'Data\nAnalytics', 600),
      ],
    );
  }

  Widget _buildMobileCapabilities(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildCapabilityItem(context, Icons.smart_toy, 'AI\nIntegration', 0),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildCapabilityItem(context, Icons.phone_android, 'Mobile\nDevelopment', 200),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildCapabilityItem(context, Icons.cloud_sync, 'Cloud\nSolutions', 400),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildCapabilityItem(context, Icons.analytics, 'Data\nAnalytics', 600),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCapabilityItem(BuildContext context, IconData icon, String label, int delay) {
    final isDesktop = ResponsiveBreakpoints.of(context).largerThan(TABLET);
    
    return AnimatedBuilder(
      animation: _floatController,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(
            4 * (_floatController.value - 0.5) * (delay % 3 == 0 ? 1 : -1),
            7 * (_floatController.value - 0.5) * (delay % 2 == 0 ? 1 : -1),
          ),
          child: AnimatedBuilder(
            animation: _pulseController,
            builder: (context, child) {
              return Transform.scale(
                scale: 1 + (0.1 * _pulseController.value),
                child: AnimatedBuilder(
                  animation: _rotateController,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: _rotateController.value * 0.15 * (delay % 2 == 0 ? 1 : -1),
                      child: Container(
                        width: isDesktop ? 180 : null,
                        padding: EdgeInsets.all(isDesktop ? 18 : 14),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              const Color(0xFF6A1B9A).withOpacity(0.95), // Deep Purple
                              const Color(0xFF8E24AA).withOpacity(0.85), // Purple
                              const Color(0xFFAB47BC).withOpacity(0.75), // Light Purple
                            ],
                          ),
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                            color: const Color(0xFFE1BEE7).withOpacity(0.6),
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF9C27B0).withOpacity(0.5),
                              blurRadius: 30,
                              offset: const Offset(0, 15),
                              spreadRadius: 4,
                            ),
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 20,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AnimatedBuilder(
                              animation: _bounceController,
                              builder: (context, child) {
                                return Transform.scale(
                                  scale: 1 + (0.2 * _bounceController.value),
                                  child: Container(
                                    padding: EdgeInsets.all(isDesktop ? 16 : 12),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.25 + 0.15 * _bounceController.value),
                                      borderRadius: BorderRadius.circular(14),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.white.withOpacity(0.4),
                                          blurRadius: 20 * (1 + _bounceController.value),
                                          spreadRadius: 3,
                                        ),
                                      ],
                                    ),
                                    child: Icon(
                                      icon,
                                      size: isDesktop ? 28 : 24,
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              },
                            ),
                            SizedBox(height: isDesktop ? 14 : 10),
                            Text(
                              label,
                              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                                fontSize: isDesktop ? 14 : 12,
                                letterSpacing: 0.8,
                                shadows: [
                                  Shadow(
                                    offset: const Offset(0, 2),
                                    blurRadius: 4,
                                    color: Colors.black.withOpacity(0.4),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        );
      },
    )
        .animate(delay: Duration(milliseconds: 700 + delay))
        .fadeIn(duration: 1200.ms)
        .slideY(begin: 1.0, end: 0, curve: Curves.elasticOut)
        .then()
        .shimmer(
          duration: 3000.ms, 
          color: const Color(0xFFE1BEE7).withOpacity(0.7),
        );
  }
}