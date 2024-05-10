import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'company.g.dart';

@JsonSerializable()
class Company {
  final int id;
  final String? name;
  final String? industry;
  final String? logoBase64;
  final String? website;
  final bool isActive;
  final AcademicProgram? academicProgram;
  final User? user;
  final Institution? institution;
  final CompanyDetails? companyDetails;
  final List<Activity>? activities;
  final List<Address>? addresses;
  final List<StudentCompany>? studentCompanies;

  Company({
    required this.id,
    this.name,
    this.industry,
    this.logoBase64,
    this.website,
    required this.isActive,
    this.companyDetails,
    this.activities,
    this.addresses,
    this.studentCompanies,
    this.academicProgram,
    this.user,
    this.institution,
  });

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}

@JsonSerializable()
class AcademicProgram {
  final int id;
  final String? name;
  final String? keyName;
  final int academicDegreeEnum;

  AcademicProgram({
    required this.id,
    this.name,
    this.keyName,
    required this.academicDegreeEnum,
  });

  factory AcademicProgram.fromJson(Map<String, dynamic> json) =>
      _$AcademicProgramFromJson(json);
}

@JsonSerializable()
class User {
  final String? id;
  final String? email;

  User({
    this.id,
    this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@JsonSerializable()
class Institution {
  final int id;
  final String? name;
  final String? keyName;
  final String? website;

  Institution({
    required this.id,
    this.name,
    this.keyName,
    this.website,
  });

  factory Institution.fromJson(Map<String, dynamic> json) =>
      _$InstitutionFromJson(json);
}

@JsonSerializable()
class CompanyDetails {
  final String? shortDescription;
  final String? teamPictureBase64;
  final String? jobDescription;
  final String? contactPersonInCompany;
  final String? contactPersonHRM;
  final String? trainer;
  final String? trainerTraining;
  final String? trainerProfessionalExperience;
  final String? trainerPosition;

  CompanyDetails({
    this.shortDescription,
    this.teamPictureBase64,
    this.jobDescription,
    this.contactPersonInCompany,
    this.contactPersonHRM,
    this.trainer,
    this.trainerTraining,
    this.trainerProfessionalExperience,
    this.trainerPosition,
  });

  factory CompanyDetails.fromJson(Map<String, dynamic> json) =>
      _$CompanyDetailsFromJson(json);
}

@JsonSerializable()
class Activity {
  final int id;
  final String name;
  final int value;

  Activity({
    required this.id,
    required this.name,
    required this.value,
  });

  factory Activity.fromJson(Map<String, dynamic> json) =>
      _$ActivityFromJson(json);
}

@JsonSerializable()
class Address {
  final String? street;
  final String? buildingNumber;
  final int? apartmentNumber;
  final String? city;
  final String? postalCode;
  final String? country;
  final int? floor;

  Address({
    this.street,
    this.buildingNumber,
    this.apartmentNumber,
    this.city,
    this.postalCode,
    this.country,
    this.floor,
  });

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}

@JsonSerializable()
class StudentCompany {
  final int id;
  final String? studentId;
  final int companyId;
  late final bool like;

  StudentCompany({
    required this.id,
    this.studentId,
    required this.companyId,
    required this.like,
  });

  factory StudentCompany.fromJson(Map<String, dynamic> json) =>
      _$StudentCompanyFromJson(json);
}
