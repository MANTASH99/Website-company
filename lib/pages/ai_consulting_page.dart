import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../widgets/data_annotation_header.dart';
import '../widgets/ai_consulting_hero.dart';
import '../widgets/ai_consulting_description.dart';
import '../widgets/footer_widget.dart';
import '../theme.dart';

class AIConsultingPage extends StatefulWidget {
  const AIConsultingPage({super.key});

  @override
  State<AIConsultingPage> createState() => _AIConsultingPageState();
}

class _AIConsultingPageState extends State<AIConsultingPage> {
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
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                const DataAnnotationHeader(),
                const AIConsultingHero()
                    .animate()
                    .fadeIn(duration: 800.ms, delay: 200.ms)
                    .slideY(begin: 0.3, end: 0),
                const AIConsultingDescription()
                    .animate()
                    .fadeIn(duration: 800.ms, delay: 400.ms)
                    .slideY(begin: 0.3, end: 0),
                const FooterWidget()
                    .animate()
                    .fadeIn(duration: 800.ms, delay: 600.ms)
                    .slideY(begin: 0.3, end: 0),
              ],
            ),
          ),
          Positioned(
            bottom: 32,
            right: 32,
            child: _buildScrollToTopButton(context),
          ),
        ],
      ),
    );
  }

  Widget _buildScrollToTopButton(BuildContext context) {
    return AnimatedBuilder(
      animation: _scrollController,
      builder: (context, child) {
        final showButton = _scrollController.hasClients && 
                          _scrollController.offset > 500;
        
        return AnimatedScale(
          scale: showButton ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 300),
          child: FloatingActionButton(
            onPressed: _scrollToTop,
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            child: const Icon(Icons.keyboard_arrow_up, size: 28),
          ),
        );
      },
    );
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeOutCubic,
    );
  }
}