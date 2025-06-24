import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../theme.dart';
import '../models/service_model.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {
  bool _isServicesHovered = false;
  bool _isProductsHovered = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 1024;
    final isTablet = size.width > 768;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colorScheme.surface,
            colorScheme.surfaceVariant.withOpacity(0.3),
            colorScheme.primary.withOpacity(0.05),
          ],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isDesktop ? 80 : (isTablet ? 40 : 24),
          vertical: isDesktop ? 120 : (isTablet ? 80 : 60),
        ),
        child: Column(
          children: [
            Container(
              constraints: BoxConstraints(
                maxWidth: isDesktop ? 900 : double.infinity,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Main Headline
                  Text(
                    'AI Solutions for the Future',
                    style: textTheme.displayMedium?.copyWith(
                      color: colorScheme.onSurface,
                      fontWeight: FontWeight.w700,
                      height: 1.1,
                    ),
                    textAlign: TextAlign.center,
                  ).animate().fadeIn(duration: 800.ms).slideY(
                    begin: 0.3,
                    end: 0,
                    duration: 800.ms,
                  ),
                  
                  SizedBox(height: isDesktop ? 32 : 24),
                  
                  // Subtitle
                  Text(
                    'We transform businesses through intelligent data labeling, cutting-edge AI applications, and innovative data solutions. Your partner for comprehensive AI implementation.',
                    style: textTheme.headlineSmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.w400,
                      height: 1.4,
                    ),
                    textAlign: TextAlign.center,
                  ).animate().fadeIn(
                    delay: 200.ms,
                    duration: 800.ms,
                  ).slideY(
                    begin: 0.3,
                    end: 0,
                    duration: 800.ms,
                  ),
                  
                  SizedBox(height: isDesktop ? 48 : 32),
                  
                  // CTA Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (isTablet) ...[
                        // Services button with dropdown
                        _buildDropdownButton(
                          context,
                          'Explore Services',
                          Icons.arrow_forward,
                          true,
                          _isServicesHovered,
                          (hovering) => setState(() => _isServicesHovered = hovering),
                          () => Navigator.of(context).pushNamed('/data-annotation'),
                          _buildServicesDropdown(context),
                        ),
                        const SizedBox(width: 16),
                        // Products button with dropdown
                        _buildDropdownButton(
                          context,
                          'View Portfolio',
                          null,
                          false,
                          _isProductsHovered,
                          (hovering) => setState(() => _isProductsHovered = hovering),
                          () => Navigator.of(context).pushNamed('/ai-app-development'),
                          _buildProductsDropdown(context),
                        ),
                      ] else ...[
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('/data-annotation');
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
                              'Explore Services',
                              style: textTheme.labelLarge?.copyWith(
                                color: colorScheme.onPrimary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ).animate().fadeIn(
                    delay: 400.ms,
                    duration: 800.ms,
                  ).slideY(
                    begin: 0.3,
                    end: 0,
                    duration: 800.ms,
                  ),
                  
                  SizedBox(height: isDesktop ? 60 : 32),
                ],
              ),
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
                      color: colorScheme.outline,
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

  Widget _buildServicesDropdown(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final services = ServiceData.getServices();
    
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 200),
      opacity: _isServicesHovered ? 1.0 : 0.0,
      child: Container(
        width: 280,
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
                  'Our Services',
                  style: textTheme.titleMedium?.copyWith(
                    color: colorScheme.onSurface,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ...services.map((service) => _buildDropdownServiceItem(context, service)),
          ],
        ),
      ),
    );
  }

  Widget _buildProductsDropdown(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final product = ServiceData.getFindRosiProduct();
    
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 200),
      opacity: _isProductsHovered ? 1.0 : 0.0,
      child: Container(
        width: 250,
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
                  Icons.apps,
                  color: colorScheme.secondary,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  'Our Products',
                  style: textTheme.titleMedium?.copyWith(
                    color: colorScheme.onSurface,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _buildDropdownProductItem(context, product),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: colorScheme.secondary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                'More products coming soon!',
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.secondary,
                  fontStyle: FontStyle.italic,
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
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
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
                  const SizedBox(height: 2),
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
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownProductItem(BuildContext context, ProductModel product) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed('/ai-app-development'),
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                  colors: [
                    colorScheme.secondary.withOpacity(0.2),
                    colorScheme.tertiary.withOpacity(0.2),
                  ],
                ),
              ),
              child: Icon(
                Icons.phone_android,
                color: colorScheme.secondary,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: textTheme.labelMedium?.copyWith(
                      color: colorScheme.onSurface,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    product.description,
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

  Widget _buildStatItem(BuildContext context, String value, String label) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    
    return Column(
      children: [
        Text(
          value,
          style: textTheme.headlineMedium?.copyWith(
            color: colorScheme.primary,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: textTheme.bodySmall?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  Widget _buildDivider(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return Container(
      width: 1,
      height: 40,
      color: colorScheme.outline.withOpacity(0.3),
    );
  }
}