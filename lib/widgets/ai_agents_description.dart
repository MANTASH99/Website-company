import 'package:flutter/material.dart';

class AiAgentsDescription extends StatelessWidget {
  const AiAgentsDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "What are AI Agents?",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 16),
          Text(
            "Our AI Agents are autonomous digital workers that can execute complex business tasks, automate workflows, and interact with your systems with little or no human intervention. Improve efficiency, reduce costs, and scale your operations with our tailored agent technology.",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 28),
          Text(
            "Why AI Agents?",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            "• Automate repetitive and time-consuming activities\n"
            "• Integrate seamlessly with your existing software stack\n"
            "• Empower your teams to focus on high-value work\n"
            "• Scalable, reliable, and always-on digital workforce",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}