import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../models/service_model.dart';
import '../theme.dart';

class ServiceCard extends StatefulWidget {
  final ServiceModel service;
  final int index;
  final void Function(BuildContext, ServiceModel) onNavigate;

  const ServiceCard({
    super.key,
    required this.service,
    required this.index,
    required this.onNavigate,
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

  bool get _isNew {
    // If you have `isNew` in ServiceModel, use it:
    // return widget.service.isNew;
    // Otherwise, fallback by title:
    return widget.service.title.trim().toLowerCase() == 'ai agents';
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
              padding: const EdgeInsets.all(20), // reduced from 32
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
                borderRadius: BorderRadius.circular(16), // reduced from 24
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
                    blurRadius: _isHovered ? 14 : 7, // reduced blur
                    offset: Offset(0, _isHovered ? 6 : 3), // reduced offset
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
                              width: 44, // reduced from 64
                              height: 44, // reduced from 64
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
                                borderRadius: BorderRadius.circular(12), // reduced
                                boxShadow: [
                                  BoxShadow(
                                    color: widget.service.isPrimary
                                        ? colorScheme.primary.withOpacity(0.3)
                                        : colorScheme.secondary.withOpacity(0.2),
                                    blurRadius: 8, // reduced
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Icon(
                                _getIconData(widget.service.icon),
                                size: 24, // reduced from 32
                                color: colorScheme.onPrimary,
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(width: 10), // reduced
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    widget.service.title,
                                    style: textTheme.titleLarge?.copyWith(
                                      color: colorScheme.onSurface,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                if (widget.service.isPrimary)
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 4,
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
                                if (_isNew)
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: colorScheme.secondary,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.fiber_new,
                                          size: 14,
                                          color: colorScheme.onSecondary,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          'New',
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
                                      .scale(begin: const Offset(0.8, 0.8))
                                      .then()
                                      .shimmer(duration: 2000.ms),
                                if (widget.service.isPreview)
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 4,
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

                  const SizedBox(height: 14), // reduced from 20

                  // Service Description
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    child: Text(
                      widget.service.description,
                      style: textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        height: 1.5,
                      ),
                    ),
                  ),

                  const SizedBox(height: 16), // reduced from 24

                  // Service Features
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Key Features:',
                        style: textTheme.titleSmall?.copyWith(
                          color: colorScheme.onSurface,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8), // reduced
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

                  const SizedBox(height: 16), // reduced from 24

                  // Action Button
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: widget.service.isPreview
                          ? null
                          : () {
                              widget.onNavigate(context, widget.service);
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
                        padding: const EdgeInsets.symmetric(vertical: 14), // reduced
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
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
                            size: 18,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            widget.service.isPreview
                                ? 'Available Soon'
                                : 'Learn More',
                            style: textTheme.labelMedium?.copyWith(
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
      margin: const EdgeInsets.only(bottom: 6), // reduced from 8
      child: Row(
        children: [
          Container(
            width: 5,
            height: 5,
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
          const SizedBox(width: 10), // reduced from 12
          Expanded(
            child: Text(
              feature,
              style: textTheme.bodySmall?.copyWith(
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
      case 'smart_toy':
        return Icons.smart_toy;
      default:
        return Icons.star;
    }
  }
}