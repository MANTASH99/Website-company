import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:video_player/video_player.dart';

class AiAgentsHero extends StatefulWidget {
  const AiAgentsHero({super.key});

  @override
  State<AiAgentsHero> createState() => _AiAgentsHeroState();
}

class _AiAgentsHeroState extends State<AiAgentsHero> with TickerProviderStateMixin {
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
      margin: const EdgeInsets.only(top: 32, bottom: 24),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xff151c2c),
          borderRadius: BorderRadius.circular(36),
        ),
        padding: const EdgeInsets.all(38),
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
                            ? FadeIn(
                                child: VideoPlayer(_videoController),
                                duration: 900.ms,
                              )
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
                          ? FadeIn(
                              child: VideoPlayer(_videoController),
                              duration: 900.ms,
                            )
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