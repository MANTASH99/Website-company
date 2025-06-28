import 'package:flutter/material.dart';

class AiAgentsServices extends StatelessWidget {
  const AiAgentsServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "What We Offer",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            children: [
              _serviceBox(
                context,
                icon: Icons.assignment_turned_in,
                title: "Task Automation",
                desc: "End-to-end automation for repetitive business tasks.",
              ),
              _serviceBox(
                context,
                icon: Icons.integration_instructions,
                title: "Seamless Integration",
                desc: "Plug agents into your existing apps and workflows.",
              ),
              _serviceBox(
                context,
                icon: Icons.insights,
                title: "Continuous Improvement",
                desc: "Agents learn and adapt to optimize operations.",
              ),
              _serviceBox(
                context,
                icon: Icons.security,
                title: "Secure & Reliable",
                desc: "Enterprise-grade security and service reliability.",
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _serviceBox(BuildContext context, {required IconData icon, required String title, required String desc}) {
    return Container(
      width: 220,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.06),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.cyanAccent.withOpacity(0.14),
            blurRadius: 18,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, size: 42, color: Theme.of(context).colorScheme.primary),
          const SizedBox(height: 16),
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          Text(desc, style: Theme.of(context).textTheme.bodySmall, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}