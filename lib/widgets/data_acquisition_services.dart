import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../theme.dart';

class DataAcquisitionServices extends StatefulWidget {
  const DataAcquisitionServices({super.key});

  @override
  State<DataAcquisitionServices> createState() => _DataAcquisitionServicesState();
}

class _DataAcquisitionServicesState extends State<DataAcquisitionServices> {
  int _hoveredIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.05),
            Theme.of(context).colorScheme.secondary.withOpacity(0.05),
          ],
        ),
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1400),
        child: Column(
          children: [
            _buildSectionHeader(context),
            const SizedBox(height: 80),
            _buildServicesGrid(context),
            const SizedBox(height: 80),
            _buildDataCurationSection(context),
            const SizedBox(height: 60),
            _buildCTASection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.data_usage,
                size: 18,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 8),
              Text(
                'OUR SERVICES',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
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
        .slideY(begin: 0.3, end: 0),
        
        const SizedBox(height: 24),
        
        Text(
          'Data Acquisition Services\nFor Your Business',
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
            fontWeight: FontWeight.w700,
            height: 1.2,
            letterSpacing: -0.5,
          ),
          textAlign: TextAlign.center,
        )
        .animate()
        .fadeIn(duration: 800.ms, delay: 200.ms)
        .slideY(begin: 0.3, end: 0),
        
        const SizedBox(height: 24),
        
        Container(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Text(
            'We provide data acquisition services tailored to your unique needs. Whether you need data collection, data procurement, web scraping, or data curation, we\'re here to help you drive real results.',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
        )
        .animate()
        .fadeIn(duration: 800.ms, delay: 400.ms)
        .slideY(begin: 0.3, end: 0),
        
        const SizedBox(height: 40),
        
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
          icon: const Icon(Icons.request_quote, size: 20),
          label: Text(
            'Get a Free Quote',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
        .animate()
        .fadeIn(duration: 600.ms, delay: 600.ms)
        .slideY(begin: 0.3, end: 0)
        .shimmer(duration: 2000.ms, delay: 1500.ms),
      ],
    );
  }

  Widget _buildServicesGrid(BuildContext context) {
    final services = [
      {
        'number': '1',
        'title': 'Data Collection',
        'icon': Icons.cloud_download,
        'description': 'Comprehensive data gathering from multiple sources with quality assurance and validation protocols.',
      },
      {
        'number': '2',
        'title': 'Data Procurement',
        'icon': Icons.shopping_cart,
        'description': 'Strategic acquisition of datasets from trusted vendors and partners to meet your specific requirements.',
      },
      {
        'number': '3',
        'title': 'Web Scraping',
        'icon': Icons.web,
        'description': 'Automated extraction of data from websites and online platforms using advanced scraping technologies.',
      },
      {
        'number': '4',
        'title': 'Data Curation',
        'icon': Icons.tune,
        'description': 'Professional organization, cleaning, and enrichment of raw data into high-quality training datasets.',
      },
    ];

    final isDesktop = ResponsiveBreakpoints.of(context).largerThan(TABLET);
    
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isDesktop ? 2 : 1,
        childAspectRatio: isDesktop ? 1.5 : 1.2,
        crossAxisSpacing: 32,
        mainAxisSpacing: 32,
      ),
      itemCount: services.length,
      itemBuilder: (context, index) {
        return _buildServiceCard(context, services[index], index);
      },
    );
  }

  Widget _buildServiceCard(BuildContext context, Map<String, dynamic> service, int index) {
    final isHovered = _hoveredIndex == index;
    
    return MouseRegion(
      onEnter: (_) => setState(() => _hoveredIndex = index),
      onExit: (_) => setState(() => _hoveredIndex = -1),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform: Matrix4.identity()
          ..scale(isHovered ? 1.02 : 1.0)
          ..translate(0.0, isHovered ? -8.0 : 0.0),
        child: Container(
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: isHovered 
                ? Theme.of(context).colorScheme.primary.withOpacity(0.3)
                : Theme.of(context).colorScheme.outline.withOpacity(0.2),
              width: isHovered ? 2 : 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(isHovered ? 0.1 : 0.05),
                blurRadius: isHovered ? 20 : 10,
                offset: Offset(0, isHovered ? 8 : 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: Text(
                        service['number'],
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      service['icon'] as IconData,
                      color: Theme.of(context).colorScheme.primary,
                      size: 24,
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 24),
              
              Text(
                service['title'],
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              
              const SizedBox(height: 16),
              
              Text(
                service['description'],
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                  height: 1.6,
                ),
              ),
            ],
          ),
        ),
      ),
    )
    .animate()
    .fadeIn(duration: 600.ms, delay: Duration(milliseconds: 200 + (index * 100)))
    .slideY(begin: 0.3, end: 0);
  }

  Widget _buildDataCurationSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  Icons.tune,
                  color: Theme.of(context).colorScheme.secondary,
                  size: 32,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Data Curation',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Data Curation',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 24),
          
          Text(
            'We transform raw data into high-quality datasets through dataset creation, cleaning, and enrichment. Our services ensure your datasets possess quality, organization, and proper strategic implementation to enhance decision-making quality and drive improved performance. Our meticulous approach delivers maximum efficiency throughout your AI training.',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              height: 1.7,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
            ),
          ),
        ],
      ),
    )
    .animate()
    .fadeIn(duration: 800.ms, delay: 600.ms)
    .slideY(begin: 0.3, end: 0);
  }

  Widget _buildCTASection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(48),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.secondary,
          ],
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Icon(
            Icons.data_usage,
            size: 48,
            color: Colors.white,
          ),
          
          const SizedBox(height: 24),
          
          Text(
            'Ready to Access High-Quality Datasets?',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          
          const SizedBox(height: 16),
          
          Text(
            'Please call this form to access high-quality datasets for your AI project',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.white.withOpacity(0.9),
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
          
          const SizedBox(height: 32),
          
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/book-demo');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Theme.of(context).colorScheme.primary,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 0,
            ),
            icon: Icon(
              Icons.contact_support,
              size: 20,
              color: Theme.of(context).colorScheme.primary,
            ),
            label: Text(
              'Contact Us Today',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    )
    .animate()
    .fadeIn(duration: 800.ms, delay: 800.ms)
    .slideY(begin: 0.3, end: 0);
  }
}