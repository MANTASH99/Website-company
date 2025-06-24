import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';

import '../theme.dart';

class FindRosiShowcase extends StatefulWidget {
  const FindRosiShowcase({super.key});

  @override
  State<FindRosiShowcase> createState() => _FindRosiShowcaseState();
}

class _FindRosiShowcaseState extends State<FindRosiShowcase>
    with TickerProviderStateMixin {
  late AnimationController _rotateController;
  late AnimationController _pulseController;
  bool _isVisitHovered = false;

  @override
  void initState() {
    super.initState();
    _rotateController = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
    
    _pulseController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _rotateController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveBreakpoints.of(context).isMobile;
    
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).colorScheme.surfaceVariant,
            Theme.of(context).colorScheme.surface,
          ],
        ),
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: isMobile ? _buildMobileLayout(context) : _buildDesktopLayout(context),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: _buildImageContent(context),
        ),
        const SizedBox(width: 60),
        Expanded(
          flex: 3,
          child: _buildTextContent(context),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        _buildTextContent(context),
        const SizedBox(height: 48),
        _buildImageContent(context),
      ],
    );
  }

  Widget _buildTextContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                ),
              ),
              child: Text(
                'OUR SUCCESS STORY',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                ),
              ),
            )
                .animate()
                .fadeIn(delay: 200.ms, duration: 600.ms)
                .slideX(begin: -0.3, end: 0),
          ],
        ),
        
        const SizedBox(height: 20),
        
        Text(
          'FIND ROSI',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSurface,
            letterSpacing: 1.5,
          ),
        )
            .animate()
            .fadeIn(delay: 400.ms, duration: 800.ms)
            .slideY(begin: 0.2, end: 0)
            .shimmer(delay: 1200.ms, duration: 2000.ms),
        
        const SizedBox(height: 24),
        
        Text(
          'Find Rosi is an innovative AI-powered application developed by ImplementAI MH UG. The application features advanced AI capabilities to provide users with a unique and engaging experience. With intelligent algorithms and beautiful design, Find Rosi demonstrates our ability to create sophisticated applications that combine cutting-edge technology with intuitive user interfaces.',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            height: 1.6,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
          ),
        )
            .animate()
            .fadeIn(delay: 600.ms, duration: 800.ms)
            .slideY(begin: 0.1, end: 0),
        
        const SizedBox(height: 32),
        
        _buildFeatures(context),
        
        const SizedBox(height: 40),
        
        MouseRegion(
          onEnter: (_) => setState(() => _isVisitHovered = true),
          onExit: (_) => setState(() => _isVisitHovered = false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            transform: Matrix4.identity()
              ..scale(_isVisitHovered ? 1.05 : 1.0),
            child: ElevatedButton(
              onPressed: _launchFindRosiWebsite,
              style: ElevatedButton.styleFrom(
                backgroundColor: _isVisitHovered 
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: _isVisitHovered ? 8 : 0,
                shadowColor: Theme.of(context).colorScheme.primary.withOpacity(0.3),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.launch,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Visit Website',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
            .animate()
            .fadeIn(delay: 1000.ms, duration: 600.ms)
            .scale(begin: const Offset(0.8, 0.8)),
      ],
    );
  }

  Widget _buildFeatures(BuildContext context) {
    final features = [
      {'icon': Icons.psychology, 'title': 'AI-Powered Intelligence'},
      {'icon': Icons.palette, 'title': 'Beautiful Design'},
      {'icon': Icons.speed, 'title': 'High Performance'},
      {'icon': Icons.phone_android, 'title': 'Mobile Optimized'},
    ];

    return Wrap(
      spacing: 24,
      runSpacing: 16,
      children: features.asMap().entries.map((entry) {
        int index = entry.key;
        Map<String, dynamic> feature = entry.value;
        
        return AnimatedBuilder(
          animation: _pulseController,
          builder: (context, child) {
            return Transform.scale(
              scale: 1.0 + (_pulseController.value * 0.05),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      feature['icon'],
                      color: Theme.of(context).colorScheme.primary,
                      size: 18,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      feature['title'],
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        )
            .animate()
            .fadeIn(delay: Duration(milliseconds: 800 + (index * 100)), duration: 600.ms)
            .slideY(begin: 0.3, end: 0);
      }).toList(),
    );
  }

  Widget _buildImageContent(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Rotating background circle
        AnimatedBuilder(
          animation: _rotateController,
          builder: (context, child) {
            return Transform.rotate(
              angle: _rotateController.value * 2 * 3.14159,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).colorScheme.primary.withOpacity(0.1),
                      Theme.of(context).colorScheme.secondary.withOpacity(0.1),
                      Theme.of(context).colorScheme.tertiary.withOpacity(0.1),
                    ],
                    stops: const [0.0, 0.5, 1.0],
                  ),
                ),
              ),
            );
          },
        ),
        
        // Main app mockup
        Container(
          width: 200,
          height: 350,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Theme.of(context).colorScheme.surface,
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
            image: DecorationImage(
              image: NetworkImage(
                "https://pixabay.com/get/g8e9f3391a059e893bfd7aad81cf8b4750e33d8136903a328294805669a3285773d83b731fdb9f84413fc0e252ab70a1d5b4e6b6bb1ca3e25dcf957ef4453ba49_1280.jpg",
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Theme.of(context).colorScheme.primary.withOpacity(0.1),
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.psychology,
                  size: 60,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(height: 12),
                Text(
                  'Find Rosi',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'AI Assistant',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ),
        )
            .animate()
            .fadeIn(delay: 800.ms, duration: 1000.ms)
            .scale(begin: const Offset(0.8, 0.8))
            .slideY(begin: 0.2, end: 0),
        
        // Floating AI indicators
        ..._buildFloatingElements(context),
      ],
    );
  }

  List<Widget> _buildFloatingElements(BuildContext context) {
    return [
      // Top right AI indicator
      Positioned(
        top: 20,
        right: 20,
        child: AnimatedBuilder(
          animation: _pulseController,
          builder: (context, child) {
            return Transform.scale(
              scale: 1.0 + (_pulseController.value * 0.2),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.secondary.withOpacity(0.3),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Icon(
                  Icons.auto_awesome,
                  color: Theme.of(context).colorScheme.onSecondary,
                  size: 20,
                ),
              ),
            );
          },
        )
            .animate(delay: 1200.ms)
            .fadeIn(duration: 600.ms)
            .slideX(begin: 0.5, end: 0),
      ),
      
      // Bottom left success indicator
      Positioned(
        bottom: 40,
        left: 10,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.tertiary,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.tertiary.withOpacity(0.3),
                blurRadius: 8,
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.check_circle,
                color: Theme.of(context).colorScheme.onTertiary,
                size: 16,
              ),
              const SizedBox(width: 6),
              Text(
                'Live',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onTertiary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        )
            .animate(delay: 1400.ms)
            .fadeIn(duration: 600.ms)
            .slideX(begin: -0.5, end: 0),
      ),
    ];
  }

  Future<void> _launchFindRosiWebsite() async {
    final Uri url = Uri.parse('https://findrosi.com');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Could not launch website'),
            backgroundColor: Theme.of(context).colorScheme.error,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }
}