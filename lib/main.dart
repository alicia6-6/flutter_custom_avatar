// main.dart
// 앱 진입점 및 최상위 위젯 (MaterialApp) 설정 파일.
// 타이틀바 색상 투명으로 고정시킴.

// main.dart
// The entry point of the application, responsible for setting up the top-level widget (MaterialApp).
// Defines the global app theme and initial screen layout.

import 'package:flutter/material.dart';
import 'package:flutter_custom_avatar/custom_avatar/custom_avatar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('CUSTOM AVATAR'),
          // Keep title bar transparent
          backgroundColor: Colors.transparent,
          scrolledUnderElevation: 0,
        ),
        body: const CustomAvatar(),
      ),
    );
  }
}
