import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../widgets/data_annotation_header.dart';
import '../widgets/computer_vision_hero.dart';
import '../widgets/computer_vision_description.dart';
import '../widgets/footer_widget.dart';
import '../theme.dart';

class ComputerVisionPage extends StatefulWidget {
  const ComputerVisionPage({super.key});

  @override
  State<ComputerVisionPage> createState() => _ComputerVisionPageState();
}

class _ComputerVisionPageState extends State<ComputerVisionPage> {
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
                    const ComputerVisionHero()
                        .animate()
                        .fadeIn(duration: 800.ms)
                        .slideY(begin: 0.3, end: 0, curve: Curves.easeOutQuart),
                    const ComputerVisionDescription()
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