import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../widgets/data_annotation_header.dart';
import '../widgets/data_annotation_hero.dart';
import '../widgets/data_annotation_description.dart';
import '../widgets/process_section.dart';
import '../widgets/data_annotation_services.dart';
import '../widgets/footer_widget.dart';
import '../theme.dart';

class DataAnnotationPage extends StatefulWidget {
  const DataAnnotationPage({super.key});

  @override
  State<DataAnnotationPage> createState() => _DataAnnotationPageState();
}

class _DataAnnotationPageState extends State<DataAnnotationPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          const SliverToBoxAdapter(
            child: DataAnnotationHeader(),
          ),
          const SliverToBoxAdapter(
            child: DataAnnotationHero(),
          ),
          const SliverToBoxAdapter(
            child: DataAnnotationDescription(),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 40),
              child: const ProcessSection(),
            ),
          ),
          const SliverToBoxAdapter(
            child: DataAnnotationServices(),
          ),
          const SliverToBoxAdapter(
            child: FooterWidget(),
          ),
        ],
      ),
      floatingActionButton: _buildScrollToTopButton(context),
    );
  }

  Widget _buildScrollToTopButton(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return FloatingActionButton(
      onPressed: _scrollToTop,
      backgroundColor: colorScheme.primary,
      foregroundColor: colorScheme.onPrimary,
      elevation: 4,
      child: const Icon(Icons.keyboard_arrow_up, size: 28),
    ).animate()
      .scale(
        duration: 300.ms,
        curve: Curves.easeOutBack,
      )
      .fadeIn(duration: 200.ms);
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInOut,
    );
  }
}