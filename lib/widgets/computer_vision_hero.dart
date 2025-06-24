import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../theme.dart';

class ComputerVisionHero extends StatelessWidget {
  const ComputerVisionHero({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveBreakpoints.of(context).largerThan(TABLET);
    
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : 24,
        vertical: isDesktop ? 120 : 80,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).colorScheme.secondary.withOpacity(0.05),
            Theme.of(context).colorScheme.tertiary.withOpacity(0.05),
          ],
        ),
      ),
      child: Column(
        children: [
          // Breadcrumb Navigation
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 40),
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
          
          // Hero Content
          Container(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Column(
              children: [
                // Title Section
                Text(
                  'Computer Vision Annotation',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.onSurface,
                    height: 1.1,
                  ),
                  textAlign: TextAlign.center,
                )
                    .animate()
                    .fadeIn(duration: 800.ms)
                    .slideY(begin: 0.3, end: 0),
                
                const SizedBox(height: 24),
                
                // Subtitle
                Container(
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: Text(
                    'Enable machines to interpret and make decisions based on visual data with precision and scalability that surpasses human capabilities.',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                      height: 1.5,
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.center,
                  )
                      .animate(delay: 200.ms)
                      .fadeIn(duration: 800.ms)
                      .slideY(begin: 0.3, end: 0),
                ),
                
                const SizedBox(height: 60),
                
                // Computer Vision Capabilities
                isDesktop ? _buildDesktopCapabilities(context) : _buildMobileCapabilities(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBreadcrumbItem(BuildContext context, String text, bool isActive) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isActive 
            ? Theme.of(context).colorScheme.primary.withOpacity(0.1)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: isActive 
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.onSurfaceVariant,
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
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
    );
  }

  Widget _buildDesktopCapabilities(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildCapabilityItem(context, Icons.visibility, 'Object Detection', 0),
        _buildCapabilityItem(context, Icons.image, 'Image Classification', 200),
        _buildCapabilityItem(context, Icons.border_clear, 'Segmentation', 400),
        _buildCapabilityItem(context, Icons.face, 'Facial Recognition', 600),
      ],
    );
  }

  Widget _buildMobileCapabilities(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildCapabilityItem(context, Icons.visibility, 'Object Detection', 0),
            _buildCapabilityItem(context, Icons.image, 'Image Classification', 200),
          ],
        ),
        const SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildCapabilityItem(context, Icons.border_clear, 'Segmentation', 400),
            _buildCapabilityItem(context, Icons.face, 'Facial Recognition', 600),
          ],
        ),
      ],
    );
  }

  Widget _buildCapabilityItem(BuildContext context, IconData icon, String label, int delay) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              size: 24,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            label,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    )
        .animate(delay: Duration(milliseconds: delay))
        .fadeIn(duration: 600.ms)
        .slideY(begin: 0.3, end: 0)
        .then()
        .shimmer(duration: 1000.ms, color: Theme.of(context).colorScheme.secondary.withOpacity(0.3));
  }
}