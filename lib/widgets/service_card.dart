import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../models/service_model.dart';
import '../theme.dart';

class ServiceCard extends StatefulWidget {
  final ServiceModel service;
  final int index;

  const ServiceCard({
    super.key,
    required this.service,
    required this.index,
  });

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> with TickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _flipController;
  late AnimationController _pulseController;
  late Animation<double> _flipAnimation;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _flipController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _pulseController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    
    _flipAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _flipController,
      curve: Curves.easeInOut,
    ));
    
    _pulseAnimation = Tween<double>(
      begin: 1.0,
      end: 1.1,
    ).animate(CurvedAnimation(
      parent: _pulseController,
      curve: Curves.easeInOut,
    ));

    // Start pulse animation for primary service
    if (widget.service.isPrimary) {
      _pulseController.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    _flipController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  void _onHover(bool isHovered) {
    setState(() => _isHovered = isHovered);
    if (isHovered) {
      _flipController.forward();
    } else {
      _flipController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 1024;

    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: AnimatedBuilder(
        animation: widget.service.isPrimary ? _pulseAnimation : _flipAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: widget.service.isPrimary && !_isHovered 
                ? _pulseAnimation.value 
                : (_isHovered && isDesktop ? 1.05 : 1.0),
            child: Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                gradient: widget.service.isPrimary
                    ? LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          colorScheme.primary.withOpacity(_isHovered ? 0.15 : 0.08),
                          colorScheme.secondary.withOpacity(_isHovered ? 0.15 : 0.08),
                        ],
                      )
                    : LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          colorScheme.surface,
                          colorScheme.surfaceVariant.withOpacity(0.5),
                        ],
                      ),
                color: widget.service.isPrimary
                    ? null
                    : _isHovered
                        ? colorScheme.surfaceVariant.withOpacity(0.3)
                        : colorScheme.surface,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: widget.service.isPrimary
                      ? colorScheme.primary.withOpacity(_isHovered ? 0.3 : 0.2)
                      : colorScheme.outline.withOpacity(_isHovered ? 0.3 : 0.1),
                  width: _isHovered ? 2 : 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: widget.service.isPrimary
                        ? colorScheme.primary.withOpacity(_isHovered ? 0.2 : 0.1)
                        : Colors.black.withOpacity(_isHovered ? 0.1 : 0.05),
                    blurRadius: _isHovered ? 20 : 10,
                    offset: Offset(0, _isHovered ? 8 : 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Service Header
                  Row(
                    children: [
                      // Animated Icon Container
                      AnimatedBuilder(
                        animation: _flipAnimation,
                        builder: (context, child) {
                          return Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.identity()
                              ..setEntry(3, 2, 0.001)
                              ..rotateY(_flipAnimation.value * 3.14159),
                            child: Container(
                              width: 64,
                              height: 64,
                              decoration: BoxDecoration(
                                gradient: widget.service.isPrimary
                                    ? LinearGradient(
                                        colors: [
                                          colorScheme.primary,
                                          colorScheme.secondary,
                                        ],
                                      )
                                    : LinearGradient(
                                        colors: [
                                          colorScheme.secondary.withOpacity(0.8),
                                          colorScheme.tertiary.withOpacity(0.8),
                                        ],
                                      ),
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    color: widget.service.isPrimary
                                        ? colorScheme.primary.withOpacity(0.3)
                                        : colorScheme.secondary.withOpacity(0.2),
                                    blurRadius: 12,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Icon(
                                _getIconData(widget.service.icon),
                                size: 32,
                                color: colorScheme.onPrimary,
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    widget.service.title,
                                    style: textTheme.headlineSmall?.copyWith(
                                      color: colorScheme.onSurface,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                if (widget.service.isPrimary)
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          colorScheme.primary,
                                          colorScheme.secondary,
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.star,
                                          size: 14,
                                          color: colorScheme.onPrimary,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          'Featured',
                                          style: textTheme.labelSmall?.copyWith(
                                            color: colorScheme.onPrimary,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                      .animate()
                                      .fadeIn(delay: 300.ms)
                                      .scale(begin: const Offset(0.8, 0.8))
                                      .then()
                                      .shimmer(duration: 2000.ms),
                                if (widget.service.isPreview)
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      color: colorScheme.secondary,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.schedule,
                                          size: 14,
                                          color: colorScheme.onSecondary,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          'Coming Soon',
                                          style: textTheme.labelSmall?.copyWith(
                                            color: colorScheme.onSecondary,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                      .animate()
                                      .fadeIn(delay: 300.ms)
                                      .slideX(begin: 0.3, end: 0)
                                      .then()
                                      .shimmer(duration: 2000.ms),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Service Description
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    child: Text(
                      widget.service.description,
                      style: textTheme.bodyLarge?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        height: 1.6,
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Service Features
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Key Features:',
                        style: textTheme.titleMedium?.copyWith(
                          color: colorScheme.onSurface,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 12),
                      ...widget.service.features.asMap().entries.map((entry) {
                        final index = entry.key;
                        final feature = entry.value;
                        return _buildFeatureItem(
                          context,
                          feature,
                          index,
                        );
                      }),
                    ],
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Action Button
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: widget.service.isPreview ? null : () {
                        _navigateToService(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: widget.service.isPrimary
                            ? colorScheme.primary
                            : widget.service.isPreview
                                ? colorScheme.onSurfaceVariant.withOpacity(0.3)
                                : colorScheme.secondary,
                        foregroundColor: widget.service.isPrimary
                            ? colorScheme.onPrimary
                            : widget.service.isPreview
                                ? colorScheme.onSurfaceVariant
                                : colorScheme.onSecondary,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            widget.service.isPreview
                                ? Icons.schedule
                                : Icons.arrow_forward,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            widget.service.isPreview
                                ? 'Available Soon'
                                : 'Learn More',
                            style: textTheme.labelLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    )
        .animate()
        .fadeIn(
          duration: 600.ms,
          delay: Duration(milliseconds: 200 * widget.index),
        )
        .slideY(
          begin: 0.3,
          end: 0,
          duration: 600.ms,
          delay: Duration(milliseconds: 200 * widget.index),
        );
  }

  Widget _buildFeatureItem(BuildContext context, String feature, int index) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: widget.service.isPrimary
                    ? [colorScheme.primary, colorScheme.secondary]
                    : [colorScheme.secondary, colorScheme.tertiary],
              ),
            ),
          )
              .animate()
              .fadeIn(
                duration: 400.ms,
                delay: Duration(milliseconds: 300 + (index * 100)),
              )
              .scale(
                begin: const Offset(0, 0),
                end: const Offset(1, 1),
                duration: 400.ms,
                delay: Duration(milliseconds: 300 + (index * 100)),
              ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              feature,
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          )
              .animate()
              .fadeIn(
                duration: 400.ms,
                delay: Duration(milliseconds: 350 + (index * 100)),
              )
              .slideX(
                begin: 0.2,
                end: 0,
                duration: 400.ms,
                delay: Duration(milliseconds: 350 + (index * 100)),
              ),
        ],
      ),
    );
  }

  IconData _getIconData(String iconName) {
    switch (iconName) {
      case 'dataset':
        return Icons.dataset;
      case 'phone_android':
        return Icons.phone_android;
      case 'psychology':
        return Icons.psychology;
      case 'cloud_download':
        return Icons.cloud_download;
      default:
        return Icons.star;
    }
  }

  void _navigateToService(BuildContext context) {
    switch (widget.service.title) {
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
    }
  }
}