import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:video_player/video_player.dart';
import '../theme.dart';

class DataAnnotationHero extends StatefulWidget {
  const DataAnnotationHero({super.key});

  @override
  State<DataAnnotationHero> createState() => _DataAnnotationHeroState();
}

class _DataAnnotationHeroState extends State<DataAnnotationHero> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      "assets/data-annotation.mp4",
    )..initialize().then((_) {
        setState(() {});
        _controller.setLooping(true);
        _controller.setVolume(0);
        _controller.play();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final screenSize = MediaQuery.of(context).size;
    final isDesktop = screenSize.width > 800;
    final heroHeight = isDesktop ? 400.0 : 300.0;

    return ClipRRect(
      borderRadius: BorderRadius.zero,
      child: SizedBox(
        width: double.infinity,
        height: heroHeight,
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Video background
            if (_controller.value.isInitialized)
              FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: _controller.value.size.width,
                  height: _controller.value.size.height,
                  child: VideoPlayer(_controller),
                ),
              )
            else
              Container(color: colorScheme.surface),
            // Overlay gradient for readability
            Container(
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
            ),
            // Foreground content
            Center(
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
          ],
        ),
      ),
    );
  }

  Widget _buildIndicator(BuildContext context, IconData icon, String label) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: colorScheme.surface.withOpacity(0.8),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorScheme.primary, width: 1),
        boxShadow: [
          BoxShadow(
            color: colorScheme.primary.withOpacity(0.09),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: colorScheme.primary,
            size: 26,
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: textTheme.labelMedium?.copyWith(
              color: colorScheme.primary,
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