import '../services/companies/company.dart';

final List<Company> mockCompanies = [
  Company(
    id: 1,
    name: 'AllForOne',
    industry: 'Consulting',
    logoBase64: 'base64EncodedStringForAllForOneLogo',
    website: 'https://www.allforone.com',
    isActive: true,
    companyDetails: CompanyDetails(
      shortDescription: 'AllForOne is a leading consulting firm.',
      teamPictureBase64: 'base64EncodedStringForTeamPicture',
      jobDescription: 'Consulting services for various industries.',
      contactPersonInCompany: 'John Doe',
      contactPersonHRM: 'Jane Doe',
      trainer: 'Jack Trainer',
      trainerTraining: 'MBA',
      trainerProfessionalExperience: '10 years in consulting',
      trainerPosition: 'Senior Consultant',
    ),
    activities: [
      Activity(id: 1, name: 'Consulting', value: 100),
    ],
    addresses: [
      Address(
        street: 'Main Street',
        buildingNumber: '1',
        apartmentNumber: null,
        city: 'Graz',
        postalCode: '8010',
        country: 'Austria',
        floor: 1,
      ),
    ],
    studentCompanies: [
      StudentCompany(id: 1, studentId: '12345', companyId: 1, like: true),
    ],
    academicProgram: AcademicProgram(
      id: 1,
      name: 'Consulting Program',
      keyName: 'CONSULT',
      academicDegreeEnum: 1,
    ),
    user: User(id: 'user1', email: 'user1@allforone.com'),
    institution: Institution(id: 1, name: 'AllForOne University', keyName: 'AFOU', website: 'https://www.allforoneuniversity.com'),
  ),
  Company(
    id: 2,
    name: 'Castana',
    industry: 'Softwareentwicklung',
    logoBase64: 'base64EncodedStringForCastanaLogo',
    website: 'https://www.castana.com',
    isActive: true,
    companyDetails: CompanyDetails(
      shortDescription: 'Castana specializes in software development.',
      teamPictureBase64: 'base64EncodedStringForTeamPicture',
      jobDescription: 'Developing cutting-edge software solutions.',
      contactPersonInCompany: 'Alice Doe',
      contactPersonHRM: 'Bob Doe',
      trainer: 'Charlie Trainer',
      trainerTraining: 'BSc Computer Science',
      trainerProfessionalExperience: '8 years in software development',
      trainerPosition: 'Lead Developer',
    ),
    activities: [
      Activity(id: 2, name: 'Development', value: 80),
    ],
    addresses: [
      Address(
        street: 'Tech Street',
        buildingNumber: '2',
        apartmentNumber: null,
        city: 'Kapfenberg',
        postalCode: '8605',
        country: 'Austria',
        floor: 2,
      ),
    ],
    studentCompanies: [
      StudentCompany(id: 2, studentId: '67890', companyId: 2, like: true),
    ],
    academicProgram: AcademicProgram(
      id: 2,
      name: 'Software Engineering Program',
      keyName: 'SOFTWARE',
      academicDegreeEnum: 2,
    ),
    user: User(id: 'user2', email: 'user2@castana.com'),
    institution: Institution(id: 2, name: 'Castana Institute', keyName: 'CASTANA', website: 'https://www.castanainstitute.com'),
  ),
];
