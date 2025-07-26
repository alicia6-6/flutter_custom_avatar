// color_selector.dart
// 아바타 특정 부위(피부, 헤어 등)에 대한 팔레트 표시.
// 사용자 선택에 따라 색상 변경 이벤트 전달.
// 재사용 가능한 StatelessWidget. 어떤 파츠의 색상 선택할 지 외부에서 받아와 사용함.

// color_selector.dart
// A reusable widget that displays a color palette for a specific avatar part.
// It handles user color selections and passes the event to a parent widget.
// The part name and color list are provided externally.

import 'package:flutter/material.dart';

class ColorSelector extends StatelessWidget {
  final String part;
  final List<Color> colors;
  final Function(Color) onColorSelected;

  const ColorSelector({
    super.key,
    required this.part,
    required this.colors,
    required this.onColorSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$part Color',
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
