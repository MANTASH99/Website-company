import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../theme.dart';

class DataAcquisitionContent extends StatefulWidget {
  const DataAcquisitionContent({super.key});

  @override
  State<DataAcquisitionContent> createState() => _DataAcquisitionContentState();
}

class _DataAcquisitionContentState extends State<DataAcquisitionContent>
    with TickerProviderStateMixin {
  late AnimationController _floatController;
  late AnimationController _pulseController;

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
  }

  @override
  void dispose() {
    _floatController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveBreakpoints.of(context).largerThan(TABLET);
    
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 120, horizontal: 24),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1400),
        child: isDesktop ? _buildDesktopLayout(context) : _buildMobileLayout(context),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 6,
          child: _buildTextContent(context),
        ),
        const SizedBox(width: 80),
        Expanded(
          flex: 4,
          child: _buildImageContent(context),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        _buildTextContent(context),
        const SizedBox(height: 60),
        _buildImageContent(context),
      ],
    );
  }

  Widget _buildTextContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.cloud_download,
                size: 16,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 8),
              Text(
                'DATA ACQUISITION',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
        )
        .animate()
        .fadeIn(duration: 600.ms)
        .slideX(begin: -0.2, end: 0),
        
        const SizedBox(height: 32),
        
        // Main Title
        Text(
          'What is Data Acquisition?',
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
            fontWeight: FontWeight.w700,
            height: 1.2,
            letterSpacing: -0.5,
          ),
        )
        .animate()
        .fadeIn(duration: 800.ms, delay: 200.ms)
        .slideY(begin: 0.3, end: 0),
        
        const SizedBox(height: 32),
        
        // Description
        Text(
          'Data acquisition involves gathering information from diverse sources to create AI and machine learning training models. Effective data acquisition ensures the data used for training models is accurate, relevant, and representative of the problem domain, making the integration worthwhile in performance.',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            height: 1.7,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
          ),
        )
        .animate()
        .fadeIn(duration: 800.ms, delay: 400.ms)
        .slideY(begin: 0.3, end: 0),
        
        const SizedBox(height: 32),
        
        // Additional description
        Text(
          'Our focus on strategic selection, careful preprocessing, and strict quality standards ensures that your AI and machine learning training projects execute flawlessly.',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            height: 1.7,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
            fontWeight: FontWeight.w500,
          ),
        )
        .animate()
        .fadeIn(duration: 800.ms, delay: 600.ms)
        .slideY(begin: 0.3, end: 0),
        
        const SizedBox(height: 48),
        
        // Key Features
        _buildKeyFeatures(context),
      ],
    );
  }

  Widget _buildKeyFeatures(BuildContext context) {
    final features = [
      {
        'icon': Icons.precision_manufacturing,
        'title': 'Strategic Selection',
        'description': 'Carefully chosen data sources for optimal results',
      },
      {
        'icon': Icons.cleaning_services,
        'title': 'Quality Processing',
        'description': 'Rigorous preprocessing and validation procedures',
      },
      {
        'icon': Icons.security,
        'title': 'Quality Standards',
        'description': 'Strict adherence to data quality benchmarks',
      },
      {
        'icon': Icons.rocket_launch,
        'title': 'Flawless Execution',
        'description': 'Seamless integration with your AI projects',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Why Our Data Acquisition?',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        )
        .animate()
        .fadeIn(duration: 600.ms, delay: 800.ms),
        
        const SizedBox(height: 24),
        
        ...features.asMap().entries.map((entry) {
          final index = entry.key;
          final feature = entry.value;
          
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
                width: 1,
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    feature['icon'] as IconData,
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
                        feature['title'] as String,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        feature['description'] as String,
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
          .fadeIn(duration: 600.ms, delay: Duration(milliseconds: 900 + (index * 100)))
          .slideX(begin: -0.2, end: 0);
        }),
      ],
    );
  }

  Widget _buildImageContent(BuildContext context) {
    return Stack(
      children: [
        // Main data visualization image
        Container(
          height: 500,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.network(
              "https://pixabay.com/get/g34d1f9a866835ac6f3d1e240b3714fb179fa3a510ef28a0400f0b6c54ee0f8ca4008891de32406ffae3c38502cbe93b7ce3eb13d927a0ffa4fea88b8a273d8aa_1280.jpg",
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
        )
        .animate()
        .fadeIn(duration: 800.ms, delay: 400.ms)
        .scale(begin: const Offset(0.8, 0.8), end: const Offset(1.0, 1.0)),
        
        // Floating data indicators
        ..._buildFloatingDataIndicators(context),
      ],
    );
  }

  List<Widget> _buildFloatingDataIndicators(BuildContext context) {
    return [
      // Data volume indicator
      Positioned(
        top: 40,
        right: -20,
        child: AnimatedBuilder(
          animation: _floatController,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, _floatController.value * 10),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.tertiary,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.tertiary.withOpacity(0.3),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.storage,
                      color: Colors.white,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '10TB+ Data',
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        )
        .animate()
        .fadeIn(duration: 600.ms, delay: 800.ms)
        .slideX(begin: 0.5, end: 0),
      ),
      
      // Quality score indicator
      Positioned(
        bottom: 60,
        left: -30,
        child: AnimatedBuilder(
          animation: _pulseController,
          builder: (context, child) {
            return Transform.scale(
              scale: 1.0 + (_pulseController.value * 0.1),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.secondary.withOpacity(0.3),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.verified,
                      color: Colors.white,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '99.8% Quality',
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        )
        .animate()
        .fadeIn(duration: 600.ms, delay: 1000.ms)
        .slideX(begin: -0.5, end: 0),
      ),
    ];
  }
}