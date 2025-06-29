import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../theme.dart';

class DataAnnotationHeader extends StatefulWidget {
  const DataAnnotationHeader({super.key});

  @override
  State<DataAnnotationHeader> createState() => _DataAnnotationHeaderState();
}

class _DataAnnotationHeaderState extends State<DataAnnotationHeader> {
  bool _isBookDemoHovered = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final isDesktop = MediaQuery.of(context).size.width > 800;

    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: colorScheme.outline.withOpacity(0.1),
            offset: const Offset(0, 2),
            blurRadius: 8,
          ),
        ],
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: isDesktop ? 80 : 20,
          vertical: 16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Logo and Company Name
            _buildLogo(context),
            
            if (isDesktop) ...[
              // Navigation Items
              Row(
                children: [
                  _buildNavButton(context, 'Home', () {
                    Navigator.of(context).pushReplacementNamed('/');
                  }),
                  const SizedBox(width: 32),
                  _buildNavButton(context, 'Company', () {
                    Navigator.of(context).pushNamed('/impressum');
                  }),
                  const SizedBox(width: 32),
                  _buildNavButton(context, 'Contact Us', () {
                    Navigator.of(context).pushNamed('/book-demo');
                  }),
                ],
              ),
              
              // Book Demo Button
              _buildBookDemoButton(context),
            ] else ...[
              // Mobile menu button
              _buildMobileMenu(context),
            ],
          ],
        ),
      ),
    ).animate().slideY(
      begin: -1,
      end: 0,
      duration: 600.ms,
      curve: Curves.easeOutQuart,
    );
  }

  Widget _buildLogo(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Company Logo
        Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: colorScheme.primary.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Image.asset(
                    'assets/company-logo.png', // Make sure this path matches your asset location
                    fit: BoxFit.cover,
                  ),
        ).animate().scale(
          duration: 800.ms,
          curve: Curves.elasticOut,
        ),
        
        const SizedBox(width: 12),
        
        // Company Name
        Text(
          'ImplementAI MH UG',
          style: textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: colorScheme.onSurface,
          ),
        ).animate().fadeIn(duration: 600.ms, delay: 200.ms),
      ],
    );
  }

  Widget _buildNavButton(BuildContext context, String title, VoidCallback onTap) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Text(
          title,
          style: textTheme.bodyLarge?.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ).animate().fadeIn(duration: 600.ms, delay: 400.ms);
  }

  Widget _buildBookDemoButton(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return MouseRegion(
      onEnter: (_) => setState(() => _isBookDemoHovered = true),
      onExit: (_) => setState(() => _isBookDemoHovered = false),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed('/book-demo');
        },
        child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: _isBookDemoHovered 
              ? [colorScheme.secondary, colorScheme.primary]
              : [colorScheme.primary, colorScheme.secondary],
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: colorScheme.primary.withOpacity(_isBookDemoHovered ? 0.4 : 0.2),
              blurRadius: _isBookDemoHovered ? 16 : 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.play_circle_outline,
              color: colorScheme.onPrimary,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              'Book A Demo',
              style: textTheme.labelLarge?.copyWith(
                color: colorScheme.onPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        ),
      ),
    ).animate().fadeIn(duration: 600.ms, delay: 600.ms)
      .shimmer(duration: 2000.ms, delay: 1000.ms);
  }

  Widget _buildMobileMenu(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return PopupMenuButton<String>(
      icon: Icon(
        Icons.menu,
        color: colorScheme.onSurface,
      ),
      onSelected: (value) {
        switch (value) {
          case 'home':
            Navigator.of(context).pushReplacementNamed('/');
            break;
          case 'company':
            Navigator.of(context).pushNamed('/impressum');
            break;
          case 'contact':
            Navigator.of(context).pushNamed('/book-demo');
            break;
          case 'demo':
            Navigator.of(context).pushNamed('/book-demo');
            break;
        }
      },
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: 'home',
          child: Row(
            children: [
              Icon(Icons.home_outlined),
              SizedBox(width: 12),
              Text('Home'),
            ],
          ),
        ),
        const PopupMenuItem(
          value: 'company',
          child: Row(
            children: [
              Icon(Icons.business_outlined),
              SizedBox(width: 12),
              Text('Company'),
            ],
          ),
        ),
        const PopupMenuItem(
          value: 'contact',
          child: Row(
            children: [
              Icon(Icons.contact_mail_outlined),
              SizedBox(width: 12),
              Text('Contact Us'),
            ],
          ),
        ),
        const PopupMenuItem(
          value: 'demo',
          child: Row(
            children: [
              Icon(Icons.play_circle_outline),
              SizedBox(width: 12),
              Text('Book A Demo'),
            ],
          ),
        ),
      ],
    );
  }
}