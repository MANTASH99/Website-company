import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../theme.dart';

class DataAnnotationHero extends StatelessWidget {
  const DataAnnotationHero({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final screenSize = MediaQuery.of(context).size;
    final isDesktop = screenSize.width > 800;

    return Container(
      height: isDesktop ? 400 : 300,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            "https://pixabay.com/get/g60162f4453f429521f6d0d2471da8e7ce7d0c869a54e103af018922b44a25fd4340b353631d7712a2d7ae8d64c3cfbb941b48f0befb0cccb6160a199e0eb186d_1280.jpg",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withOpacity(0.6),
              Colors.black.withOpacity(0.4),
              Colors.black.withOpacity(0.7),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Main Title
              Text(
                'DATA ANNOTATION',
                style: textTheme.displayMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                  shadows: [
                    Shadow(
                      color: Colors.black.withOpacity(0.5),
                      offset: const Offset(0, 2),
                      blurRadius: 4,
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ).animate()
                .fadeIn(duration: 800.ms)
                .slideY(begin: 0.3, end: 0, duration: 800.ms, curve: Curves.easeOut),

              const SizedBox(height: 16),

              // Subtitle
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                decoration: BoxDecoration(
                  color: colorScheme.primary.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Text(
                  'TRANSFORM RAW DATA INTO AI-READY INSIGHTS',
                  style: textTheme.titleMedium?.copyWith(
                    color: colorScheme.onPrimary,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ).animate()
                .fadeIn(duration: 800.ms, delay: 400.ms)
                .slideY(begin: 0.3, end: 0, duration: 800.ms, delay: 400.ms, curve: Curves.easeOut)
                .shimmer(duration: 2000.ms, delay: 1200.ms),

              const SizedBox(height: 24),

              // Animated indicators
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildIndicator(context, Icons.image_outlined, 'Images'),
                  const SizedBox(width: 24),
                  _buildIndicator(context, Icons.videocam_outlined, 'Videos'),
                  const SizedBox(width: 24),
                  _buildIndicator(context, Icons.text_fields_outlined, 'Text'),
                  const SizedBox(width: 24),
                  _buildIndicator(context, Icons.audiotrack_outlined, 'Audio'),
                ],
              ).animate()
                .fadeIn(duration: 1000.ms, delay: 800.ms)
                .slideY(begin: 0.5, end: 0, duration: 1000.ms, delay: 800.ms, curve: Curves.easeOut),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIndicator(BuildContext context, IconData icon, String label) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
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
    ).animate(delay: Duration(milliseconds: 200 * ['Images', 'Videos', 'Text', 'Audio'].indexOf(label)))
      .scale(duration: 400.ms, curve: Curves.elasticOut)
      .fadeIn(duration: 400.ms);
  }
}