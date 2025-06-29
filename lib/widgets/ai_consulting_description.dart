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
            child: _buildAIConsultingServices(context),
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
        _buildAIConsultingServices(context),
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

  /// Replace the crossed rectangle with a cool animated list of AI consulting services
  Widget _buildAIConsultingServices(BuildContext context) {
    final services = [
      {'icon': Icons.manage_search, 'title': 'AI Strategy Consulting'},
      {'icon': Icons.lightbulb, 'title': 'AI Readiness Assessment'},
      {'icon': Icons.hub, 'title': 'Machine Learning Solutions'},
      {'icon': Icons.language, 'title': 'Natural Language Processing (NLP)'},
      {'icon': Icons.visibility, 'title': 'Computer Vision'},
      {'icon': Icons.analytics, 'title': 'Predictive Analytics'},
      {'icon': Icons.security, 'title': 'AI Governance & Ethics'},
      {'icon': Icons.verified, 'title': 'Model Validation & Auditing'},
      {'icon': Icons.support, 'title': 'AI Support & Training'},
    ];

    return Container(
      height: 400,
      width: 340,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Our AI Consulting Services",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
              letterSpacing: 1.1,
            ),
            textAlign: TextAlign.center,
          )
              .animate()
              .fadeIn(duration: 600.ms)
              .slideY(begin: 0.3, end: 0),
          const SizedBox(height: 18),
          ...services.asMap().entries.map((entry) {
            final index = entry.key;
            final service = entry.value;
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 6),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.9),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.13),
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.07),
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Icon(service['icon'] as IconData,
                      color: Theme.of(context).colorScheme.primary, size: 22),
                  const SizedBox(width: 13),
                  Expanded(
                    child: Text(
                      service['title'] as String,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ],
              ),
            )
                .animate()
                .fadeIn(duration: 600.ms, delay: (300 + index * 80).ms)
                .slideX(begin: 0.2, end: 0, curve: Curves.easeOutBack);
          }),
        ],
      ),
    );
  }
}