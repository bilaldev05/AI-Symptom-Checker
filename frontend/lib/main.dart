import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';

import 'features/medical_ai/screens/medical_ai_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'AI Medical Assistant',

      theme: AppTheme.lightTheme,

      home: const MedicalAiScreen(),
    );
  }
}