import 'package:flutter/material.dart';

class StudentProfile extends StatelessWidget {
  final String name;
  final String program;
  final String about;
  final List<String> skills;

  const StudentProfile({
    super.key,
    required this.name,
    required this.program,
    required this.about,
    required this.skills,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProfileImage(),
            _buildProfileHeader(),
            _buildDivider(),
            _buildAboutSection(),
            _buildDivider(),
            _buildSkillsSection(),
            _buildDivider(),
            _buildUploadsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    return Stack(
      children: [
        Expanded(
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: SizedBox(
                  width: 200.0,
                  height: 200.0,
                  child: Image.asset(
                    '../../assets/images/placeholder.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text(
                  name,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProfileHeader() {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 16),
      child: Text(
        program,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _buildAboutSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          // Left & right padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Über mich:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(about),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return const Divider(
      color: Colors.green,
      thickness: 2,
      indent: 16,
      endIndent: 16,
    );
  }

  Widget _buildSkillsSection() {
    final chipColors = const [
      Color(0xffffc8ed),
      Color(0xffd3e9fa),
      Color(0xffd2ffbc),
      Color(0xffffe1bc),
      Color(0xffeac3df),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Kenntnisse:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Wrap(
            spacing: 5,
            runSpacing: 6,
            children: skills
                .asMap()
                .entries
                .map((entry) =>
                    _buildSkillChip(entry.key, entry.value, chipColors))
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildSkillChip(int index, String skill, List<Color> colors) {
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
          horizontal: 0.0, vertical: 0.0), // Adjust padding as needed
    );
  }

  Widget _buildUploadsSection() {
    final uploadItems = [
      'Lebenslauf',
      'Zertifikate',
      'Weitere Dokumente'
    ]; // Sample data

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          // Left & right padding
          child: Column(
            // Nested Column for "Uploads:" and list
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Uploads:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: uploadItems.length,
                itemBuilder: (context, index) {
                  final uploadItem = uploadItems[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    child: Row(
                      children: [
                        const Icon(Icons.file_upload_outlined),
                        const SizedBox(width: 8.0),
                        Text(uploadItem),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
