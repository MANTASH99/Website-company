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
  late AnimationController _imageSwitchController;
  int _currentImage = 0;
  final List<String> _images = [
    'assets/NLP-.png',
    'assets/NLP3.png',
  ];

  @override
  void initState() {
    super.initState();
    _imageSwitchController = AnimationController(
      duration: const Duration(milliseconds: 900),
      vsync: this,
    );
    _startImageSwitch();
  }

  void _startImageSwitch() async {
    while (mounted) {
      await Future.delayed(const Duration(seconds: 3));
      if (!mounted) return;
      setState(() {
        _currentImage = (_currentImage + 1) % _images.length;
        _imageSwitchController.forward(from: 0.0);
      });
    }
  }

  @override
  void dispose() {
    _imageSwitchController.dispose();
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
            child: _buildAnimatedImageSwitcher(context),
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
        _buildAnimatedImageSwitcher(context),
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

  Widget _buildAnimatedImageSwitcher(BuildContext context) {
    // Swapping images with animation, larger size and moved down
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 60.0), // Move the images down
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 900),
          switchInCurve: Curves.easeInOut,
          switchOutCurve: Curves.easeInOut,
          transitionBuilder: (child, animation) {
            return FadeTransition(
              opacity: animation,
              child: ScaleTransition(
                scale: animation,
                child: child,
              ),
            );
          },
          child: Container(
            key: ValueKey<int>(_currentImage),
            width: 320, // Larger image
            height: 320, // Larger image
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.24),
                  blurRadius: 32,
                  offset: const Offset(0, 12),
                ),
              ],
              image: DecorationImage(
                image: AssetImage(_images[_currentImage]),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}