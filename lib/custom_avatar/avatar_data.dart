// avatar_data.dart
// 아바타 커스터마이징에 사용되는 모든 정적(static) 데이터.
// 각 파츠별 색상 팔레트 정의.
// 다른 위젯들이 이 데이터를 공유하고 참조하도록 함.

// avatar_data.dart
// All static data used for avatar customization.
// Defines color palettes for each avatar part.
// Centralizes data for sharing and referencing by other widgets.

import 'package:flutter/material.dart';

class AvatarData {
  static const List<Color> backgroundColors = [
    Color(0xFFE8E2D7),
    Colors.blueGrey,
    Colors.green,
    Colors.pink,
    Colors.black,
  ];
  static const List<Color> bodyColors = [
    Color(0xFFFEF0D4),
    Color(0xFFE4A281),
    Color(0xFF7D4E3A),
    Color(0xFFC76C89),
    Color(0xFFD8D8D8),
  ];
  static const List<Color> hairColors = [
    Colors.black,
    Colors.brown,
    Colors.orange,
    Color(0xFFE388A9),
    Color(0xFF7DD2D2),
  ];
  static const List<Color> eyesColors = [
    Colors.black,
    Color(0xFF00A2E8),
    Color(0xFF22B14C),
    Color(0xFFA349A4),
    Color(0xFFED1C24),
  ];
  static const List<Color> mouthColors = [
    Colors.white,
    Colors.pink,
    Color(0xFF99611D),
    Color(0xFFFF7F27),
    Color(0xFFC70039),
  ];
  static const List<Color> topColors = [
    Colors.white,
    Colors.black,
    Colors.red,
    Colors.blue,
    Colors.yellow,
  ];
  static const List<Color> bottomColors = [
    Colors.white,
    Colors.black,
    Colors.green,
    Colors.blueGrey,
    Colors.purple,
  ];
}
