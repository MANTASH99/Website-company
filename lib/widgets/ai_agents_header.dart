import 'package:flutter/material.dart';

class AiAgentsHeader extends StatelessWidget {
  const AiAgentsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: Text(
        "AI Agents Service",
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}