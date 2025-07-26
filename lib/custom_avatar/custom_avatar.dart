// custom_avatar.dart
// 아바타 커스터마이징 화면 핵심 로직 담당하는 StatefulWidget.
// - 사용자가 선택한 파츠별 색상 상태 관리.
// - 아바타 움직임 애니메이션용 타이머 로직 처리.
// - AvatarParts, ColorSelector 같은 하위 위젯 조립해서 전체 화면 구성.

// custom_avatar.dart
// This StatefulWidget manages the core logic for the avatar customization screen.
// - Manages the state for selected colors of each avatar part.
// - Handles the timer logic for the avatar's breathing animation.
// - Assembles child widgets like AvatarParts and ColorSelector to build the full UI.

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_custom_avatar/custom_avatar/avatar_data.dart';
import 'package:flutter_custom_avatar/custom_avatar/avatar_parts.dart';
import 'package:flutter_custom_avatar/custom_avatar/color_selector.dart';

class CustomAvatar extends StatefulWidget {
  const CustomAvatar({super.key});

  @override
  State<CustomAvatar> createState() => _CustomAvatarState();
}

class _CustomAvatarState extends State<CustomAvatar> {
  // 현재 선택된 색상
  Color _selectedBackgroundColor = AvatarData.backgroundColors[0];
  Color _selectedBodyColor = AvatarData.bodyColors[0];
  Color _selectedHairColor = AvatarData.hairColors[0];
  Color _selectedEyesColor = AvatarData.eyesColors[0];
  Color _selectedMouthColor = AvatarData.mouthColors[0];
  Color _selectedTopColor = AvatarData.topColors[0];
  Color _selectedBottomColor = AvatarData.bottomColors[0];

  // 프레임 애니메이션 관련 변수
  final List<String> _bodyFrames = [
    'assets/images/body_1.png',
    'assets/images/body_2.png',
  ];
  int _currentFrameIndex = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 800), (timer) {
      _animate();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _animate() {
    setState(() {
      _currentFrameIndex = (_currentFrameIndex + 1) % _bodyFrames.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: SizedBox(
            width: 256,
            height: 256,
            child: Stack(
              children: [
                Container(color: _selectedBackgroundColor),
                CharacterPart(
                  assetPath: _bodyFrames[_currentFrameIndex],
                  color: _selectedBodyColor,
                ),
                CharacterPart(
                  assetPath: 'assets/images/top.png',
                  color: _selectedTopColor,
                ),
                CharacterPart(
                  assetPath: 'assets/images/bottom.png',
                  color: _selectedBottomColor,
                ),
                CharacterPart(
                  assetPath: 'assets/images/mouth.png',
                  color: _selectedMouthColor,
                ),
                CharacterPartWithoutFilter(
                  assetPath: 'assets/images/eyes_background.png',
                ),
                CharacterPart(
                  assetPath: 'assets/images/eyes.png',
                  color: _selectedEyesColor,
                ),
                CharacterPart(
                  assetPath: 'assets/images/hair.png',
                  color: _selectedHairColor,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 30),
        Expanded(
          child: Scrollbar(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ColorSelector(
                    part: 'Background',
                    colors: AvatarData.backgroundColors,
                    onColorSelected: (color) {
                      setState(() => _selectedBackgroundColor = color);
                    },
                  ),
                  ColorSelector(
                    part: 'Skin',
                    colors: AvatarData.bodyColors,
                    onColorSelected: (color) {
                      setState(() => _selectedBodyColor = color);
                    },
                  ),
                  ColorSelector(
                    part: 'Hair',
                    colors: AvatarData.hairColors,
                    onColorSelected: (color) {
                      setState(() => _selectedHairColor = color);
                    },
                  ),
                  ColorSelector(
                    part: 'Eye',
                    colors: AvatarData.eyesColors,
                    onColorSelected: (color) {
                      setState(() => _selectedEyesColor = color);
                    },
                  ),
                  ColorSelector(
                    part: 'Mouth',
                    colors: AvatarData.mouthColors,
                    onColorSelected: (color) {
                      setState(() => _selectedMouthColor = color);
                    },
                  ),
                  ColorSelector(
                    part: 'Top',
                    colors: AvatarData.topColors,
                    onColorSelected: (color) {
                      setState(() => _selectedTopColor = color);
                    },
                  ),
                  ColorSelector(
                    part: 'Pants',
                    colors: AvatarData.bottomColors,
                    onColorSelected: (color) {
                      setState(() => _selectedBottomColor = color);
                    },
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
