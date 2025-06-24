import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../models/service_model.dart';
import '../widgets/service_card.dart';
import '../theme.dart';

class ServicesSection extends StatefulWidget {
  const ServicesSection({super.key});

  @override
  State<ServicesSection> createState() => _ServicesSectionState();
}

class _ServicesSectionState extends State<ServicesSection> {
  bool _isGetStartedHovered = false;
  bool _isScheduleCallHovered = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 1024;
    final isTablet = size.width > 768;
    
    final services = ServiceData.getServices();

    return Container(
      width: double.infinity,
      color: colorScheme.surfaceVariant.withOpacity(0.3),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isDesktop ? 80 : (isTablet ? 40 : 24),
          vertical: isDesktop ? 120 : (isTablet ? 80 : 60),
        ),
        child: Column(
          children: [
            // Section Header
            Container(
              constraints: BoxConstraints(
                maxWidth: isDesktop ? 800 : double.infinity,
              ),
              child: Column(
                children: [
                  Text(
                    'Our Services',
                    style: textTheme.displaySmall?.copyWith(
                      color: colorScheme.onSurface,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ).animate().fadeIn(duration: 600.ms).slideY(
                    begin: 0.3,
                    end: 0,
                    duration: 600.ms,
                  ),
                  
                  const SizedBox(height: 16),
                  
                  Text(
                    'Comprehensive AI solutions designed to accelerate your business transformation and unlock the power of intelligent data processing.',
                    style: textTheme.titleMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ).animate().fadeIn(
                    delay: 200.ms,
                    duration: 600.ms,
                  ).slideY(
                    begin: 0.3,
                    end: 0,
                    duration: 600.ms,
                  ),
                ],
              ),
            ),
            
            SizedBox(height: isDesktop ? 80 : 48),
            
            // Services Grid
            LayoutBuilder(
              builder: (context, constraints) {
                int crossAxisCount;
                double childAspectRatio;
                
                if (constraints.maxWidth > 1200) {
                  crossAxisCount = 2;
                  childAspectRatio = 1.1;
                } else if (constraints.maxWidth > 768) {
                  crossAxisCount = 2;
                  childAspectRatio = 0.9;
                } else {
                  crossAxisCount = 1;
                  childAspectRatio = 0.8;
                }
                
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: isDesktop ? 32 : 16,
                    mainAxisSpacing: isDesktop ? 32 : 16,
                    childAspectRatio: childAspectRatio,
                  ),
                  itemCount: services.length,
                  itemBuilder: (context, index) {
                    return ServiceCard(
                      service: services[index],
                      index: index,
                    );
                  },
                );
              },
            ),
            
            SizedBox(height: isDesktop ? 60 : 40),
            
            // CTA Section
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(isDesktop ? 48 : 32),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    colorScheme.primary.withOpacity(0.1),
                    colorScheme.secondary.withOpacity(0.1),
                  ],
                ),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: colorScheme.primary.withOpacity(0.2),
                  width: 1,
                ),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.rocket_launch,
                    size: 48,
                    color: colorScheme.primary,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Ready to Transform Your Business?',
                    style: textTheme.headlineSmall?.copyWith(
                      color: colorScheme.onSurface,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Let\'s discuss how our AI services can accelerate your projects and deliver exceptional results.',
                    style: textTheme.bodyLarge?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (isTablet) ...[
                        // Get Started button with services dropdown
                        _buildDropdownButton(
                          context,
                          'Get Started',
                          Icons.arrow_forward,
                          true,
                          _isGetStartedHovered,
                          (hovering) => setState(() => _isGetStartedHovered = hovering),
                          () => Navigator.of(context).pushNamed('/book-demo'),
                          _buildServicesDropdown(context, _isGetStartedHovered),
                        ),
                        const SizedBox(width: 16),
                        // Schedule Call button with services dropdown
                        _buildDropdownButton(
                          context,
                          'Schedule Call',
                          null,
                          false,
                          _isScheduleCallHovered,
                          (hovering) => setState(() => _isScheduleCallHovered = hovering),
                          () => Navigator.of(context).pushNamed('/book-demo'),
                          _buildServicesDropdown(context, _isScheduleCallHovered),
                        ),
                      ] else ...[
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('/book-demo');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: colorScheme.primary,
                              foregroundColor: colorScheme.onPrimary,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text(
                              'Get Started',
                              style: textTheme.labelLarge?.copyWith(
                                color: colorScheme.onPrimary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ).animate().fadeIn(
              delay: 800.ms,
              duration: 600.ms,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownButton(
    BuildContext context,
    String title,
    IconData? icon,
    bool isPrimary,
    bool isHovered,
    Function(bool) onHover,
    VoidCallback onPressed,
    Widget dropdown,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return MouseRegion(
      onEnter: (_) => onHover(true),
      onExit: (_) => onHover(false),
      child: Stack(
        children: [
          isPrimary
              ? ElevatedButton(
                  onPressed: onPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.primary,
                    foregroundColor: colorScheme.onPrimary,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title,
                        style: textTheme.labelLarge?.copyWith(
                          color: colorScheme.onPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (icon != null) ...[
                        const SizedBox(width: 8),
                        Icon(
                          icon,
                          color: colorScheme.onPrimary,
                          size: 18,
                        ),
                      ],
                    ],
                  ),
                )
              : OutlinedButton(
                  onPressed: onPressed,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: colorScheme.primary,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    side: BorderSide(
                      color: colorScheme.primary,
                      width: 1,
                    ),
                  ),
                  child: Text(
                    title,
                    style: textTheme.labelLarge?.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
          // Dropdown positioned below button
          if (isHovered)
            Positioned(
              top: 60,
              left: 0,
              child: dropdown,
            ),
        ],
      ),
    );
  }

  Widget _buildServicesDropdown(BuildContext context, bool isVisible) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final services = ServiceData.getServices();
    
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 200),
      opacity: isVisible ? 1.0 : 0.0,
      child: Container(
        width: 300,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: colorScheme.outline.withOpacity(0.2),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Icon(
                  Icons.business_center,
                  color: colorScheme.primary,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  'Choose a Service to Get Started',
                  style: textTheme.titleMedium?.copyWith(
                    color: colorScheme.onSurface,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...services.map((service) => _buildDropdownServiceItem(context, service)),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: colorScheme.tertiary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: colorScheme.tertiary.withOpacity(0.2),
                ),
              ),
              child: InkWell(
                onTap: () => Navigator.of(context).pushNamed('/book-demo'),
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.calendar_today,
                        color: colorScheme.tertiary,
                        size: 16,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Book a Consultation',
                        style: textTheme.labelMedium?.copyWith(
                          color: colorScheme.tertiary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownServiceItem(BuildContext context, ServiceModel service) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    
    return InkWell(
      onTap: () => _navigateToService(context, service),
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: colorScheme.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Icon(
                _getIconData(service.icon),
                color: colorScheme.primary,
                size: 16,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    service.title,
                    style: textTheme.labelMedium?.copyWith(
                      color: colorScheme.onSurface,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    service.description,
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      height: 1.2,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: colorScheme.onSurfaceVariant,
              size: 12,
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToService(BuildContext context, ServiceModel service) {
    switch (service.title) {
      case 'Data Labeling':
        Navigator.of(context).pushNamed('/data-annotation');
        break;
      case 'AI Applications':
        Navigator.of(context).pushNamed('/ai-app-development');
        break;
      case 'AI Services & Consulting':
        Navigator.of(context).pushNamed('/ai-consulting');
        break;
      case 'Data Acquisition & Generation':
        Navigator.of(context).pushNamed('/ai-data-acquisition');
        break;
      default:
        Navigator.of(context).pushNamed('/book-demo');
        break;
    }
  }

  IconData _getIconData(String iconName) {
    switch (iconName) {
      case 'label':
        return Icons.label;
      case 'apps':
        return Icons.apps;
      case 'support_agent':
        return Icons.support_agent;
      case 'storage':
        return Icons.storage;
      default:
        return Icons.star;
    }
  }
}