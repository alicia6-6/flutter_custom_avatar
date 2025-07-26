// avatar_parts.dart
// 아바타를 구성하는 개별 파츠 렌더링하는 위젯.
// - CharacterPart: 사용자 선택에 따라 색상 적용할 수 있는 파츠 렌더링.
// - CharacterPartWithoutFilter: 눈 배경(흰자) 같은 색상 변경이 필요없는 파츠 렌더링.
// 모든 위젯은 재사용 가능한 형태로 분리되어 있음. 아바타를 조립하는 메인 위젯에서 사용됨.

// avatar_parts.dart
// Widgets for rendering the individual parts of the avatar.
// - CharacterPart: Renders a part whose color can be changed based on user selection.
// - CharacterPartWithoutFilter: Renders a part that does not require a color change (e.g., the whites of the eyes).
// All widgets are designed to be reusable and are assembled by the main avatar widget.

import 'package:flutter/material.dart';

// 색상 필터가 적용되는 캐릭터 파츠를 빌드하는 위젯
class CharacterPart extends StatelessWidget {
  final String assetPath;
  final Color color;

  const CharacterPart({
    super.key,
    required this.assetPath,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      // 64x64 px 이미지를 256x256 px 크기로 키워줌.
      scale: 4,
      alignment: Alignment.topLeft,
      child: ColorFiltered(
        colorFilter: ColorFilter.mode(color, BlendMode.modulate),
        child: Image.asset(assetPath, filterQuality: FilterQuality.none),
      ),
    );
  }
}

// 색상 필터가 필요 없는 캐릭터 파츠를 빌드하는 위젯 - 눈 흰자
class CharacterPartWithoutFilter extends StatelessWidget {
  final String assetPath;

  const CharacterPartWithoutFilter({super.key, required this.assetPath});

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 4,
      alignment: Alignment.topLeft,
      child: Image.asset(assetPath, filterQuality: FilterQuality.none),
    );
  }
}
