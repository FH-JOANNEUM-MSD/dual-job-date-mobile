import 'package:flutter/material.dart';


///contains static skill chips as well as selectable skill chips
class StudentProfileSkillChips extends StatelessWidget {
  final List<Color> colors;
  final List<String> skills;

  const StudentProfileSkillChips(
      {super.key, required this.colors, required this.skills});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5,
      runSpacing: 0,
      children: skills.asMap().entries.map((entry) {
        final color = colors[entry.key % colors.length];
        return Chip(
          label: Text(entry.value),
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: BorderSide(color: darken(color, 0.3), width: 1.0),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        );
      }).toList(),
    );
  }
  Color darken(Color color, double amount) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(color);
    return hsl
        .withLightness((hsl.lightness - amount).clamp(0.0, 1.0))
        .toColor();
  }
}

class StudentProfileSkillChipsUpdate extends StatefulWidget {
  final List<String> skills;
  final Color chipColor;

  const StudentProfileSkillChipsUpdate({
    super.key,
    required this.skills,
    required this.chipColor,
  });

  @override
  State<StudentProfileSkillChipsUpdate> createState() =>
      _StudentProfileSkillChipsState();
}

class _StudentProfileSkillChipsState extends State<StudentProfileSkillChipsUpdate> {
  final Set<int> selectedIndices = {}; // Track selected chip indices

  // Function to handle chip selection
  void onChipSelected(int index) {
    setState(() {
      if (selectedIndices.contains(index)) {
        selectedIndices.remove(index);
      } else {
        selectedIndices.add(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5,
      runSpacing: 0,
      children: widget.skills
          .asMap()
          .entries
          .map((entry) {
        final isSelected = selectedIndices.contains(entry.key);
        return ChoiceChip(
          label: Text(entry.value, style: const TextStyle(fontSize: 16.0,)),
          backgroundColor: Colors.transparent,
          showCheckmark: false,
          selectedColor: widget.chipColor.withOpacity(0.13),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: BorderSide(color: widget.chipColor, width: 2.0),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          selected: isSelected,
          onSelected: (bool selected) => onChipSelected(entry.key),
        );
      }).toList(),
    );
  }
}