import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../widgets/data_annotation_header.dart';
import '../widgets/text_annotation_hero.dart';
import '../widgets/text_annotation_description.dart';
import '../widgets/footer_widget.dart';
import '../theme.dart';

class TextAnnotationPage extends StatefulWidget {
  const TextAnnotationPage({super.key});

  @override
  State<TextAnnotationPage> createState() => _TextAnnotationPageState();
}

class _TextAnnotationPageState extends State<TextAnnotationPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const DataAnnotationHeader(),
                    const TextAnnotationHero()
                        .animate()
                        .fadeIn(duration: 800.ms)
                        .slideY(begin: 0.3, end: 0, curve: Curves.easeOutQuart),
                    const TextAnnotationDescription()
                        .animate(delay: 300.ms)
                        .fadeIn(duration: 800.ms)
                        .slideY(begin: 0.3, end: 0, curve: Curves.easeOutQuart),
                    const FooterWidget()
                        .animate(delay: 600.ms)
                        .fadeIn(duration: 800.ms)
                        .slideY(begin: 0.3, end: 0, curve: Curves.easeOutQuart),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 24,
            right: 24,
            child: _buildScrollToTopButton(context),
          ),
        ],
      ),
    );
  }

  Widget _buildScrollToTopButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: _scrollToTop,
      backgroundColor: Theme.of(context).colorScheme.primary,
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
      child: const Icon(Icons.keyboard_arrow_up),
    ).animate()
        .scale(delay: 1000.ms, duration: 300.ms)
        .then()
        .shake(duration: 500.ms);
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }
}