import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('아바타 커스터마이징')),
        body: const CustomAvatar(),
      ),
    );
  }
}

class CustomAvatar extends StatefulWidget {
  const CustomAvatar({super.key});

  @override
  State<CustomAvatar> createState() => _CustomAvatarState();
}

class _CustomAvatarState extends State<CustomAvatar> {
  // 색상 팔레트 (이전과 동일)
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

  // 현재 선택된 색상 (이전과 동일)
  Color _selectedBackgroundColor = backgroundColors[0];
  Color _selectedBodyColor = bodyColors[0];
  Color _selectedHairColor = hairColors[0];
  Color _selectedEyesColor = eyesColors[0];
  Color _selectedMouthColor = mouthColors[0];
  Color _selectedTopColor = topColors[0];
  Color _selectedBottomColor = bottomColors[0];

  // 프레임 애니메이션 관련 변수 (이전과 동일)
  final List<String> _bodyFrames = [
    'assets/images/body_1.png',
    'assets/images/body_2.png',
  ];
  int _currentFrameIndex = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // 50ms마다 이미지를 전환하여 깜빡임 없이 부드러운 느낌을 줌
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
                // AnimatedSwitcher를 제거하고 _currentFrameIndex로 직접 이미지 경로를 변경
                _buildCharacterPart(
                  _bodyFrames[_currentFrameIndex],
                  _selectedBodyColor,
                ),
                _buildCharacterPart('assets/images/top.png', _selectedTopColor),
                _buildCharacterPart(
                  'assets/images/bottom.png',
                  _selectedBottomColor,
                ),
                _buildCharacterPart(
                  'assets/images/mouth.png',
                  _selectedMouthColor,
                ),
                _buildCharacterPartWithoutFilter(
                  'assets/images/eyes_background.png',
                ),
                _buildCharacterPart(
                  'assets/images/eyes.png',
                  _selectedEyesColor,
                ),
                _buildCharacterPart(
                  'assets/images/hair.png',
                  _selectedHairColor,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 30),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildColorSelector('배경', backgroundColors, (color) {
                  setState(() => _selectedBackgroundColor = color);
                }),
                _buildColorSelector('피부', bodyColors, (color) {
                  setState(() => _selectedBodyColor = color);
                }),
                _buildColorSelector('머리', hairColors, (color) {
                  setState(() => _selectedHairColor = color);
                }),
                _buildColorSelector('눈', eyesColors, (color) {
                  setState(() => _selectedEyesColor = color);
                }),
                _buildColorSelector('입', mouthColors, (color) {
                  setState(() => _selectedMouthColor = color);
                }),
                _buildColorSelector('상의', topColors, (color) {
                  setState(() => _selectedTopColor = color);
                }),
                _buildColorSelector('하의', bottomColors, (color) {
                  setState(() => _selectedBottomColor = color);
                }),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // 키가 필요 없는 일반 캐릭터 파츠 빌더 함수
  Widget _buildCharacterPart(String assetPath, Color color) {
    return Transform.scale(
      scale: 4,
      alignment: Alignment.topLeft,
      child: ColorFiltered(
        colorFilter: ColorFilter.mode(color, BlendMode.modulate),
        child: Image.asset(assetPath, filterQuality: FilterQuality.none),
      ),
    );
  }

  // 색상 필터가 필요 없는 캐릭터 파츠 빌더 함수
  Widget _buildCharacterPartWithoutFilter(String assetPath) {
    return Transform.scale(
      scale: 4,
      alignment: Alignment.topLeft,
      child: Image.asset(assetPath, filterQuality: FilterQuality.none),
    );
  }

  Widget _buildColorSelector(
    String part,
    List<Color> colors,
    Function(Color) onColorSelected,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$part 색상',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:
                colors.map((color) {
                  return GestureDetector(
                    onTap: () => onColorSelected(color),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey, width: 2),
                      ),
                    ),
                  );
                }).toList(),
          ),
        ],
      ),
    );
  }
}
