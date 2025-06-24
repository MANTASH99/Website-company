

import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'theme.dart';
import 'pages/landing_page.dart';
import 'pages/data_annotation_page.dart';
import 'pages/ai_app_development_page.dart';
import 'pages/ai_consulting_page.dart';
import 'pages/ai_data_acquisition_page.dart';
import 'pages/book_demo_page.dart';
import 'pages/impressum_page.dart';
import 'pages/text_annotation_page.dart';
import 'pages/computer_vision_page.dart';
import 'pages/3d_annotation_page.dart';

void main() {
  
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ImplementAIApp());
}

class ImplementAIApp extends StatelessWidget {
  const ImplementAIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ImplementAI - AI Solutions for the Future',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LandingPage(),
        '/data-annotation': (context) => const DataAnnotationPage(),
        '/ai-app-development': (context) => const AIAppDevelopmentPage(),
        '/ai-consulting': (context) => const AIConsultingPage(),
        '/ai-data-acquisition': (context) => const AIDataAcquisitionPage(),
        '/book-demo': (context) => const BookDemoPage(),
        '/impressum': (context) => const ImpressumPage(),
        '/text-annotation': (context) => const TextAnnotationPage(),
        '/computer-vision': (context) => const ComputerVisionPage(),
        '/3d-annotation': (context) => const ThreeDAnnotationPage(),
      },
    );
  }
}