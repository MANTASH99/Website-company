import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:video_player/video_player.dart';

import '../widgets/data_annotation_header.dart';
import '../widgets/footer_widget.dart';

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

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          const SliverToBoxAdapter(child: DataAnnotationHeader()),
          const SliverToBoxAdapter(child: _AiAgentsHero()),
          const SliverToBoxAdapter(child: _AiAgentsDescription()),
          const SliverToBoxAdapter(child: _AiAgentsServices()),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 48),
              child: _buildCtaSection(context),
            ),
          ),
          const SliverToBoxAdapter(child: FooterWidget()),
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

  static Widget _buildCtaSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(36),
        decoration: BoxDecoration(
          color: Colors.blueGrey.withOpacity(0.18),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Text(
              "Ready to boost productivity with AI agents?",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.white, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              "Book a free strategy call and discover how AI agents can revolutionize your business.",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.white.withOpacity(0.82),
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 22),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/book-demo');
              },
              icon: const Icon(Icons.calendar_month),
              label: const Text("Book Your Strategy Session"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                    horizontal: 28, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
              ),
            )
                .animate()
                .fadeIn(duration: 700.ms)
                .slideY(begin: 0.3, end: 0)
                .shimmer(duration: 2000.ms, curve: Curves.easeIn),
          ],
        ),
      ),
    );
  }
}

class _AiAgentsHero extends StatefulWidget {
  const _AiAgentsHero();

  @override
  State<_AiAgentsHero> createState() => _AiAgentsHeroState();
}

class _AiAgentsHeroState extends State<_AiAgentsHero> with TickerProviderStateMixin {
  late VideoPlayerController _videoController;
  bool _videoReady = false;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.asset('assets/aiagent.mp4')
      ..initialize().then((_) {
        setState(() => _videoReady = true);
        _videoController.setLooping(true);
        _videoController.setVolume(0);
        _videoController.play();
      });
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveBreakpoints.of(context).largerThan(TABLET);
    return Container(
      margin: const EdgeInsets.only(top: 42, bottom: 32),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xff151c2c),
          borderRadius: BorderRadius.circular(36),
        ),
        padding: isDesktop
            ? const EdgeInsets.symmetric(vertical: 46, horizontal: 48)
            : const EdgeInsets.all(18),
        child: isDesktop
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Textual content
                  Expanded(
                    flex: 6,
                    child: _buildHeroText(context),
                  ),
                  const SizedBox(width: 36),
                  // Video
                  Expanded(
                    flex: 5,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: AspectRatio(
                        aspectRatio: 16 / 7,
                        child: _videoReady
                            ? VideoPlayer(_videoController)
                                .animate()
                                .fadeIn(duration: 900.ms)
                            : Container(
                                color: Colors.black12,
                                child: const Center(
                                    child: CircularProgressIndicator()),
                              ),
                      ),
                    ),
                  ),
                ],
              )
            : Column(
                children: [
                  _buildHeroText(context),
                  const SizedBox(height: 26),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: AspectRatio(
                      aspectRatio: 16 / 7,
                      child: _videoReady
                          ? VideoPlayer(_videoController)
                              .animate()
                              .fadeIn(duration: 900.ms)
                          : Container(
                              color: Colors.black12,
                              child: const Center(
                                  child: CircularProgressIndicator()),
                            ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildHeroText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "AI Agents",
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
              color: const Color(0xff3f89fc),
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2),
        )
            .animate()
            .fadeIn(duration: 700.ms, delay: 0.ms)
            .slideY(begin: 0.3, end: 0),
        const SizedBox(height: 16),
        Text(
          "Autonomous digital workers to automate business processes, execute tasks, and accelerate your business transformation.",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Colors.white.withOpacity(0.90), fontWeight: FontWeight.w500),
        )
            .animate()
            .fadeIn(duration: 700.ms, delay: 150.ms)
            .slideY(begin: 0.3, end: 0),
        const SizedBox(height: 30),
        Wrap(
          spacing: 14,
          runSpacing: 12,
          children: [
            _heroChip(context, Icons.flash_on, 'Real-Time Automation', const Color(0xff6c63ff)),
            _heroChip(context, Icons.link, 'Seamless Integration', const Color(0xff48e06c)),
            _heroChip(context, Icons.shield, 'Secure & Reliable', const Color(0xff3f89fc)),
          ],
        )
            .animate()
            .fadeIn(duration: 700.ms, delay: 350.ms)
            .slideY(begin: 0.3, end: 0),
      ],
    );
  }

  Widget _heroChip(BuildContext context, IconData icon, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.09),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: color.withOpacity(0.38), width: 1.2),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
                color: color, fontWeight: FontWeight.w600, fontSize: 14),
          ),
        ],
      ),
    );
  }
}

