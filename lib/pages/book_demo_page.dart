import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../widgets/data_annotation_header.dart';
import '../widgets/book_demo_form.dart';
import '../widgets/footer_widget.dart';
import '../theme.dart';

class BookDemoPage extends StatefulWidget {
  const BookDemoPage({super.key});

  @override
  State<BookDemoPage> createState() => _BookDemoPageState();
}

class _BookDemoPageState extends State<BookDemoPage> {
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
                _buildHeroSection(context)
                    .animate()
                    .fadeIn(duration: 800.ms, delay: 200.ms)
                    .slideY(begin: 0.3, end: 0),
                const BookDemoForm()
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

  Widget _buildHeroSection(BuildContext context) {
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
      child: Column(
        children: [
          // Breadcrumb
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
                width: 1,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () => Navigator.pushReplacementNamed(context, '/'),
                  child: Text(
                    'Home',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: Icon(
                    Icons.chevron_right,
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.4),
                    size: 16,
                  ),
                ),
                Text(
                  'Book a Demo',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          )
          .animate()
          .slideX(begin: -0.5, end: 0, duration: 600.ms, delay: 200.ms)
          .fadeIn(duration: 600.ms, delay: 200.ms),
          
          const SizedBox(height: 40),
          
          // Main Title
          Text(
            'Book Your Demo',
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 48,
              letterSpacing: -1,
            ),
            textAlign: TextAlign.center,
          )
          .animate()
          .fadeIn(duration: 800.ms, delay: 400.ms)
          .slideY(begin: 0.3, end: 0)
          .shimmer(duration: 2000.ms, delay: 1200.ms),
          
          const SizedBox(height: 20),
          
          // Subtitle
          Container(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Text(
              'Get a personalized demonstration of our AI solutions tailored to your business needs. Our experts will show you how we can transform your operations.',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                fontWeight: FontWeight.w400,
                height: 1.6,
              ),
              textAlign: TextAlign.center,
            ),
          )
          .animate()
          .fadeIn(duration: 800.ms, delay: 600.ms)
          .slideY(begin: 0.3, end: 0),
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