import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../widgets/header_widget.dart';
import '../widgets/hero_section.dart';
import '../widgets/services_section.dart';
import '../widgets/process_section.dart';
import '../widgets/products_section.dart';
import '../widgets/footer_widget.dart';
import '../theme.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBreakpoints.builder(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: const HeaderWidget(),
        body: SingleChildScrollView(
          controller: _scrollController,
          child: const Column(
            children: [
              // Hero Section
              HeroSection(),
              
              // Services Section
              ServicesSection(),
              
              // Process Section
              ProcessSection(),
              
              // Products Section
              ProductsSection(),
              
              // Footer
              FooterWidget(),
            ],
          ),
        ),
        
        // Floating Action Button for smooth scrolling to top
        floatingActionButton: _buildScrollToTopButton(context),
      ),
      breakpoints: [
        const Breakpoint(start: 0, end: 450, name: MOBILE),
        const Breakpoint(start: 451, end: 800, name: TABLET),
        const Breakpoint(start: 801, end: 1920, name: DESKTOP),
        const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
      ],
    );
  }

  Widget _buildScrollToTopButton(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return AnimatedBuilder(
      animation: _scrollController,
      builder: (context, child) {
        final shouldShow = _scrollController.hasClients && 
                          _scrollController.offset > 200;
        
        return AnimatedScale(
          scale: shouldShow ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 300),
          child: FloatingActionButton(
            onPressed: _scrollToTop,
            backgroundColor: colorScheme.primary,
            foregroundColor: colorScheme.onPrimary,
            elevation: 4,
            child: const Icon(Icons.keyboard_arrow_up),
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