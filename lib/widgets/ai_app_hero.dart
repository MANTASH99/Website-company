import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'dart:ui';

import '../theme.dart';

class AIAppHero extends StatelessWidget {
  const AIAppHero({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.6,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            "https://pixabay.com/get/g4561fec7a3e9e4653bf76107d68d83437ffb6e8c7ad6694d7a96e2c9cd2bda2bf8714b5cf828961636f93add4c9045d0f718f041bd5b99ce050f5a8d40e8e879_1280.jpg",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withOpacity(0.3),
              Colors.black.withOpacity(0.6),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Breadcrumb
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(bottom: 32),
                child: Row(
                  children: [
                    Text(
                      'Home',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white.withOpacity(0.8),
                      ),
                    )
                        .animate()
                        .fadeIn(delay: 300.ms)
                        .slideX(begin: -0.2, end: 0),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      child: Icon(
                        Icons.chevron_right,
                        color: Colors.white.withOpacity(0.6),
                        size: 16,
                      ),
                    )
                        .animate()
                        .fadeIn(delay: 400.ms)
                        .scale(begin: const Offset(0.8, 0.8)),
                    Text(
                      'AI Application Development',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                        .animate()
                        .fadeIn(delay: 500.ms)
                        .slideX(begin: 0.2, end: 0),
                  ],
                ),
              ),
              
              // Main Title
              Text(
                'AI APPLICATION DEVELOPMENT',
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                  shadows: [
                    Shadow(
                      offset: const Offset(0, 4),
                      blurRadius: 8,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              )
                  .animate()
                  .fadeIn(delay: 600.ms, duration: 1000.ms)
                  .slideY(begin: 0.3, end: 0)
                  .shimmer(delay: 1200.ms, duration: 2000.ms),
              
              const SizedBox(height: 24),
              
              // Subtitle
              Container(
                constraints: const BoxConstraints(maxWidth: 800),
                child: Text(
                  'We build innovative applications with integrated AI capabilities to enhance user experience and deliver intelligent solutions for your business.',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white.withOpacity(0.9),
                    height: 1.5,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                )
                    .animate()
                    .fadeIn(delay: 800.ms, duration: 1000.ms)
                    .slideY(begin: 0.2, end: 0),
              ),
              
              const SizedBox(height: 48),
              
              // Technology Indicators
              Wrap(
                spacing: 16,
                runSpacing: 16,
                alignment: WrapAlignment.center,
                children: [
                  _buildTechIndicator(context, Icons.psychology, 'Machine Learning'),
                  _buildTechIndicator(context, Icons.visibility, 'Computer Vision'),
                  _buildTechIndicator(context, Icons.chat_bubble_outline, 'Natural Language'),
                  _buildTechIndicator(context, Icons.mobile_friendly, 'Cross-Platform'),
                ],
              )
                  .animate()
                  .fadeIn(delay: 1000.ms)
                  .slideY(begin: 0.3, end: 0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTechIndicator(BuildContext context, IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: Colors.white.withOpacity(0.2),
          width: 1,
        ),

      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 20,
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    )
        .animate(delay: Duration(milliseconds: 1200 + (label.hashCode % 400)))
        .fadeIn(duration: 600.ms)
        .scale(begin: const Offset(0.8, 0.8))
        .shimmer(delay: 2000.ms, duration: 1500.ms);
  }
}