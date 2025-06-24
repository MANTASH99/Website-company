import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../theme.dart';

class AIConsultingDescription extends StatefulWidget {
  const AIConsultingDescription({super.key});

  @override
  State<AIConsultingDescription> createState() => _AIConsultingDescriptionState();
}

class _AIConsultingDescriptionState extends State<AIConsultingDescription>
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
      child: isDesktop ? _buildDesktopLayout(context) : _buildMobileLayout(context),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 1400),
      child: Row(
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
      ),
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
                Icons.psychology,
                size: 16,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 8),
              Text(
                'CONSULTING EXPERTISE',
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
          'AI Consulting That Drives Results',
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
          'As AI consultants, we help organizations overcome common challenges in harnessing AI\'s potential. Our expert team specializes in data extraction, machine learning, and advanced analytics to deliver tangible business outcomes. We provide end-to-end support, from initial concept to deployment, with tailored solutions that enhance efficiency, reduce costs, and drive growth.',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            height: 1.7,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
          ),
        )
        .animate()
        .fadeIn(duration: 800.ms, delay: 400.ms)
        .slideY(begin: 0.3, end: 0),
        
        const SizedBox(height: 48),
        
        // Key Benefits
        _buildConsultingBenefits(context),
        
        const SizedBox(height: 48),
        
        // CTA Button
        ElevatedButton.icon(
          onPressed: () {
            Navigator.pushNamed(context, '/book-demo');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 0,
          ),
          icon: const Icon(Icons.schedule_send, size: 20),
          label: Text(
            'Schedule Consultation',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
        .animate()
        .fadeIn(duration: 600.ms, delay: 800.ms)
        .slideY(begin: 0.3, end: 0)
        .shimmer(duration: 2000.ms, delay: 1500.ms),
      ],
    );
  }

  Widget _buildConsultingBenefits(BuildContext context) {
    final benefits = [
      {
        'icon': Icons.trending_up,
        'title': 'Revenue Growth',
        'description': 'AI strategies that directly impact your bottom line',
      },
      {
        'icon': Icons.speed,
        'title': 'Efficiency Gains',
        'description': 'Streamline operations with intelligent automation',
      },
      {
        'icon': Icons.insights,
        'title': 'Data-Driven Insights',
        'description': 'Transform data into actionable business intelligence',
      },
      {
        'icon': Icons.security,
        'title': 'Risk Mitigation',
        'description': 'Identify and address potential challenges early',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Why Choose Our Consulting?',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        )
        .animate()
        .fadeIn(duration: 600.ms, delay: 600.ms),
        
        const SizedBox(height: 24),
        
        ...benefits.asMap().entries.map((entry) {
          final index = entry.key;
          final benefit = entry.value;
          
          return Container(
            margin: const EdgeInsets.only(bottom: 20),
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
                    benefit['icon'] as IconData,
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
                        benefit['title'] as String,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        benefit['description'] as String,
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
          .fadeIn(duration: 600.ms, delay: Duration(milliseconds: 700 + (index * 100)))
          .slideX(begin: -0.2, end: 0);
        }),
      ],
    );
  }

  Widget _buildImageContent(BuildContext context) {
    return Stack(
      children: [
        // Main consulting image
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
              "https://pixabay.com/get/g4e4a5ec99cdf017344a8dd759f36c42657e2e0bbd808195046e6f3ff7044be040d37a602e37af85309dc7cc48ebe32b2ab6a8e906301c704d5e2d72aac1a79ab_1280.jpg",
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
        )
        .animate()
        .fadeIn(duration: 800.ms, delay: 400.ms)
        .scale(begin: const Offset(0.8, 0.8), end: const Offset(1.0, 1.0)),
        
        // Floating analytics indicators
        ..._buildFloatingIndicators(context),
      ],
    );
  }

  List<Widget> _buildFloatingIndicators(BuildContext context) {
    return [
      // Growth chart indicator
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
                      Icons.trending_up,
                      color: Colors.white,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '+127% ROI',
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
      
      // AI insights indicator
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
                      Icons.psychology,
                      color: Colors.white,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'AI Insights',
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