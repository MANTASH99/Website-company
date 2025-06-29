import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../widgets/data_annotation_header.dart';
import '../widgets/text_annotation_hero.dart';
import '../widgets/text_annotation_description.dart';
import '../widgets/footer_widget.dart';

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
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: const [
            // HEADER IS ALWAYS FIRST!
            DataAnnotationHeader(),
            TextAnnotationHero(),
            TextAnnotationDescription(),
            FooterWidget(),
          ],
        ),
      ),
      floatingActionButton: _buildScrollToTopButton(context),
    );
  }

  Widget _buildScrollToTopButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: _scrollToTop,
      backgroundColor: Theme.of(context).colorScheme.primary,
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
      child: const Icon(Icons.keyboard_arrow_up),
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