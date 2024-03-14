import 'package:flutter/material.dart';

class StudentProfileSkillChips extends StatelessWidget {
  final List<Color> colors;
  final List<String> skills;

  const StudentProfileSkillChips(
      {super.key, required this.colors, required this.skills});

  @override
  Widget build(BuildContext context) {
    Color darken(Color color, double amount) {
      assert(amount >= 0 && amount <= 1);
      final hsl = HSLColor.fromColor(color);
      return hsl
          .withLightness((hsl.lightness - amount).clamp(0.0, 1.0))
          .toColor();
    }

    // Function to create a Chip widget with color and border logic
    Widget createChip(int index, String skill, List<Color> colors) {
      final chipColor = colors[index % colors.length];
      final borderColor = darken(chipColor, 0.3);
      return Chip(
        label: Text(skill,  style: const TextStyle(fontSize: 16),),
        backgroundColor: colors[index % colors.length],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: borderColor, width: 1),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
      );
    }

    // Build method with Wrap widget
    return Wrap(
      spacing: 5,
      runSpacing: 0,
      children: skills
          .asMap()
          .entries
          .map((entry) => createChip(entry.key, entry.value, colors))
          .toList(),
    );
  }
}

class StudentProfileSkillChipsUpdate extends StatefulWidget {
  final List<String> skills;
  final Color chipColor; // Define a single color for all chips

  const StudentProfileSkillChipsUpdate({
    super.key,
    required this.skills,
    required this.chipColor,
  });

  @override
  State<StudentProfileSkillChipsUpdate> createState() =>
      _StudentProfileSkillChipsState();
}

class _StudentProfileSkillChipsState
    extends State<StudentProfileSkillChipsUpdate> {
  int selectedIndex = -1; // Removed, replaced with selectedIndices
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
    // Function to create a Chip widget with color and border logic
    Widget createChip(int index, String skill) {
      final isSelected = selectedIndices
          .contains(index); // Check if index is in selectedIndices
      final borderColor = widget.chipColor;

      return ChoiceChip(
        label: Text(skill, style: const TextStyle(fontSize: 16)),
        backgroundColor: Colors.transparent,
        selectedColor: widget.chipColor.withOpacity(0.13),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: borderColor, width: 2),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
        selected: isSelected, // Use selectedIndices for selection state
        onSelected: (bool selected) =>
            onChipSelected(index), // Handle selection with callback
      );
    }

    // Build method with Wrap widget
    return Wrap(
      spacing: 5,
      runSpacing: 0,
      children: widget.skills
          .asMap()
          .entries
          .map((entry) => createChip(entry.key, entry.value))
          .toList(),
    );
  }
}

