import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../theme.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 1024;
    final isTablet = size.width > 768;
    
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            colorScheme.surfaceVariant.withOpacity(0.3),
            colorScheme.surface,
          ],
        ),
      ),
      child: Column(
        children: [
          // Main Footer Content
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: isDesktop ? 80 : 24,
              vertical: isDesktop ? 80 : 48,
            ),
            constraints: const BoxConstraints(maxWidth: 1400),
            child: isTablet
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 2, child: _buildCompanySection(context)),
                      const SizedBox(width: 48),
                      Expanded(child: _buildServicesSection(context)),
                      const SizedBox(width: 48),
                      Expanded(child: _buildContactSection(context)),
                      const SizedBox(width: 48),
                      Expanded(child: _buildSocialSection(context)),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildCompanySection(context),
                      const SizedBox(height: 32),
                      _buildServicesSection(context),
                      const SizedBox(height: 32),
                      _buildContactSection(context),
                      const SizedBox(height: 32),
                      _buildSocialSection(context),
                    ],
                  ),
          ),
          
          // Divider
          Container(
            height: 1,
            color: colorScheme.outline.withOpacity(0.2),
            margin: const EdgeInsets.symmetric(horizontal: 24),
          ),
          
          // Bottom Footer
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: isDesktop ? 80 : 24,
              vertical: 24,
            ),
            child: isTablet
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildCopyright(context),
                      _buildLegalLinks(context),
                    ],
                  )
                : Column(
                    children: [
                      _buildCopyright(context),
                      const SizedBox(height: 16),
                      _buildLegalLinks(context),
                    ],
                  ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 800.ms);
  }

  Widget _buildCompanySection(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Company Logo/Name
        Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    colorScheme.primary,
                    colorScheme.secondary,
                  ],
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
              child: Icon(
                Icons.psychology_outlined,
                color: colorScheme.onPrimary,
                size: 28,
              ),
            ),
            const SizedBox(width: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    colorScheme.primary,
                    colorScheme.secondary,
                  ],
                ),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: colorScheme.primary.withOpacity(0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Text(
                'ImplementAI',
                style: textTheme.titleLarge?.copyWith(
                  color: colorScheme.onPrimary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        )
            .animate()
            .fadeIn(delay: 200.ms)
            .scale(begin: const Offset(0.8, 0.8)),
        
        const SizedBox(height: 16),
        
        Text(
          'MH UG (haftungsbeschränkt)',
          style: textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w500,
          ),
        )
            .animate()
            .fadeIn(delay: 300.ms)
            .slideX(begin: -0.3, end: 0),
        
        const SizedBox(height: 20),
        
        Container(
          constraints: const BoxConstraints(maxWidth: 300),
          child: Text(
            'Leading the future of AI with innovative data labeling, intelligent applications, and comprehensive AI solutions that transform businesses.',
            style: textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
              height: 1.6,
            ),
          ),
        )
            .animate()
            .fadeIn(delay: 400.ms)
            .slideY(begin: 0.3, end: 0),
        
        const SizedBox(height: 24),
        
        // Company Registration Info
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: colorScheme.surfaceVariant.withOpacity(0.3),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: colorScheme.outline.withOpacity(0.2),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Company Information',
                style: textTheme.labelMedium?.copyWith(
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              _buildInfoRow(context, 'Address:', 'Zur Schlottareuth 22, 90427 Nürnberg, Deutschland'),
              _buildInfoRow(context, 'Registergericht:', 'Amtsgericht Nürnberg'),
              _buildInfoRow(context, 'Handelsregister:', 'HRB 44445'),
            ],
          ),
        )
            .animate()
            .fadeIn(delay: 500.ms)
            .slideY(begin: 0.3, end: 0),
      ],
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String value) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServicesSection(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Services',
          style: textTheme.titleMedium?.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.w600,
          ),
        )
            .animate()
            .fadeIn(delay: 300.ms)
            .slideX(begin: 0.3, end: 0),
        
        const SizedBox(height: 16),
        
        ...[
          'Data Labeling & Annotation',
          'AI Application Development',
          'Machine Learning Consulting',
          'Custom AI Solutions',
          'Data Generation & Acquisition',
        ].asMap().entries.map((entry) {
          final index = entry.key;
          final service = entry.value;
          return _buildFooterLink(context, service)
              .animate()
              .fadeIn(delay: Duration(milliseconds: 400 + (index * 100)))
              .slideX(begin: 0.3, end: 0);
        }),
      ],
    );
  }

  Widget _buildContactSection(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact',
          style: textTheme.titleMedium?.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.w600,
          ),
        )
            .animate()
            .fadeIn(delay: 400.ms)
            .slideX(begin: 0.3, end: 0),
        
        const SizedBox(height: 16),
        
        _buildContactItem(
          context,
          Icons.email_outlined,
          'contact@implementai.de',
        )
            .animate()
            .fadeIn(delay: 500.ms)
            .slideX(begin: 0.3, end: 0),
        
        const SizedBox(height: 12),
        
        _buildContactItem(
          context,
          Icons.phone_outlined,
          '+49 (0) 89 1234 5678',
        )
            .animate()
            .fadeIn(delay: 600.ms)
            .slideX(begin: 0.3, end: 0),
        
        const SizedBox(height: 12),
        
        _buildContactItem(
          context,
          Icons.location_on_outlined,
          'München, Deutschland',
        )
            .animate()
            .fadeIn(delay: 700.ms)
            .slideX(begin: 0.3, end: 0),
        
        const SizedBox(height: 20),
        
        // Business Hours
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: colorScheme.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Business Hours',
                style: textTheme.labelMedium?.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Mon - Fri: 9:00 - 18:00\nSat: 10:00 - 14:00',
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        )
            .animate()
            .fadeIn(delay: 800.ms)
            .scale(begin: const Offset(0.8, 0.8)),
      ],
    );
  }

  Widget _buildSocialSection(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Follow Us',
          style: textTheme.titleMedium?.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.w600,
          ),
        )
            .animate()
            .fadeIn(delay: 500.ms)
            .slideX(begin: 0.3, end: 0),
        
        const SizedBox(height: 16),
        
        Row(
          children: [
            _buildSocialIcon(context, Icons.language, 'LinkedIn'),
            const SizedBox(width: 12),
            _buildSocialIcon(context, Icons.code, 'GitHub'),
            const SizedBox(width: 12),
            _buildSocialIcon(context, Icons.email, 'Email'),
            const SizedBox(width: 12),
            _buildSocialIcon(context, Icons.phone, 'Phone'),
          ],
        )
            .animate()
            .fadeIn(delay: 600.ms)
            .slideY(begin: 0.3, end: 0),
        
        const SizedBox(height: 24),
        
        // Newsletter Signup
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                colorScheme.secondary.withOpacity(0.1),
                colorScheme.tertiary.withOpacity(0.1),
              ],
            ),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: colorScheme.secondary.withOpacity(0.3),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Stay Updated',
                style: textTheme.labelLarge?.copyWith(
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Get the latest AI insights and updates',
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.secondary,
                    foregroundColor: colorScheme.onSecondary,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Subscribe',
                    style: textTheme.labelMedium?.copyWith(
                      color: colorScheme.onSecondary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
            .animate()
            .fadeIn(delay: 700.ms)
            .scale(begin: const Offset(0.8, 0.8)),
      ],
    );
  }

  Widget _buildFooterLink(BuildContext context, String title) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {},
          child: Text(
            title,
            style: textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContactItem(BuildContext context, IconData icon, String text) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: colorScheme.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            size: 16,
            color: colorScheme.primary,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSocialIcon(BuildContext context, IconData icon, String tooltip) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return Tooltip(
      message: tooltip,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: colorScheme.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: colorScheme.primary.withOpacity(0.3),
              ),
            ),
            child: Icon(
              icon,
              size: 20,
              color: colorScheme.primary,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCopyright(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    
    return Text(
      '© 2025 ImplementAI MH UG (haftungsbeschränkt). All rights reserved.',
      style: textTheme.bodySmall?.copyWith(
        color: colorScheme.onSurfaceVariant,
      ),
    );
  }

  Widget _buildLegalLinks(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {},
            child: Text(
              'Privacy Policy',
              style: textTheme.bodySmall?.copyWith(
                color: colorScheme.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          width: 1,
          height: 16,
          color: colorScheme.outline.withOpacity(0.3),
        ),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {},
            child: Text(
              'Terms of Service',
              style: textTheme.bodySmall?.copyWith(
                color: colorScheme.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          width: 1,
          height: 16,
          color: colorScheme.outline.withOpacity(0.3),
        ),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/impressum');
            },
            child: Text(
              'Impressum',
              style: textTheme.bodySmall?.copyWith(
                color: colorScheme.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}