class _AiAgentsDescription extends StatelessWidget {
  const _AiAgentsDescription();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // What are AI Agents?
          Text(
            "What are AI Agents?",
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: const Color(0xff3f89fc),
              fontWeight: FontWeight.w700,
            ),
          )
              .animate()
              .fadeIn(duration: 700.ms)
              .slideX(begin: -0.2, end: 0),
          const SizedBox(height: 16),
          Text(
            "AI agents are intelligent software entities that perceive, decide, and act autonomously. They combine AI, automation, and integration to handle complex workflows, reliably execute tasks, and adapt to changing business needs—empowering your teams to focus on innovation.",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.white.withOpacity(0.89),
              height: 1.6,
            ),
          )
              .animate(delay: 200.ms)
              .fadeIn(duration: 700.ms)
              .slideX(begin: -0.2, end: 0),
          const SizedBox(height: 36),

          // Key Benefits (animated icons and cards)
          Text(
            "Why AI Agents?",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )
              .animate(delay: 400.ms)
              .fadeIn(duration: 700.ms)
              .slideX(begin: -0.2, end: 0),
          const SizedBox(height: 24),
          Wrap(
            spacing: 28,
            runSpacing: 24,
            children: [
              _benefitCard(
                context,
                icon: Icons.schedule,
                title: "24/7 Operations",
                desc: "Agents work continuously, boosting productivity and responsiveness.",
                delay: 0,
              ),
              _benefitCard(
                context,
                icon: Icons.auto_fix_high,
                title: "Reduce Costs",
                desc: "Cut operational expenses by automating repetitive tasks.",
                delay: 100,
              ),
              _benefitCard(
                context,
                icon: Icons.groups,
                title: "Empower Teams",
                desc: "Free up human talent to focus on innovation and strategy.",
                delay: 200,
              ),
              _benefitCard(
                context,
                icon: Icons.lightbulb,
                title: "Continuous Learning",
                desc: "Agents learn and adapt to deliver ever-improving results.",
                delay: 300,
              ),
            ],
          ),
          const SizedBox(height: 48),

          // Use Cases
          Text(
            "Popular Use Cases",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )
              .animate(delay: 600.ms)
              .fadeIn(duration: 700.ms)
              .slideX(begin: -0.2, end: 0),
          const SizedBox(height: 18),
          Wrap(
            spacing: 24,
            runSpacing: 14,
            children: [
              _useCaseChip(context, Icons.support_agent, "Customer Support Automation", 0),
              _useCaseChip(context, Icons.analytics, "Data Analysis & Insights", 100),
              _useCaseChip(context, Icons.shopping_cart, "E-commerce Operations", 200),
              _useCaseChip(context, Icons.payment, "Invoice Processing", 300),
              _useCaseChip(context, Icons.security, "Fraud Detection", 400),
              _useCaseChip(context, Icons.integration_instructions, "System Integration", 500),
            ],
          ),
        ],
      ),
    );
  }

  Widget _benefitCard(BuildContext context,
      {required IconData icon,
      required String title,
      required String desc,
      required int delay}) {
    return Container(
      width: 250,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.04),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withOpacity(0.08)),
        boxShadow: [
          BoxShadow(
            color: Colors.blueAccent.withOpacity(0.04),
            blurRadius: 18,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: const Color(0xff3f89fc), size: 41),
          const SizedBox(height: 14),
          Text(title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600, color: Colors.white)),
          const SizedBox(height: 9),
          Text(desc,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white.withOpacity(0.84),
                  ),
              textAlign: TextAlign.center),
        ],
      ),
    )
        .animate()
        .fadeIn(duration: 600.ms, delay: (delay + 400).ms)
        .slideY(begin: 0.15, end: 0, curve: Curves.easeOutBack);
  }

  Widget _useCaseChip(
      BuildContext context, IconData icon, String label, int delay) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.07),
        borderRadius: BorderRadius.circular(17),
        border: Border.all(color: Colors.blueAccent.withOpacity(0.19)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.blueAccent, size: 19),
          const SizedBox(width: 8),
          Text(label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.white, fontWeight: FontWeight.w600)),
        ],
      ),
    )
        .animate()
        .fadeIn(duration: 600.ms, delay: (delay + 1000).ms)
        .slideY(begin: 0.15, end: 0, curve: Curves.easeOutBack);
  }
}

class _AiAgentsServices extends StatelessWidget {
  const _AiAgentsServices();

  @override
  Widget build(BuildContext context) {
    final services = [
      {
        'icon': Icons.assignment_turned_in,
        'title': "Task Automation",
        'desc': "End-to-end automation for repetitive business tasks.",
      },
      {
        'icon': Icons.integration_instructions,
        'title': "Seamless Integration",
        'desc': "Plug agents into your existing apps and workflows.",
      },
      {
        'icon': Icons.groups,
        'title': "Human Collaboration",
        'desc': "Empower teams to focus on high-value tasks; agents handle the busywork.",
      },
      {
        'icon': Icons.insights,
        'title': "Continuous Learning",
        'desc': "Agents adapt and improve efficiency over time.",
      },
      {
        'icon': Icons.security,
        'title': "Secure & Reliable",
        'desc': "Enterprise-grade security and reliability.",
      },
      {
        'icon': Icons.analytics,
        'title': "Data-Driven Decisions",
        'desc': "AI agents collect, analyze, and act on business data.",
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Wrap(
        spacing: 24,
        runSpacing: 24,
        children: [
          ...services.asMap().entries.map((entry) {
            final idx = entry.key;
            final s = entry.value;
            return Container(
              width: 260,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.13),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: Colors.white.withOpacity(0.08)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueAccent.withOpacity(0.05),
                    blurRadius: 20,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Icon(s['icon'] as IconData, size: 40, color: const Color(0xff3f89fc)),
                  const SizedBox(height: 14),
                  Text(s['title'] as String,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600, color: Colors.white)),
                  const SizedBox(height: 9),
                  Text(s['desc'] as String,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white.withOpacity(0.84),
                      ),
                      textAlign: TextAlign.center),
                ],
              ),
            )
                .animate()
                .fadeIn(duration: 600.ms, delay: (300 + idx * 110).ms)
                .slideY(begin: 0.1, end: 0, curve: Curves.easeOutBack);
          }),
        ],
      ),
    );
  }
}