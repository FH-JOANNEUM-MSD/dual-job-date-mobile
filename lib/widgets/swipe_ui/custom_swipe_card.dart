import 'package:dual_job_date_mobile/models/company.dart';
import 'package:dual_job_date_mobile/static_helpers/colors.dart';
import 'package:flutter/material.dart';

class CustomSwipeCard extends StatelessWidget {
  const CustomSwipeCard({super.key, required this.company});

  final Company company;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(color: StaticColors.primary, width: 2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildCompanyInfo(),
            _buildDivider(),
            _buildDescription(company.description),
            _buildDivider(),
            _buildSectionTitle("Tätigkeitsbereich"),
            _buildFieldOfActivity("Backend"),
            _buildFieldOfActivity("Frontend"),
            _buildFieldOfActivity("Datenbanken"),
            _buildDivider(),
            _buildSectionTitle("Techstack"),
            _buildTech("Flutter"),
            _buildTech("Dart"),
            _buildTech("Firebase"),
          ],
        ),
      ),
    );
  }

  Widget _buildCompanyInfo() {
    return Column(
      children: [
        Image.asset(
          company.logo,
          width: 200,
          height: 100,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                company.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(Icons.location_on),
              ),
              Text(company.location)
            ],
          ),
        )
      ],
    );
  }

  Widget _buildFieldOfActivity(String activity) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(activity),
          const Row(
            children: [
              Icon(Icons.star, color: Colors.orange),
              Icon(Icons.star, color: Colors.orange),
              Icon(Icons.star, color: Colors.orange),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildTech(String tech) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Text(tech),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildDescription(String description) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        description,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 30),
      child: Divider(),
    );
  }
}
