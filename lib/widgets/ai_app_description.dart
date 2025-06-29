import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../theme.dart';

class AIAppDescription extends StatefulWidget {
  const AIAppDescription({super.key});

  @override
  State<AIAppDescription> createState() => _AIAppDescriptionState();
}

class _AIAppDescriptionState extends State<AIAppDescription>
    with TickerProviderStateMixin {
  late AnimationController _floatController;
  late AnimationController _pulseController;
  late AnimationController _glowController;

  @override
  void initState() {
    super.initState();
    _floatController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);
    
    _pulseController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    
    _glowController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _floatController.dispose();
    _pulseController.dispose();
    _glowController.dispose();
    super.dispose();
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
        child: isMobile ? _buildMobileLayout(context) : _buildDesktopLayout(context),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: _buildTextContent(context),
        ),
        const SizedBox(width: 60),
        Expanded(
          flex: 2,
          child: _buildImageContent(context),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        _buildTextContent(context),
        const SizedBox(height: 48),
        _buildImageContent(context),
      ],
    );
  }

  Widget _buildTextContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Intelligent Applications for the Modern World',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        )
            .animate()
            .fadeIn(delay: 200.ms, duration: 800.ms)
            .slideX(begin: -0.2, end: 0),
        
        const SizedBox(height: 24),
        
        Text(
          'At ImplementAI MH UG, we specialize in developing applications with embedded AI features that make them smarter, more intuitive, and more valuable to users. Our experienced development team combines technical expertise with a deep understanding of AI capabilities to create applications that stand out in today\'s competitive digital landscape.',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            height: 1.6,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
          ),
        )
            .animate()
            .fadeIn(delay: 400.ms, duration: 800.ms)
            .slideY(begin: 0.1, end: 0),
        
        const SizedBox(height: 20),
        
        Text(
          'We have a strong track record of building AI-powered applications across various platforms including web, mobile, and desktop. Our applications leverage machine learning, natural language processing, computer vision, and other AI technologies to deliver enhanced functionality, personalized experiences, and data-driven insights.',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            height: 1.6,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
          ),
        )
            .animate()
            .fadeIn(delay: 600.ms, duration: 800.ms)
            .slideY(begin: 0.1, end: 0),
        
        const SizedBox(height: 32),
        
        _buildCapabilities(context),
        
        const SizedBox(height: 40),
        
        ElevatedButton(
          onPressed: () {
            // TODO: Navigate to contact or demo booking
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            elevation: 0,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.rocket_launch_outlined,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              const SizedBox(width: 8),
              Text(
                'Start Your Project',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        )
            .animate()
            .fadeIn(delay: 1000.ms, duration: 600.ms)
            .scale(begin: const Offset(0.8, 0.8))
            .shimmer(delay: 1800.ms, duration: 2000.ms),
      ],
    );
  }

  Widget _buildCapabilities(BuildContext context) {
    final capabilities = [
      {'icon': Icons.psychology, 'title': 'Machine Learning', 'desc': 'Intelligent algorithms and predictive models'},
      {'icon': Icons.chat_bubble_outline, 'title': 'Natural Language Processing', 'desc': 'Text analysis and conversational AI'},
      {'icon': Icons.visibility, 'title': 'Computer Vision', 'desc': 'Image recognition and visual AI'},
      {'icon': Icons.devices, 'title': 'Cross-Platform Development', 'desc': 'Web, mobile, and desktop applications'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Our Core Capabilities',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        )
            .animate()
            .fadeIn(delay: 800.ms, duration: 600.ms),
        
        const SizedBox(height: 20),
        
        ...capabilities.asMap().entries.map((entry) {
          int index = entry.key;
          Map<String, dynamic> capability = entry.value;
          
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    capability['icon'],
                    color: Theme.of(context).colorScheme.primary,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        capability['title'],
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        capability['desc'],
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
              .animate()
              .fadeIn(delay: Duration(milliseconds: 900 + (index * 100)), duration: 600.ms)
              .slideX(begin: -0.2, end: 0);
        }).toList(),
      ],
    );
  }

  Widget _buildImageContent(BuildContext context) {
    return Stack(
      children: [
        // Main image with app-devv-.png
        AnimatedBuilder(
          animation: _floatController,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, _floatController.value * 15 - 7.5),
              child: AnimatedBuilder(
                animation: _glowController,
                builder: (context, child) {
                  return Container(
                    height: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).colorScheme.primary.withOpacity(0.3 + 0.2 * _glowController.value),
                          blurRadius: 30 * (1 + _glowController.value),
                          offset: const Offset(0, 15),
                          spreadRadius: 5 * _glowController.value,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Stack(
                        children: [
                          // App development image
                          Image.asset(
                            'app-devv-.png',
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
                                      Theme.of(context).colorScheme.secondary.withOpacity(0.8),
                                      Theme.of(context).colorScheme.tertiary.withOpacity(0.8),
                                    ],
                                  ),
                                ),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.phone_android,
                                        size: 80,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(height: 16),
                                      Text(
                                        'App Development',
                                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
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
                          
                          // Gradient overlay for better contrast
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Theme.of(context).colorScheme.primary.withOpacity(0.1),
                                  Theme.of(context).colorScheme.secondary.withOpacity(0.1),
                                ],
                              ),
                            ),
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
        
        // Floating AI indicators
        ..._buildFloatingIndicators(context),
      ],
    )
        .animate()
        .fadeIn(delay: 600.ms, duration: 1000.ms)
        .scale(begin: const Offset(0.9, 0.9));
  }

  List<Widget> _buildFloatingIndicators(BuildContext context) {
    return [
      // AI Brain indicator
      Positioned(
        top: 50,
        right: -10,
        child: AnimatedBuilder(
          animation: _pulseController,
          builder: (context, child) {
            return Transform.scale(
              scale: 1.0 + (_pulseController.value * 0.15),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.primary.withOpacity(0.4),
                      blurRadius: 15 * (1 + _pulseController.value),
                      offset: const Offset(0, 4),
                      spreadRadius: 2 * _pulseController.value,
                    ),
                  ],
                ),
                child: Icon(
                  Icons.psychology,
                  color: Theme.of(context).colorScheme.onPrimary,
                  size: 24,
                ),
              ),
            );
          },
        )
            .animate(delay: 1200.ms)
            .fadeIn(duration: 600.ms)
            .slideX(begin: 0.5, end: 0),
      ),
      
      // Mobile indicator
      Positioned(
        bottom: 80,
        left: -15,
        child: AnimatedBuilder(
          animation: _floatController,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, -_floatController.value * 12 + 6),
              child: AnimatedBuilder(
                animation: _pulseController,
                builder: (context, child) {
                  return Transform.scale(
                    scale: 1.0 + (_pulseController.value * 0.1),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context).colorScheme.secondary.withOpacity(0.4),
                            blurRadius: 12 * (1 + _pulseController.value),
                            offset: const Offset(0, 4),
                            spreadRadius: 1 * _pulseController.value,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.smartphone,
                            color: Theme.of(context).colorScheme.onSecondary,
                            size: 16,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Mobile AI',
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
            );
          },
        )
            .animate(delay: 1400.ms)
            .fadeIn(duration: 600.ms)
            .slideX(begin: -0.5, end: 0),
      ),
      
      // Code indicator
      Positioned(
        top: 120,
        left: 20,
        child: AnimatedBuilder(
          animation: _pulseController,
          builder: (context, child) {
            return Transform.scale(
              scale: 1.0 + (_pulseController.value * 0.12),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.tertiary,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.tertiary.withOpacity(0.4),
                      blurRadius: 12 * (1 + _pulseController.value),
                      offset: const Offset(0, 3),
                      spreadRadius: 1 * _pulseController.value,
                    ),
                  ],
                ),
                child: Icon(
                  Icons.code,
                  color: Theme.of(context).colorScheme.onTertiary,
                  size: 20,
                ),
              ),
            );
          },
        )
            .animate(delay: 1600.ms)
            .fadeIn(duration: 600.ms)
            .slideY(begin: -0.3, end: 0),
      ),
    ];
  }
}