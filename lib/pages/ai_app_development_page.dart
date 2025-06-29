import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../widgets/data_annotation_header.dart';
import '../widgets/ai_app_hero.dart';
import '../widgets/ai_app_description.dart';
import '../widgets/find_rosi_showcase.dart';
import '../widgets/ai_app_process.dart';
import '../widgets/footer_widget.dart';
import '../theme.dart';

class AIAppDevelopmentPage extends StatefulWidget {
  const AIAppDevelopmentPage({super.key});

  @override
  State<AIAppDevelopmentPage> createState() => _AIAppDevelopmentPageState();
}

class _AIAppDevelopmentPageState extends State<AIAppDevelopmentPage> {
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
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const DataAnnotationHeader(),
                const AIAppDevelopmentHero() // Changed from AIAppHero to AIAppDevelopmentHero
                    .animate()
                    .fadeIn(duration: 800.ms, delay: 200.ms)
                    .slideY(begin: 0.3, end: 0),
                const AIAppDescription()
                    .animate()
                    .fadeIn(duration: 800.ms, delay: 400.ms)
                    .slideY(begin: 0.2, end: 0),
                const FindRosiShowcase()
                    .animate()
                    .fadeIn(duration: 800.ms, delay: 600.ms)
                    .slideY(begin: 0.2, end: 0),
                const AIAppProcess()
                    .animate()
                    .fadeIn(duration: 800.ms, delay: 800.ms)
                    .slideY(begin: 0.2, end: 0),
                const FooterWidget()
                    .animate()
                    .fadeIn(duration: 800.ms, delay: 1000.ms),
              ],
            ),
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
    return AnimatedBuilder(
      animation: _scrollController,
      builder: (context, child) {
        bool showButton = _scrollController.hasClients && 
                         _scrollController.offset > 500;
        
        return AnimatedOpacity(
          opacity: showButton ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 300),
          child: FloatingActionButton(
            onPressed: _scrollToTop,
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: Icon(
              Icons.keyboard_arrow_up,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        );
      },
    );
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }
}