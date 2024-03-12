import 'package:flutter/material.dart';

class StudentProfileSkillChips extends StatelessWidget {
  final List<Color> colors;
  final String skill;
  final int index;

  const StudentProfileSkillChips(
      {super.key, required this.colors, required this.skill, required this.index});

  @override
  Widget build(BuildContext context) {
    Color darken(Color color, double amount) {
      assert(amount >= 0 && amount <= 1);
      final hsl = HSLColor.fromColor(color);
      return hsl
          .withLightness((hsl.lightness - amount).clamp(0.0, 1.0))
          .toColor();
    }

    final chipColor = colors[index % colors.length];
    final borderColor = darken(chipColor, 0.3);
    return Chip(
      label: Text(skill),
      backgroundColor: colors[index % colors.length],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: borderColor, width: 1),
      ),
      padding: const EdgeInsets.symmetric(
          horizontal: 0.0, vertical: 0.0),
    );
  }
}
