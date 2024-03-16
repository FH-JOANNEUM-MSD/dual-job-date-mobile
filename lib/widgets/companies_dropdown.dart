import 'package:dual_job_date_mobile/models/company.dart';
import 'package:dual_job_date_mobile/static_helpers/colors.dart';
import 'package:flutter/material.dart';

class CompaniesDropDown extends StatelessWidget {
  const CompaniesDropDown({
    super.key,
    required this.companies,
    required this.onChanged,
  });

  // TODO: should be resolved with Dependency Injection
  final List<Company> companies;
  final Function(Object? value) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10.0),
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: StaticColors.primary),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: StaticColors.primary),
          ),
          hintText: "Unternehmen auswählen",
        ),
        items: companies.map<DropdownMenuItem<Company>>((Company c) {
          return DropdownMenuItem<Company>(
            value: c,
            child: Text(c.name),
          );
        }).toList(),
        onChanged: (Object? value) {
          onChanged(value);
        },
      ),
    );
  }
}
