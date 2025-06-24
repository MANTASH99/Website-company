import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../theme.dart';


class TextAnnotationDescription extends StatefulWidget {
  const TextAnnotationDescription({super.key});

  @override
  State<TextAnnotationDescription> createState() => _TextAnnotationDescriptionState();
}

class _TextAnnotationDescriptionState extends State<TextAnnotationDescription>
    with TickerProviderStateMixin {
  late AnimationController _floatController;
  late AnimationController _pulseController;

  @override
  void initState() {
    super.initState();
    _floatController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);
    
    _pulseController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _floatController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveBreakpoints.of(context).largerThan(TABLET);
    
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : 24,
        vertical: isDesktop ? 120 : 80,
      ),
      child: isDesktop ? _buildDesktopLayout(context) : _buildMobileLayout(context),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 1200),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: _buildTextContent(context),
          ),
          const SizedBox(width: 80),
          Expanded(
            flex: 2,
            child: _buildImageContent(context),
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
        _buildImageContent(context),
      ],
    );
  }

  Widget _buildTextContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Main Title
        Text(
          'What is Natural Language Processing?',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w700,
            color: Theme.of(context).colorScheme.onSurface,
            height: 1.2,
          ),
        )
            .animate()
            .fadeIn(duration: 800.ms)
            .slideX(begin: -0.3, end: 0),
        
        const SizedBox(height: 24),
        
        // Description
        Text(
          'Natural Language Processing (NLP) is a branch of artificial intelligence that enables computers to understand, interpret, and generate human language in a valuable way. By combining computational linguistics, machine learning, and deep learning models, NLP helps machines process and analyze large amounts of natural language data.',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            height: 1.6,
          ),
        )
            .animate(delay: 200.ms)
            .fadeIn(duration: 800.ms)
            .slideX(begin: -0.3, end: 0),
        
        const SizedBox(height: 32),
        
        // Our Services Section
        Text(
          'At ImplementAI MH UG, we provide comprehensive text annotation services that power advanced NLP applications. From sentiment analysis and named entity recognition to intent classification and language generation, our solutions help businesses extract meaning from text data and automate language-based tasks.',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            height: 1.6,
          ),
        )
            .animate(delay: 400.ms)
            .fadeIn(duration: 800.ms)
            .slideX(begin: -0.3, end: 0),
        
        const SizedBox(height: 32),
        
        // Expertise Section
        Text(
          'Our expert team ensures high-quality annotation for training your language models, helping you build smarter chatbots, virtual assistants, content analyzers, and other language-powered applications for your business.',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            height: 1.6,
          ),
        )
            .animate(delay: 600.ms)
            .fadeIn(duration: 800.ms)
            .slideX(begin: -0.3, end: 0),
        
        const SizedBox(height: 48),
        
        // NLP Applications
        _buildNLPApplications(context),
        
        const SizedBox(height: 48),
        
        // CTA Button
        ElevatedButton.icon(
          onPressed: () {
            Navigator.pushNamed(context, '/book-demo');
          },
          icon: Icon(
            Icons.calendar_month,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          label: Text(
            'Book A Consultation',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        )
            .animate(delay: 1000.ms)
            .fadeIn(duration: 600.ms)
            .slideY(begin: 0.3, end: 0)
            .then()
            .shimmer(duration: 2000.ms, color: Colors.white.withOpacity(0.3)),
      ],
    );
  }

  Widget _buildNLPApplications(BuildContext context) {
    final applications = [
      {'icon': Icons.sentiment_satisfied, 'title': 'Sentiment Analysis', 'description': 'Understand emotions and opinions in text data'},
      {'icon': Icons.label, 'title': 'Named Entity Recognition', 'description': 'Identify and classify entities in text'},
      {'icon': Icons.psychology, 'title': 'Intent Classification', 'description': 'Determine user intentions from text input'},
      {'icon': Icons.auto_awesome, 'title': 'Language Generation', 'description': 'Generate human-like text responses'},
      {'icon': Icons.translate, 'title': 'Machine Translation', 'description': 'Translate text between different languages'},
      {'icon': Icons.summarize, 'title': 'Text Summarization', 'description': 'Extract key information from long documents'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'NLP Applications We Support',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        )
            .animate(delay: 800.ms)
            .fadeIn(duration: 600.ms)
            .slideX(begin: -0.3, end: 0),
        
        const SizedBox(height: 24),
        
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: ResponsiveBreakpoints.of(context).largerThan(TABLET) ? 2 : 1,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: ResponsiveBreakpoints.of(context).largerThan(TABLET) ? 3.5 : 4,
          ),
          itemCount: applications.length,
          itemBuilder: (context, index) {
            final app = applications[index];
            return Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      app['icon'] as IconData,
                      color: Theme.of(context).colorScheme.secondary,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          app['title'] as String,
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          app['description'] as String,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
                .animate(delay: Duration(milliseconds: 1000 + (index * 100)))
                .fadeIn(duration: 600.ms)
                .slideY(begin: 0.3, end: 0);
          },
        ),
      ],
    );
  }

  Widget _buildImageContent(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 400,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: NetworkImage(
                "https://pixabay.com/get/g608f9801305ba217f23862ed1a621606753892a33054d4063afb7aea9c06d0441e7f19571b112e8837fc5df1a3b2ed52049490eb0e4466240244e141a861fc9a_1280.jpg",
              ),
              fit: BoxFit.cover,
            ),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                blurRadius: 30,
                offset: const Offset(0, 10),
              ),
            ],
          ),
        ),
        ..._buildFloatingTextIndicators(context),
      ],
    )
        .animate(delay: 600.ms)
        .fadeIn(duration: 800.ms)
        .slideY(begin: 0.3, end: 0);
  }

  List<Widget> _buildFloatingTextIndicators(BuildContext context) {
    return [
      Positioned(
        top: 30,
        right: 30,
        child: AnimatedBuilder(
          animation: _floatController,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, _floatController.value * 10),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.tertiary.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.sentiment_satisfied,
                      size: 16,
                      color: Theme.of(context).colorScheme.onTertiary,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Sentiment: 98%',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onTertiary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      Positioned(
        bottom: 80,
        left: 20,
        child: AnimatedBuilder(
          animation: _pulseController,
          builder: (context, child) {
            return Transform.scale(
              scale: 1 + (_pulseController.value * 0.1),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.translate,
                      size: 16,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Multilingual',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      Positioned(
        top: 120,
        left: 40,
        child: AnimatedBuilder(
          animation: _floatController,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, -_floatController.value * 8),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.psychology,
                      size: 16,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Intent: 95%',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSecondary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    ];
  }
}