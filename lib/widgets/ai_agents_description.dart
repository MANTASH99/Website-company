import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AiAgentsDescription extends StatelessWidget {
  const AiAgentsDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section 1: What are AI Agents?
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
            "AI agents are intelligent digital entities designed to autonomously perceive their environment, reason, make decisions, and act to accomplish complex business tasks. Leveraging advanced AI, machine learning, and automation, these agents streamline workflows and operate with minimal human input.",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.white.withOpacity(0.89),
              height: 1.6,
            ),
          )
              .animate(delay: 200.ms)
              .fadeIn(duration: 700.ms)
              .slideX(begin: -0.2, end: 0),
          const SizedBox(height: 36),

          // Section 2: Key Benefits (animated icons and cards)
          Text(
            "Why Your Business Needs AI Agents",
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

          // Section 3: Use Cases
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
          const SizedBox(height: 54),

          // Section 4: CTA
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: Colors.blueGrey.withOpacity(0.15),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Text(
                  "Discover how AI agents can transform your business.",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.2,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 14),
                Text(
                  "Get a tailored consultation to automate your business workflows with confidence.",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.white.withOpacity(0.8),
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 22),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/book-demo');
                  },
                  icon: const Icon(Icons.calendar_month),
                  label: const Text("Book Your Expert Session"),
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