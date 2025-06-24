import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../theme.dart';

class DataAnnotationDescription extends StatefulWidget {
  const DataAnnotationDescription({super.key});

  @override
  State<DataAnnotationDescription> createState() => _DataAnnotationDescriptionState();
}

class _DataAnnotationDescriptionState extends State<DataAnnotationDescription>
    with TickerProviderStateMixin {
  late AnimationController _pulseController;
  late AnimationController _floatController;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    
    _floatController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _floatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final screenSize = MediaQuery.of(context).size;
    final isDesktop = screenSize.width > 800;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : 20,
        vertical: 80,
      ),
      child: isDesktop
        ? _buildDesktopLayout(context)
        : _buildMobileLayout(context),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text Content
        Expanded(
          flex: 3,
          child: _buildTextContent(context),
        ),
        
        const SizedBox(width: 60),
        
        // Image Content
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
        const SizedBox(height: 40),
        _buildImageContent(context),
      ],
    );
  }

  Widget _buildTextContent(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Header
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                colorScheme.primary.withOpacity(0.1),
                colorScheme.secondary.withOpacity(0.1),
              ],
            ),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: colorScheme.primary.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: Text(
            'WHAT IS DATA ANNOTATION?',
            style: textTheme.labelLarge?.copyWith(
              color: colorScheme.primary,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
            ),
          ),
        ).animate()
          .fadeIn(duration: 600.ms)
          .slideX(begin: -0.3, end: 0, duration: 600.ms, curve: Curves.easeOut),

        const SizedBox(height: 24),

        // Main Description
        Text(
          'Data annotation is the essential process of labelling raw data—images, videos, text, or audio—to transform it into structured, machine-readable information. Adding meaningful tags and labels ensures that AI models are trained to understand and interpret data accurately, driving precise predictions and smarter decisions.',
          style: textTheme.bodyLarge?.copyWith(
            height: 1.6,
            color: colorScheme.onSurface.withOpacity(0.8),
          ),
        ).animate()
          .fadeIn(duration: 800.ms, delay: 200.ms)
          .slideY(begin: 0.3, end: 0, duration: 800.ms, delay: 200.ms, curve: Curves.easeOut),

        const SizedBox(height: 20),

        // Highlight Text
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                colorScheme.primary.withOpacity(0.05),
                colorScheme.secondary.withOpacity(0.05),
              ],
            ),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: colorScheme.primary.withOpacity(0.2),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Icon(
                Icons.auto_awesome,
                color: colorScheme.primary,
                size: 24,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'High-quality data annotation is the key to unleashing the full potential of AI.',
                  style: textTheme.titleMedium?.copyWith(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ],
          ),
        ).animate()
          .fadeIn(duration: 800.ms, delay: 400.ms)
          .slideY(begin: 0.3, end: 0, duration: 800.ms, delay: 400.ms, curve: Curves.easeOut)
          .shimmer(duration: 2000.ms, delay: 1200.ms),

        const SizedBox(height: 32),

        // Key Benefits
        _buildKeyBenefits(context),
      ],
    );
  }

  Widget _buildKeyBenefits(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final benefits = [
      {'icon': Icons.precision_manufacturing, 'title': 'Precision', 'desc': 'Accurate labeling ensures model reliability'},
      {'icon': Icons.speed, 'title': 'Efficiency', 'desc': 'Streamlined processes for faster AI training'},
      {'icon': Icons.psychology, 'title': 'Intelligence', 'desc': 'Smart annotation for better AI understanding'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Key Benefits',
          style: textTheme.titleLarge?.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.bold,
          ),
        ).animate()
          .fadeIn(duration: 600.ms, delay: 600.ms),

        const SizedBox(height: 16),

        ...benefits.asMap().entries.map((entry) {
          final index = entry.key;
          final benefit = entry.value;
          
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: colorScheme.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    benefit['icon'] as IconData,
                    color: colorScheme.primary,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        benefit['title'] as String,
                        style: textTheme.titleSmall?.copyWith(
                          color: colorScheme.onSurface,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        benefit['desc'] as String,
                        style: textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurface.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ).animate()
            .fadeIn(duration: 600.ms, delay: Duration(milliseconds: 800 + (index * 200)))
            .slideX(begin: -0.3, end: 0, duration: 600.ms, delay: Duration(milliseconds: 800 + (index * 200)), curve: Curves.easeOut);
        }).toList(),
      ],
    );
  }

  Widget _buildImageContent(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        // Main Animated Image
        AnimatedBuilder(
          animation: _floatController,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, -10 * _floatController.value),
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: colorScheme.primary.withOpacity(0.3),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Stack(
                    children: [
                      // Background Image
                      Image.network(
                        "https://pixabay.com/get/gb046ac811b3ce03549b300a1fffa5cd444f0d775b01019f0e038b1d62426634874e012368b19601adb7777a7e7bd17365d7bf0c7ee93bd4c360d42834a15a6dc_1280.jpg",
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      
                      // Overlay with annotation indicators
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.3),
                            ],
                          ),
                        ),
                      ),
                      
                      // Floating annotation boxes
                      ..._buildFloatingAnnotations(context),
                    ],
                  ),
                ),
              ),
            );
          },
        ).animate()
          .fadeIn(duration: 1000.ms, delay: 600.ms)
          .scale(begin: const Offset(0.8, 0.8), end: const Offset(1, 1), duration: 1000.ms, delay: 600.ms, curve: Curves.easeOut),

        const SizedBox(height: 20),

        // Data Types
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildDataType(context, Icons.image, 'Images', 0),
            _buildDataType(context, Icons.text_fields, 'Text', 200),
            _buildDataType(context, Icons.audiotrack, 'Audio', 400),
          ],
        ),
      ],
    );
  }

  Widget _buildDataType(BuildContext context, IconData icon, String label, int delay) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return AnimatedBuilder(
      animation: _pulseController,
      builder: (context, child) {
        return Transform.scale(
          scale: 1.0 + (0.1 * _pulseController.value),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: colorScheme.primary.withOpacity(0.3),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: colorScheme.primary.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  color: colorScheme.primary,
                  size: 24,
                ),
                const SizedBox(height: 4),
                Text(
                  label,
                  style: textTheme.labelSmall?.copyWith(
                    color: colorScheme.onSurface,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ).animate()
      .fadeIn(duration: 600.ms, delay: Duration(milliseconds: 1000 + delay))
      .slideY(begin: 0.5, end: 0, duration: 600.ms, delay: Duration(milliseconds: 1000 + delay), curve: Curves.easeOut);
  }

  List<Widget> _buildFloatingAnnotations(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return [
      // Top annotation
      Positioned(
        top: 20,
        right: 20,
        child: AnimatedBuilder(
          animation: _pulseController,
          builder: (context, child) {
            return Transform.scale(
              scale: 1.0 + (0.05 * _pulseController.value),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: colorScheme.primary,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: colorScheme.primary.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Text(
                  'Object: Car',
                  style: textTheme.labelSmall?.copyWith(
                    color: colorScheme.onPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            );
          },
        ),
      ),
      
      // Bottom left annotation
      Positioned(
        bottom: 60,
        left: 20,
        child: AnimatedBuilder(
          animation: _pulseController,
          builder: (context, child) {
            return Transform.scale(
              scale: 1.0 + (0.05 * (1 - _pulseController.value)),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: colorScheme.secondary,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: colorScheme.secondary.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Text(
                  'Sentiment: Positive',
                  style: textTheme.labelSmall?.copyWith(
                    color: colorScheme.onSecondary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    ];
  }
}