import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:video_player/video_player.dart';
import '../theme.dart';

class ComputerVisionHero extends StatefulWidget {
  const ComputerVisionHero({super.key});

  @override
  State<ComputerVisionHero> createState() => _ComputerVisionHeroState();
}

class _ComputerVisionHeroState extends State<ComputerVisionHero>
    with TickerProviderStateMixin {
  VideoPlayerController? _videoController;
  bool _isVideoInitialized = false;
  late AnimationController _fadeController;
  late AnimationController _pulseController;
  late AnimationController _floatController;

  @override
  void initState() {
    super.initState();
    
    _fadeController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    
    _pulseController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);
    
    _floatController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat(reverse: true);
    
    _initializeVideo();
  }

  Future<void> _initializeVideo() async {
    try {
      _videoController = VideoPlayerController.asset('computer-vission.mp4');
      
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
      // Fallback: video failed to load, continue without video
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveBreakpoints.of(context).largerThan(TABLET);
    
    return Container(
      width: double.infinity,
      // Fixed height that doesn't interfere with header
      height: isDesktop ? 500 : 400,
      margin: EdgeInsets.only(
        top: isDesktop ? 20 : 16, // Add top margin to ensure spacing from header
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
            
            // Gradient Overlay for better text readability
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
                          _buildBreadcrumbItem(context, 'Data Annotation', false),
                          _buildBreadcrumbSeparator(context),
                          _buildBreadcrumbItem(context, 'Computer Vision', true),
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
                              'Computer Vision Annotation',
                              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                height: 1.1,
                                fontSize: isDesktop ? null : 28, // Smaller on mobile
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
                            
                            // Subtitle - Changed to blue color
                            Container(
                              constraints: const BoxConstraints(maxWidth: 700),
                              child: Text(
                                'Enable machines to interpret and make decisions based on visual data with precision and scalability that surpasses human capabilities.',
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  color: const Color(0xFF64B5F6), // Light blue color
                                  height: 1.5,
                                  fontWeight: FontWeight.w500,
                                  fontSize: isDesktop ? null : 16, // Smaller on mobile
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
                            
                            // Computer Vision Capabilities with animations
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
      // Fallback background when video is not available
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
            Icons.computer,
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
        _buildCapabilityItem(context, Icons.visibility, 'Object\nDetection', 0),
        _buildCapabilityItem(context, Icons.image, 'Image\nClassification', 200),
        _buildCapabilityItem(context, Icons.border_clear, 'Image\nSegmentation', 400),
        _buildCapabilityItem(context, Icons.face, 'Facial\nRecognition', 600),
      ],
    );
  }

  Widget _buildMobileCapabilities(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildCapabilityItem(context, Icons.visibility, 'Object\nDetection', 0),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildCapabilityItem(context, Icons.image, 'Image\nClassification', 200),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildCapabilityItem(context, Icons.border_clear, 'Image\nSegmentation', 400),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildCapabilityItem(context, Icons.face, 'Facial\nRecognition', 600),
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
          offset: Offset(0, 5 * (_floatController.value - 0.5) * (delay % 2 == 0 ? 1 : -1)),
          child: AnimatedBuilder(
            animation: _pulseController,
            builder: (context, child) {
              return Transform.scale(
                scale: 1 + (0.05 * _pulseController.value),
                child: Container(
                  width: isDesktop ? 180 : null,
                  padding: EdgeInsets.all(isDesktop ? 18 : 14),
                  decoration: BoxDecoration(
                    // Blue gradient background
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        const Color(0xFF1976D2).withOpacity(0.9), // Material Blue 700
                        const Color(0xFF1E88E5).withOpacity(0.8), // Material Blue 600
                        const Color(0xFF2196F3).withOpacity(0.7), // Material Blue 500
                      ],
                    ),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: const Color(0xFF64B5F6).withOpacity(0.5), // Light blue border
                      width: 1.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF2196F3).withOpacity(0.3),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                        spreadRadius: 2,
                      ),
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 15,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Icon with pulsing effect
                      AnimatedBuilder(
                        animation: _pulseController,
                        builder: (context, child) {
                          return Container(
                            padding: EdgeInsets.all(isDesktop ? 14 : 10),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.15 + 0.1 * _pulseController.value),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.2),
                                  blurRadius: 10 * (1 + _pulseController.value),
                                  spreadRadius: 1,
                                ),
                              ],
                            ),
                            child: Icon(
                              icon,
                              size: isDesktop ? 24 : 20,
                              color: Colors.white,
                            ),
                          );
                        },
                      ),
                      SizedBox(height: isDesktop ? 12 : 8),
                      Text(
                        label,
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: isDesktop ? 13 : 11,
                          letterSpacing: 0.5,
                          shadows: [
                            Shadow(
                              offset: const Offset(0, 1),
                              blurRadius: 2,
                              color: Colors.black.withOpacity(0.3),
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
    )
        .animate(delay: Duration(milliseconds: 700 + delay))
        .fadeIn(duration: 800.ms)
        .slideY(begin: 0.5, end: 0, curve: Curves.easeOutBack)
        .then()
        .shimmer(
          duration: 2000.ms, 
          color: const Color(0xFF64B5F6).withOpacity(0.4),
        );
  }
}