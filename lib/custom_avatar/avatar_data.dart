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
    Color(0xFFF5D6E1),
    Color(0xFFE1D5E8),
    Color(0xFFF1EAD9),
    Color(0xFFD4E8F5),
    Color(0xFFD5E8D4),
  ];

  static const List<Color> bodyColors = [
    Color(0xFFECBCB4),
    Color(0xFFFFE0B2),
    Color(0xFFE0AC69),
    Color(0xFF8D5524),
    Color(0xFFC68642),
  ];

  static const List<Color> hairColors = [
    Color(0xFFF25C78),
    Color(0xFF6B4582),
    Color(0xFF5DB3A1),
    Color(0xFFF7C324),
    Color(0xFF6F4E37),
  ];

  static const List<Color> eyesColors = [
    Color(0xFF795548),
    Color(0xFF4A4B4B),
    Color(0xFF800000),
    Color(0xFF6A5ACD),
    Color(0xFF6B8E23),
  ];

  static const List<Color> mouthColors = [
    Color(0xFFE57373),
    Color(0xFFD81B60),
    Color(0xFFAD1457),
    Color(0xFFFFA07A),
    Color(0xFF8D6E63),
  ];

  static const List<Color> topColors = [
    Color(0xFFFFAB91),
    Color(0xFFCE93D8),
    Color(0xFF90CAF9),
    Color(0xFFFFF59D),
    Color(0xFFA5D6A7),
  ];

  static const List<Color> bottomColors = [
    Color(0xFFB0BEC5),
    Color(0xFFB0C4DE),
    Color(0xFFBCAAA4),
    Color(0xFFAED581),
    Color(0xFF81D4FA),
  ];
}
