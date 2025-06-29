import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'dart:ui';

import '../theme.dart';

class DataAcquisitionHero extends StatefulWidget {
  const DataAcquisitionHero({super.key});

  @override
  State<DataAcquisitionHero> createState() => _DataAcquisitionHeroState();
}

class _DataAcquisitionHeroState extends State<DataAcquisitionHero> {
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.asset(
      'assets/data-aquistion.mp4',
    )..initialize().then((_) {
        setState(() {});
        _videoController.setLooping(true);
        _videoController.setVolume(0);
        _videoController.play();
      });
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // The height here is fixed and should match the design, e.g., 500
    return Container(
      width: double.infinity,
      height: 500,
      color: Colors.black,
      child: Stack(
        fit: StackFit.expand,
        children: [
          if (_videoController.value.isInitialized)
            ClipRRect(
              borderRadius: BorderRadius.zero,
              child: SizedBox.expand(
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: _videoController.value.size.width,
                    height: _videoController.value.size.height,
                    child: VideoPlayer(_videoController),
                  ),
                ),
              ),
            ),
          // Gradient overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.3),
                  Colors.black.withOpacity(0.7),
                ],
              ),
            ),
          ),
          // Blur overlay and content
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Breadcrumb
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () => Navigator.pushReplacementNamed(context, '/'),
                          child: Text(
                            'Home',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.white.withOpacity(0.8),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          child: Icon(
                            Icons.chevron_right,
                            color: Colors.white.withOpacity(0.6),
                            size: 16,
                          ),
                        ),
                        Text(
                          'AI Data Acquisition',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  )
                      .animate()
                      .slideX(begin: -0.5, end: 0, duration: 600.ms, delay: 200.ms)
                      .fadeIn(duration: 600.ms, delay: 200.ms),
                  const SizedBox(height: 40),
                  // Main Title
                  Text(
                    'AI DATA ACQUISITION',
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 48,
                      letterSpacing: 2,
                      shadows: [
                        Shadow(
                          offset: const Offset(0, 4),
                          blurRadius: 8,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  )
                      .animate()
                      .fadeIn(duration: 800.ms, delay: 400.ms)
                      .slideY(begin: 0.3, end: 0)
                      .shimmer(duration: 2000.ms, delay: 1200.ms),
                  const SizedBox(height: 20),
                  // Subtitle
                  Container(
                    constraints: const BoxConstraints(maxWidth: 800),
                    child: Text(
                      'High-quality data collection and procurement services to power your AI and machine learning projects with precision and excellence.',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.white.withOpacity(0.9),
                        fontWeight: FontWeight.w400,
                        height: 1.6,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                      .animate()
                      .fadeIn(duration: 800.ms, delay: 600.ms)
                      .slideY(begin: 0.3, end: 0),
                  const SizedBox(height: 40),
                  // Service Indicators
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildServiceIndicator(context, Icons.cloud_download, 'Collection'),
                      const SizedBox(width: 32),
                      _buildServiceIndicator(context, Icons.shopping_cart, 'Procurement'),
                      const SizedBox(width: 32),
                      _buildServiceIndicator(context, Icons.web, 'Scraping'),
                      const SizedBox(width: 32),
                      _buildServiceIndicator(context, Icons.tune, 'Curation'),
                    ],
                  )
                      .animate()
                      .fadeIn(duration: 800.ms, delay: 800.ms)
                      .slideY(begin: 0.3, end: 0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceIndicator(BuildContext context, IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 24,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}