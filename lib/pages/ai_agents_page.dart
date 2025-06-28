import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../widgets/data_annotation_header.dart'; // Same header as consulting
import '../widgets/footer_widget.dart';
import '../theme.dart';

const _heroImageUrl = "https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=800&q=80"; // Replace with your own image

class AiAgentsPage extends StatefulWidget {
  const AiAgentsPage({super.key});

  @override
  State<AiAgentsPage> createState() => _AiAgentsPageState();
}

class _AiAgentsPageState extends State<AiAgentsPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // --- Book a demo button (reuse style/animation as other subpages) ---
  Widget _buildBookDemoButton(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return ElevatedButton.icon(
      onPressed: () => Navigator.of(context).pushNamed('/book-demo'),
      icon: const Icon(Icons.arrow_forward, size: 22),
      label: Text(
        "Book a Demo",
        style: textTheme.titleMedium?.copyWith(
          color: colorScheme.onPrimary,
          fontWeight: FontWeight.w600,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 4,
      ),
    )
        .animate()
        .fadeIn(duration: 400.ms)
        .slideY(begin: 0.18, end: 0);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 800;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                // --- HEADER (same as other subpages) ---
                const DataAnnotationHeader(),

                // --- HERO SECTION ---
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: isMobile ? 18 : 48, vertical: isMobile ? 20 : 40),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          colorScheme.primary.withOpacity(0.08),
                          colorScheme.secondary.withOpacity(0.08)
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: isMobile
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _heroText(context, textTheme, colorScheme),
                              const SizedBox(height: 18),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  _heroImageUrl,
                                  height: 180,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                )
                                    .animate()
                                    .fadeIn(duration: 800.ms)
                                    .scale(begin: Offset(0.95, 0.95), end: Offset(1, 1)),
                              ),
                            ],
                          )
                        : Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(32.0),
                                  child: _heroText(context, textTheme, colorScheme),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(32.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(24),
                                    child: Image.network(
                                      _heroImageUrl,
                                      height: 260,
                                      width: 420,
                                      fit: BoxFit.cover,
                                    )
                                        .animate()
                                        .fadeIn(duration: 800.ms)
                                        .scale(begin: Offset(0.95, 0.95), end: Offset(1, 1)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                  )
                      .animate()
                      .fadeIn(duration: 800.ms, delay: 200.ms)
                      .slideY(begin: 0.3, end: 0),
                ),

                // --- FEATURE CARDS ---
                _buildAnimatedFeatureCards(context, colorScheme, textTheme, isMobile)
                    .animate()
                    .fadeIn(duration: 800.ms, delay: 400.ms)
                    .slideY(begin: 0.3, end: 0),

                // --- WHY SECTION ---
                _buildWhySection(context, colorScheme, textTheme)
                    .animate()
                    .fadeIn(duration: 800.ms, delay: 600.ms)
                    .slideY(begin: 0.3, end: 0),

                // --- BOOK DEMO BUTTON (centered, animated) ---
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40.0),
                  child: _buildBookDemoButton(context),
                ),

                // --- FOOTER ---
                const FooterWidget()
                    .animate()
                    .fadeIn(duration: 800.ms, delay: 800.ms)
                    .slideY(begin: 0.3, end: 0),
              ],
            ),
          ),

          // --- SCROLL TO TOP BUTTON (bottom right, animated) ---
          Positioned(
            bottom: 32,
            right: 32,
            child: _buildScrollToTopButton(context),
          ),
        ],
      ),
    );
  }

  Widget _heroText(BuildContext context, TextTheme textTheme, ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "AI Agents",
          style: textTheme.displaySmall?.copyWith(
            color: colorScheme.primary,
            fontWeight: FontWeight.w800,
            letterSpacing: 1.6,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          "Autonomous digital workers to automate business processes, execute tasks, and accelerate your business transformation.",
          style: textTheme.titleMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w500,
            height: 1.45,
          ),
        ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _fancyTag(context, Icons.flash_on, colorScheme.secondary, "Real-Time Automation"),
            _fancyTag(context, Icons.integration_instructions, colorScheme.tertiary, "Seamless Integration"),
            _fancyTag(context, Icons.security, colorScheme.primary, "Secure & Reliable"),
          ],
        ),
      ],
    );
  }

  Widget _fancyTag(BuildContext context, IconData icon, Color color, String label) {
    final textTheme = Theme.of(context).textTheme;
    return Chip(
      avatar: Icon(icon, color: Colors.white, size: 18),
      label: Text(label, style: textTheme.labelMedium?.copyWith(color: Colors.white)),
      backgroundColor: color,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
    ).animate().fadeIn(duration: 400.ms);
  }

  Widget _buildAnimatedFeatureCards(BuildContext context, ColorScheme colorScheme, TextTheme textTheme, bool isMobile) {
    final features = [
      {
        "icon": Icons.auto_mode,
        "title": "Task Automation",
        "desc": "Automate repetitive, time-consuming business processes and workflows with intelligent AI agents."
      },
      {
        "icon": Icons.sync_alt,
        "title": "Seamless Integration",
        "desc": "Integrate easily with your existing tools, APIs, and software stack for a smooth workflow."
      },
      {
        "icon": Icons.people_outline,
        "title": "Human Collaboration",
        "desc": "Empower teams to focus on high-value tasks; AI agents handle the busywork."
      },
      {
        "icon": Icons.lightbulb_outline,
        "title": "Continuous Learning",
        "desc": "AI agents learn and adapt over time, improving their efficiency and accuracy."
      }
    ];

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
      child: Wrap(
        spacing: 32,
        runSpacing: 32,
        children: List.generate(features.length, (index) {
          final feature = features[index];
          return _featureCard(
            context,
            feature["icon"] as IconData,
            feature["title"] as String,
            feature["desc"] as String,
            colorScheme,
            textTheme,
            delay: Duration(milliseconds: 200 * index),
            isMobile: isMobile,
          );
        }),
      ),
    );
  }

  Widget _featureCard(
    BuildContext context,
    IconData icon,
    String title,
    String desc,
    ColorScheme colorScheme,
    TextTheme textTheme, {
    Duration delay = Duration.zero,
    bool isMobile = false,
  }) {
    return Container(
      width: isMobile ? double.infinity : 280,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: colorScheme.surfaceVariant.withOpacity(0.6),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: colorScheme.primary.withOpacity(0.09),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
        border: Border.all(
          color: colorScheme.primary.withOpacity(0.08),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: colorScheme.primary.withOpacity(0.18),
            child: Icon(icon, color: colorScheme.primary, size: 28),
            radius: 30,
          ),
          const SizedBox(height: 18),
          Text(
            title,
            style: textTheme.titleLarge?.copyWith(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            desc,
            style: textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
              height: 1.4,
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 700.ms, delay: delay).slideY(begin: 0.15, end: 0, duration: 700.ms, delay: delay);
  }

  Widget _buildWhySection(BuildContext context, ColorScheme colorScheme, TextTheme textTheme) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          colors: [
            colorScheme.primary.withOpacity(0.04),
            colorScheme.secondary.withOpacity(0.04),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Why AI Agents?",
            style: textTheme.headlineSmall?.copyWith(
              color: colorScheme.primary,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 18),
          Text(
            "AI Agents are autonomous digital workers designed to automate business processes, execute tasks, and interact with your systems with minimal or no human intervention. Improve efficiency, reduce costs, and scale your operations with our tailored AI agent technology.",
            style: textTheme.bodyLarge?.copyWith(
              color: colorScheme.onSurface,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 28),
          _whyBullet(context, Icons.check_circle, "Automate repetitive and time-consuming activities"),
          _whyBullet(context, Icons.integration_instructions, "Integrate seamlessly with your existing stack"),
          _whyBullet(context, Icons.group, "Empower teams to focus on high-value work"),
          _whyBullet(context, Icons.security, "Scalable, reliable, and secure digital workforce"),
        ],
      ),
    );
  }

  Widget _whyBullet(BuildContext context, IconData icon, String text) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, color: colorScheme.primary, size: 20),
          const SizedBox(width: 12),
          Flexible(
            child: Text(
              text,
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScrollToTopButton(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return AnimatedBuilder(
      animation: _scrollController,
      builder: (context, child) {
        final showButton = _scrollController.hasClients && _scrollController.offset > 500;
        return AnimatedScale(
          scale: showButton ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 300),
          child: FloatingActionButton(
            onPressed: _scrollToTop,
            backgroundColor: colorScheme.primary,
            foregroundColor: colorScheme.onPrimary,
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