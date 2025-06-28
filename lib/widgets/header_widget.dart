import 'package:flutter/material.dart';
import '../theme.dart';
import '../models/service_model.dart';

class HeaderWidget extends StatefulWidget implements PreferredSizeWidget {
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
  
  @override
  Size get preferredSize => const Size.fromHeight(120);
}

class _HeaderWidgetState extends State<HeaderWidget> {
  bool _isServicesHovered = false;
  bool _servicesDropdownHovered = false;
  bool _isProductsHovered = false;
  bool _productsDropdownHovered = false;

  void _closeDropdowns() {
    setState(() {
      _isServicesHovered = false;
      _servicesDropdownHovered = false;
      _isProductsHovered = false;
      _productsDropdownHovered = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    bool showServicesDropdown = _isServicesHovered || _servicesDropdownHovered;
    bool showProductsDropdown = _isProductsHovered || _productsDropdownHovered;

    return MouseRegion(
      onExit: (_) => _closeDropdowns(),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("https://pixabay.com/get/gb872fce18a6f88864f24525a66b276c98e332073208e7b0c0fdec94f10de6c94c5f19631c9484a5533ea156f5b8497f095d0c75036f90440a0a7a4631cc1f56d_1280.jpg"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  colorScheme.surface.withOpacity(0.85),
                  BlendMode.overlay,
                ),
              ),
              border: Border(
                bottom: BorderSide(
                  color: colorScheme.outline.withOpacity(0.2),
                  width: 0.5,
                ),
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    colorScheme.surface.withOpacity(0.95),
                    colorScheme.surface.withOpacity(0.9),
                  ],
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                  child: Row(
                    children: [
                      // Logo/Company Name
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              colorScheme.primary,
                              colorScheme.secondary,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: colorScheme.primary.withOpacity(0.3),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Text(
                          'ImplementAI MH UG',
                          style: textTheme.titleLarge?.copyWith(
                            color: colorScheme.onPrimary,
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.5,
                          ),
                        ),
                      ),
                      const Spacer(),
                      if (MediaQuery.of(context).size.width > 768)
                        Row(
                          children: [
                            // Services Dropdown
                            MouseRegion(
                              onEnter: (_) => setState(() => _isServicesHovered = true),
                              onExit: (_) => setState(() => _isServicesHovered = false),
                              child: _buildDropdownNavItem(
                                context,
                                'Services',
                                _isServicesHovered || _servicesDropdownHovered,
                                icon: Icons.keyboard_arrow_down,
                              ),
                            ),
                            const SizedBox(width: 32),
                            // Products Dropdown
                            MouseRegion(
                              onEnter: (_) => setState(() => _isProductsHovered = true),
                              onExit: (_) => setState(() => _isProductsHovered = false),
                              child: _buildDropdownNavItem(
                                context,
                                'Products',
                                _isProductsHovered || _productsDropdownHovered,
                                icon: Icons.keyboard_arrow_down,
                              ),
                            ),
                            const SizedBox(width: 32),
                            _buildNavItem(context, 'About'),
                            const SizedBox(width: 32),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: colorScheme.primary.withOpacity(0.3),
                                    blurRadius: 8,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pushNamed('/book-demo');
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: colorScheme.primary,
                                  foregroundColor: colorScheme.onPrimary,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 24,
                                    vertical: 12,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  elevation: 0,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.chat_bubble_outline,
                                      size: 16,
                                      color: colorScheme.onPrimary,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      'Contact',
                                      style: textTheme.labelMedium?.copyWith(
                                        color: colorScheme.onPrimary,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      else
                        // Mobile menu omitted for brevity
                        Container(
                          decoration: BoxDecoration(
                            color: colorScheme.surface.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: IconButton(
                            onPressed: () {
                              // Implement mobile nav
                            },
                            icon: Icon(
                              Icons.menu,
                              color: colorScheme.onSurface,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Services Dropdown
          if (showServicesDropdown)
            Positioned(
              top: 100,
              right: 280,
              child: MouseRegion(
                onEnter: (_) => setState(() => _servicesDropdownHovered = true),
                onExit: (_) => setState(() => _servicesDropdownHovered = false),
                child: _buildDropdownWithAnimation(
                  context,
                  _buildServicesDropdown(context),
                  showServicesDropdown,
                ),
              ),
            ),
          // Products Dropdown
          if (showProductsDropdown)
            Positioned(
              top: 100,
              right: 120,
              child: MouseRegion(
                onEnter: (_) => setState(() => _productsDropdownHovered = true),
                onExit: (_) => setState(() => _productsDropdownHovered = false),
                child: _buildDropdownWithAnimation(
                  context,
                  _buildProductsDropdown(context),
                  showProductsDropdown,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, String title) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          if (title == 'About') {
            Navigator.of(context).pushNamed('/impressum');
          } else if (title == 'Home') {
            Navigator.of(context).pushNamed('/');
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            title,
            style: textTheme.labelLarge?.copyWith(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownNavItem(
    BuildContext context,
    String title,
    bool isActive, {
    IconData? icon,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? colorScheme.primary.withOpacity(0.1) : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: textTheme.labelLarge?.copyWith(
              color: isActive ? colorScheme.primary : colorScheme.onSurface,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 4),
          AnimatedRotation(
            duration: const Duration(milliseconds: 200),
            turns: isActive ? 0.5 : 0,
            child: Icon(
              icon ?? Icons.keyboard_arrow_down,
              size: 18,
              color: isActive ? colorScheme.primary : colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownWithAnimation(BuildContext context, Widget child, bool visible) {
    return AnimatedSlide(
      offset: visible ? Offset(0, 0) : const Offset(0, -0.1),
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeOutCubic,
      child: AnimatedOpacity(
        opacity: visible ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 200),
        child: child,
      ),
    );
  }

  Widget _buildServicesDropdown(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final services = ServiceData.getServices();
    
    return Container(
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
          Text(
            'Our Services',
            style: textTheme.titleMedium?.copyWith(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          ...services.map((service) => _buildDropdownServiceItem(context, service)),
        ],
      ),
    );
  }

  Widget _buildProductsDropdown(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final product = ServiceData.getFindRosiProduct();
    
    return Container(
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
          Text(
            'Our Products',
            style: textTheme.titleMedium?.copyWith(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.w600,
            ),
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
    );
  }

  Widget _buildDropdownServiceItem(BuildContext context, ServiceModel service) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            if (service.title == 'Data Labeling') {
              Navigator.of(context).pushNamed('/data-annotation');
            } else if (service.title == 'AI Applications') {
              Navigator.of(context).pushNamed('/ai-app-development');
            } else if (service.title == 'AI Services & Consulting') {
              Navigator.of(context).pushNamed('/ai-consulting');
            } else if (service.title == 'Data Acquisition & Generation') {
              Navigator.of(context).pushNamed('/ai-data-acquisition');
            } else if (service.title == 'AI Agents') {
              Navigator.of(context).pushNamed('/ai-agents');
            }
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.transparent,
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: service.isPrimary 
                      ? colorScheme.primary.withOpacity(0.1)
                      : colorScheme.secondary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Icon(
                    _getIconData(service.icon),
                    size: 16,
                    color: service.isPrimary ? colorScheme.primary : colorScheme.secondary,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              service.title,
                              style: textTheme.labelMedium?.copyWith(
                                color: colorScheme.onSurface,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          if (service.isPrimary)
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: colorScheme.primary,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                'Featured',
                                style: textTheme.bodySmall?.copyWith(
                                  color: colorScheme.onPrimary,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          if (service.isPreview)
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: colorScheme.secondary,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                'Soon',
                                style: textTheme.bodySmall?.copyWith(
                                  color: colorScheme.onSecondary,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownProductItem(BuildContext context, ProductModel product) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed('/find-rosi');
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.transparent,
          ),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage("https://pixabay.com/get/g7cf85495fc9350ccca257cfe6f98f3be54ef94b3ec1b837e94f0d8af3ecb1d9955a632a292f450f4789dace10347980dd90a374618c098df60a1b91720557afc_1280.jpg"),
                    fit: BoxFit.cover,
                  ),
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
                      'Social Media App',
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
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
}