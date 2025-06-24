import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../models/service_model.dart';

import '../theme.dart';

class ProductsSection extends StatefulWidget {
  const ProductsSection({super.key});

  @override
  State<ProductsSection> createState() => _ProductsSectionState();
}

class _ProductsSectionState extends State<ProductsSection> {
  bool _isCaseStudyHovered = false;
  bool _isDownloadHovered = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 1024;
    final isTablet = size.width > 768;
    
    final findRosi = ServiceData.getFindRosiProduct();

    return Container(
      width: double.infinity,
      color: colorScheme.surface,
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
                    'Our Products',
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
                    'Showcasing our proven expertise through innovative AI-powered applications that demonstrate real-world implementation and results.',
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
            
            // Find Rosi Product Card
            Container(
              constraints: BoxConstraints(
                maxWidth: isDesktop ? 1000 : double.infinity,
              ),
              child: Container(
                padding: EdgeInsets.all(isDesktop ? 48 : 32),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      colorScheme.primary.withOpacity(0.05),
                      colorScheme.secondary.withOpacity(0.05),
                      colorScheme.tertiary.withOpacity(0.05),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: colorScheme.primary.withOpacity(0.2),
                    width: 1,
                  ),
                ),
                child: isDesktop
                    ? Row(
                        children: [
                          // Product Image
                          Expanded(
                            flex: 2,
                            child: _buildProductImage(context, findRosi),
                          ),
                          const SizedBox(width: 48),
                          // Product Info
                          Expanded(
                            flex: 3,
                            child: _buildProductInfo(context, findRosi),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          _buildProductImage(context, findRosi),
                          const SizedBox(height: 32),
                          _buildProductInfo(context, findRosi),
                        ],
                      ),
              ),
            ).animate().fadeIn(
              delay: 400.ms,
              duration: 800.ms,
            ).slideY(
              begin: 0.3,
              end: 0,
              duration: 800.ms,
            ),
            
            SizedBox(height: isDesktop ? 80 : 48),
            
            // Proof of Work Section
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(isDesktop ? 40 : 24),
              decoration: BoxDecoration(
                color: colorScheme.surfaceVariant.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: colorScheme.outline.withOpacity(0.1),
                  width: 1,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.verified,
                        color: colorScheme.tertiary,
                        size: 24,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Proof of Work',
                        style: textTheme.titleLarge?.copyWith(
                          color: colorScheme.onSurface,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Find Rosi demonstrates our ability to seamlessly integrate advanced AI capabilities into user-friendly mobile applications, showcasing our expertise in full-stack AI development.',
                    style: textTheme.bodyLarge?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  
                  // Key Achievement Metrics
                  isDesktop
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildAchievementItem(
                              context,
                              '100%',
                              'Client Satisfaction',
                              Icons.sentiment_very_satisfied,
                            ),
                            _buildVerticalDivider(context),
                            _buildAchievementItem(
                              context,
                              '95%',
                              'Performance Score',
                              Icons.speed,
                            ),
                            _buildVerticalDivider(context),
                            _buildAchievementItem(
                              context,
                              '24/7',
                              'App Reliability',
                              Icons.access_time,
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            _buildAchievementItem(
                              context,
                              '100%',
                              'Client Satisfaction',
                              Icons.sentiment_very_satisfied,
                            ),
                            const SizedBox(height: 24),
                            _buildAchievementItem(
                              context,
                              '95%',
                              'Performance Score',
                              Icons.speed,
                            ),
                            const SizedBox(height: 24),
                            _buildAchievementItem(
                              context,
                              '24/7',
                              'App Reliability',
                              Icons.access_time,
                            ),
                          ],
                        ),
                ],
              ),
            ).animate().fadeIn(
              delay: 600.ms,
              duration: 800.ms,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductImage(BuildContext context, ProductModel product) {
    final colorScheme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 1024;
    
    return Container(
      height: isDesktop ? 300 : 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colorScheme.secondary.withOpacity(0.1),
            colorScheme.tertiary.withOpacity(0.1),
          ],
        ),
        border: Border.all(
          color: colorScheme.secondary.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Stack(
        children: [
          // Background pattern
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: NetworkImage(product.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Overlay gradient
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    colorScheme.primary.withOpacity(0.3),
                  ],
                ),
              ),
            ),
          ),
          // Floating elements
          Positioned(
            top: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: colorScheme.surface.withOpacity(0.9),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: colorScheme.primary.withOpacity(0.3),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.star,
                    color: colorScheme.tertiary,
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Featured',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurface,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductInfo(BuildContext context, ProductModel product) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.name,
          style: textTheme.headlineMedium?.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          product.description,
          style: textTheme.bodyLarge?.copyWith(
            color: colorScheme.onSurfaceVariant,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 32),
        
        // Key Points
        Column(
          children: product.keyPoints.map((point) {
            final index = product.keyPoints.indexOf(point);
            final icons = [Icons.phone_android, Icons.web, Icons.psychology];
            
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: colorScheme.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      icons[index % icons.length],
                      color: colorScheme.primary,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      point,
                      style: textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurface,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
        
        const SizedBox(height: 32),
        
        // CTA Buttons with dropdowns
        Row(
          children: [
            Expanded(
              child: _buildDropdownButton(
                context,
                'View Case Study',
                null,
                true,
                _isCaseStudyHovered,
                (hovering) => setState(() => _isCaseStudyHovered = hovering),
                () => Navigator.of(context).pushNamed('/ai-app-development'),
                _buildProductDropdown(context, _isCaseStudyHovered, 'case_study'),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildDropdownButton(
                context,
                'Download App',
                null,
                false,
                _isDownloadHovered,
                (hovering) => setState(() => _isDownloadHovered = hovering),
                () => Navigator.of(context).pushNamed('/ai-app-development'),
                _buildProductDropdown(context, _isDownloadHovered, 'download'),
              ),
            ),
          ],
        ),
      ],
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
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                    padding: const EdgeInsets.symmetric(vertical: 16),
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
              right: 0,
              child: dropdown,
            ),
        ],
      ),
    );
  }

  Widget _buildProductDropdown(BuildContext context, bool isVisible, String type) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final product = ServiceData.getFindRosiProduct();
    
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 200),
      opacity: isVisible ? 1.0 : 0.0,
      child: Container(
        width: double.infinity,
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
                  type == 'case_study' ? Icons.description : Icons.get_app,
                  color: colorScheme.secondary,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  type == 'case_study' 
                      ? 'View Case Study & Details' 
                      : 'Get FindRosi App',
                  style: textTheme.titleMedium?.copyWith(
                    color: colorScheme.onSurface,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            
            // Product item
            InkWell(
              onTap: () => Navigator.of(context).pushNamed('/ai-app-development'),
              borderRadius: BorderRadius.circular(8),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
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
                          const SizedBox(height: 4),
                          Text(
                            type == 'case_study'
                                ? 'See the complete development process, architecture, and results'
                                : 'Download and experience our AI-powered app firsthand',
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
            ),
            
            if (type == 'download') ...[
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.info_outline,
                      color: colorScheme.tertiary,
                      size: 16,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Available on iOS and Android',
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.tertiary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildAchievementItem(
    BuildContext context,
    String value,
    String label,
    IconData icon,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    
    return Column(
      children: [
        Icon(
          icon,
          color: colorScheme.tertiary,
          size: 32,
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: textTheme.headlineMedium?.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: textTheme.bodySmall?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildVerticalDivider(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return Container(
      width: 1,
      height: 60,
      color: colorScheme.outline.withOpacity(0.3),
    );
  }
}