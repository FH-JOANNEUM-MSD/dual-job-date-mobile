// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Company _$CompanyFromJson(Map<String, dynamic> json) => Company(
      id: json['id'] as int,
      name: json['name'] as String?,
      industry: json['industry'] as String?,
      logoBase64: json['logoBase64'] as String?,
      website: json['website'] as String?,
      isActive: json['isActive'] as bool,
      companyDetails: json['companyDetails'] == null
          ? null
          : CompanyDetails.fromJson(
              json['companyDetails'] as Map<String, dynamic>),
      activities: (json['activities'] as List<dynamic>)
          .map((e) => Activity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'industry': instance.industry,
      'logoBase64': instance.logoBase64,
      'website': instance.website,
      'isActive': instance.isActive,
      'companyDetails': instance.companyDetails,
      'activities': instance.activities,
    };

AcademicProgram _$AcademicProgramFromJson(Map<String, dynamic> json) =>
    AcademicProgram(
      id: json['id'] as int,
      name: json['name'] as String?,
      keyName: json['keyName'] as String?,
      academicDegreeEnum: json['academicDegreeEnum'] as int,
    );

Map<String, dynamic> _$AcademicProgramToJson(AcademicProgram instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'keyName': instance.keyName,
      'academicDegreeEnum': instance.academicDegreeEnum,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
    };

Institution _$InstitutionFromJson(Map<String, dynamic> json) => Institution(
      id: json['id'] as int,
      name: json['name'] as String?,
      keyName: json['keyName'] as String?,
      website: json['website'] as String?,
    );

Map<String, dynamic> _$InstitutionToJson(Institution instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'keyName': instance.keyName,
      'website': instance.website,
    };

CompanyDetails _$CompanyDetailsFromJson(Map<String, dynamic> json) =>
    CompanyDetails(
      shortDescription: json['shortDescription'] as String?,
      teamPictureBase64: json['teamPictureBase64'] as String?,
      jobDescription: json['jobDescription'] as String?,
      contactPersonInCompany: json['contactPersonInCompany'] as String?,
      contactPersonHRM: json['contactPersonHRM'] as String?,
      trainer: json['trainer'] as String?,
      trainerTraining: json['trainerTraining'] as String?,
      trainerProfessionalExperience:
          json['trainerProfessionalExperience'] as String?,
      trainerPosition: json['trainerPosition'] as String?,
    );

Map<String, dynamic> _$CompanyDetailsToJson(CompanyDetails instance) =>
    <String, dynamic>{
      'shortDescription': instance.shortDescription,
      'teamPictureBase64': instance.teamPictureBase64,
      'jobDescription': instance.jobDescription,
      'contactPersonInCompany': instance.contactPersonInCompany,
      'contactPersonHRM': instance.contactPersonHRM,
      'trainer': instance.trainer,
      'trainerTraining': instance.trainerTraining,
      'trainerProfessionalExperience': instance.trainerProfessionalExperience,
      'trainerPosition': instance.trainerPosition,
    };

Activity _$ActivityFromJson(Map<String, dynamic> json) => Activity(
      id: json['id'] as int,
      name: json['name'] as String,
      value: json['value'] as int,
    );

Map<String, dynamic> _$ActivityToJson(Activity instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'value': instance.value,
    };

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      street: json['street'] as String?,
      buildingNumber: json['buildingNumber'] as String?,
      apartmentNumber: json['apartmentNumber'] as int?,
      city: json['city'] as String?,
      postalCode: json['postalCode'] as String?,
      country: json['country'] as String?,
      floor: json['floor'] as int?,
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'street': instance.street,
      'buildingNumber': instance.buildingNumber,
      'apartmentNumber': instance.apartmentNumber,
      'city': instance.city,
      'postalCode': instance.postalCode,
      'country': instance.country,
      'floor': instance.floor,
    };

StudentCompany _$StudentCompanyFromJson(Map<String, dynamic> json) =>
    StudentCompany(
      id: json['id'] as int,
      studentId: json['studentId'] as String?,
      companyId: json['companyId'] as int,
      like: json['like'] as bool,
    );

Map<String, dynamic> _$StudentCompanyToJson(StudentCompany instance) =>
    <String, dynamic>{
      'id': instance.id,
      'studentId': instance.studentId,
      'companyId': instance.companyId,
      'like': instance.like,
    };
