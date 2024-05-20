import '../services/companies/company.dart';

class Appointment {
  final DateTime date;
  final Company company;

  Appointment({
    required this.date,
    required this.company,
  });
}

