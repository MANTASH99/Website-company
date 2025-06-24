import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../theme.dart';

class DataAnnotationServices extends StatefulWidget {
  const DataAnnotationServices({super.key});

  @override
  State<DataAnnotationServices> createState() => _DataAnnotationServicesState();
}

class _DataAnnotationServicesState extends State<DataAnnotationServices> {
  int _hoveredIndex = -1;

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
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            colorScheme.surface,
            colorScheme.surfaceVariant.withOpacity(0.3),
          ],
        ),
      ),
      child: Column(
        children: [
          // Section Header
          _buildSectionHeader(context),
          
          const SizedBox(height: 60),
          
          // Services Grid
          _buildServicesGrid(context),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        // Section Tag
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
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
            'EXPLORE OUR EXPERTISE',
            style: textTheme.labelLarge?.copyWith(
              color: colorScheme.primary,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
        ).animate()
          .fadeIn(duration: 600.ms)
          .slideY(begin: -0.3, end: 0, duration: 600.ms, curve: Curves.easeOut),

        const SizedBox(height: 20),

        // Main Title
        Text(
          'Data Annotation Services',
          style: textTheme.displaySmall?.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.5,
          ),
          textAlign: TextAlign.center,
        ).animate()
          .fadeIn(duration: 800.ms, delay: 200.ms)
          .slideY(begin: 0.3, end: 0, duration: 800.ms, delay: 200.ms, curve: Curves.easeOut),

        const SizedBox(height: 16),

        // Description
        Container(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Text(
            'Specialized annotation services tailored to different data types and AI model requirements',
            style: textTheme.bodyLarge?.copyWith(
              color: colorScheme.onSurface.withOpacity(0.7),
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ).animate()
          .fadeIn(duration: 800.ms, delay: 400.ms)
          .slideY(begin: 0.3, end: 0, duration: 800.ms, delay: 400.ms, curve: Curves.easeOut),
      ],
    );
  }

  Widget _buildServicesGrid(BuildContext context) {
    final services = _getServices();
    final screenSize = MediaQuery.of(context).size;
    final isDesktop = screenSize.width > 800;

    if (isDesktop) {
      return Row(
        children: services.asMap().entries.map((entry) {
          final index = entry.key;
          final service = entry.value;
          return Expanded(
            child: Container(
              margin: EdgeInsets.only(
                right: index < services.length - 1 ? 24 : 0,
              ),
              child: _buildServiceCard(context, service, index),
            ),
          );
        }).toList(),
      );
    } else {
      return Column(
        children: services.asMap().entries.map((entry) {
          final index = entry.key;
          final service = entry.value;
          return Container(
            margin: EdgeInsets.only(
              bottom: index < services.length - 1 ? 24 : 0,
            ),
            child: _buildServiceCard(context, service, index),
          );
        }).toList(),
      );
    }
  }

  Widget _buildServiceCard(BuildContext context, Map<String, dynamic> service, int index) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final isHovered = _hoveredIndex == index;

    return MouseRegion(
      onEnter: (_) => setState(() => _hoveredIndex = index),
      onExit: (_) => setState(() => _hoveredIndex = -1),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 400,
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: isHovered 
                ? colorScheme.primary.withOpacity(0.2)
                : colorScheme.outline.withOpacity(0.1),
              blurRadius: isHovered ? 20 : 8,
              offset: Offset(0, isHovered ? 8 : 4),
            ),
          ],
          border: Border.all(
            color: isHovered 
              ? colorScheme.primary.withOpacity(0.3)
              : colorScheme.outline.withOpacity(0.1),
            width: 1,
          ),
        ),
        child: Column(
          children: [
            // Image Section
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(service['image'] as String),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.3),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        // Icon
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: colorScheme.primary,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: colorScheme.primary.withOpacity(0.3),
                                blurRadius: 12,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Icon(
                            service['icon'] as IconData,
                            color: colorScheme.onPrimary,
                            size: 28,
                          ),
                        ).animate()
                          .scale(duration: 600.ms, delay: Duration(milliseconds: 200 * index))
                          .fadeIn(duration: 600.ms, delay: Duration(milliseconds: 200 * index)),

                        const Spacer(),

                        // Title
                        Text(
                          service['title'] as String,
                          style: textTheme.titleLarge?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                color: Colors.black.withOpacity(0.5),
                                offset: const Offset(0, 1),
                                blurRadius: 2,
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Content Section
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Description
                    Text(
                      service['description'] as String,
                      style: textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurface.withOpacity(0.7),
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Features
                    Text(
                      'Key Features:',
                      style: textTheme.titleSmall?.copyWith(
                        color: colorScheme.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: (service['features'] as List<String>).length,
                        itemBuilder: (context, featureIndex) {
                          final feature = (service['features'] as List<String>)[featureIndex];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 6),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(top: 6, right: 8),
                                  width: 4,
                                  height: 4,
                                  decoration: BoxDecoration(
                                    color: colorScheme.primary,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    feature,
                                    style: textTheme.bodySmall?.copyWith(
                                      color: colorScheme.onSurface.withOpacity(0.8),
                                      height: 1.4,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),

                    // Read More Button
                    SizedBox(
                      width: double.infinity,
                      child: GestureDetector(
                        onTap: () => _navigateToServicePage(context, index),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            gradient: isHovered
                              ? LinearGradient(
                                  colors: [
                                    colorScheme.primary,
                                    colorScheme.secondary,
                                  ],
                                )
                              : null,
                            color: isHovered ? null : colorScheme.primary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: colorScheme.primary.withOpacity(isHovered ? 0 : 0.3),
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Read More',
                                style: textTheme.labelLarge?.copyWith(
                                  color: isHovered 
                                    ? colorScheme.onPrimary
                                    : colorScheme.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Icon(
                                Icons.arrow_forward,
                                size: 16,
                                color: isHovered 
                                  ? colorScheme.onPrimary
                                  : colorScheme.primary,
                              ),
                            ],
                          ),
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
    ).animate()
      .fadeIn(duration: 800.ms, delay: Duration(milliseconds: 200 * index))
      .slideY(begin: 0.3, end: 0, duration: 800.ms, delay: Duration(milliseconds: 200 * index), curve: Curves.easeOut);
  }

  List<Map<String, dynamic>> _getServices() {
    return [
      {
        'title': 'Computer Vision\nAnnotation',
        'description': 'We deliver precise computer vision solutions with our expert image and video dataset annotation services.',
        'icon': Icons.remove_red_eye_outlined,
        'image': "https://pixabay.com/get/g27fec35e0af9fe52546a0de1e019f819564319c315a95d77cd693315ea92399d933bbe5fee7f2d66114bf704d87613b13df5edbb40f45ae1bb9668ef16f8937f_1280.jpg",
        'features': [
          'Object detection and classification',
          'Image segmentation and labeling',
          'Video frame annotation',
          'OCR and text recognition',
          'Quality assurance and validation',
        ],
      },
      {
        'title': 'Natural Language\nAnnotation',
        'description': 'We transform your NLP projects with our comprehensive text and audio annotation services for accurate language processing.',
        'icon': Icons.psychology_outlined,
        'image': "https://pixabay.com/get/g73d8d6229e03380d0f21e723d46c1f6f698c74548f18d9086558af8b5e8f4eebca11cf772e256b83b18ef0082e3cceacd407a8f2fdca348bd1ec026843321cba_1280.jpg",
        'features': [
          'Text classification and tagging',
          'Sentiment analysis annotation',
          'Named entity recognition',
          'Speech-to-text transcription',
          'Multi-language support',
        ],
      },
      {
        'title': '3D Point Cloud\nAnnotation',
        'description': 'We enhance your 3D models with our expert LiDAR and point cloud annotation services for precise object recognition.',
        'icon': Icons.scatter_plot_outlined,
        'image': "https://pixabay.com/get/g345287895adbd156399c2e6875b7b4d21dde8a74018740193b3228d22e3199f8226651b1864fdb12b5b5846ca67e452a29dd73fe1e5bbd9a503b16b27a31b1e1_1280.jpg",
        'features': [
          '3D object detection and tracking',
          'Point cloud segmentation',
          'LiDAR data annotation',
          'Autonomous vehicle datasets',
          'Spatial relationship mapping',
        ],
      },
    ];
  }

  void _navigateToServicePage(BuildContext context, int index) {
    final routes = [
      '/computer-vision',      // Computer Vision Annotation (index 0)
      '/text-annotation',      // Natural Language Annotation (index 1)  
      '/3d-annotation',        // 3D Point Cloud Annotation (index 2)
    ];
    
    if (index < routes.length) {
      Navigator.pushNamed(context, routes[index]);
    }
  }
}