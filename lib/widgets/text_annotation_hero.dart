import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:video_player/video_player.dart';

class TextAnnotationHero extends StatefulWidget {
  const TextAnnotationHero({super.key});

  @override
  State<TextAnnotationHero> createState() => _TextAnnotationHeroState();
}

class _TextAnnotationHeroState extends State<TextAnnotationHero> {
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.asset(
      'assets/NLP.mp4',
    )..initialize().then((_) {
        setState(() {});
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
    final double heroHeight = isDesktop ? 500 : 370;
    final double cardWidth = isDesktop ? 1200 : MediaQuery.of(context).size.width - 8;
    final double cardHeight = isDesktop ? 530 : 380;

    return Container(
      width: double.infinity,
      height: heroHeight,
      alignment: Alignment.center,
      color: Colors.black, // Key line for seamless black background
      child: Center(
        child: Container(
          width: cardWidth,
          height: cardHeight,
          decoration: BoxDecoration(
            color: Colors.grey.shade900.withOpacity(0.80),
            borderRadius: BorderRadius.circular(0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.22),
                blurRadius: 32,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
                      if (_videoController.value.isInitialized)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(0),
                          child: SizedBox.expand(
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: SizedBox(
                                width: _videoController.value.size.width,
                                height: _videoController.value.size.height,
                                child: VideoPlayer(_videoController),
                      ),
                    ),
                  ),
                ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isDesktop ? 64 : 14,
                  vertical: isDesktop ? 48 : 14,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _breadcrumb('Home', false),
                        _breadcrumbSeparator(),
                        _breadcrumb('Data Annotation', false),
                        _breadcrumbSeparator(),
                        _breadcrumb('Natural Language Processing', true),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'NATURAL LANGUAGE PROCESSING',
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 2,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    const SizedBox(height: 32),
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 16,
                      runSpacing: 12,
                      children: [
                        _chip(context, Icons.psychology, 'Language Understanding'),
                        _chip(context, Icons.analytics, 'Text Analysis'),
                        _chip(context, Icons.chat, 'Language Generation'),
                        _chip(context, Icons.translate, 'Multilingual Support'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _breadcrumb(String text, bool active) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: active ? Colors.blueAccent.withOpacity(0.18) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: active ? Colors.blueAccent : Colors.white70,
            fontWeight: active ? FontWeight.bold : FontWeight.normal,
            fontSize: 13,
          ),
        ),
      );
  Widget _breadcrumbSeparator() => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 4),
        child: Icon(Icons.chevron_right, color: Colors.white60, size: 17),
      );

  Widget _chip(BuildContext context, IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.14),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.18)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 18),
          const SizedBox(width: 7),
          Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 15)),
        ],
      ),
    );
  }
}