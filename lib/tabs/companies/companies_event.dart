abstract class CompaniesEvent {}

class CompaniesFetchEvent extends CompaniesEvent {}

class CompaniesReactionEvent extends CompaniesEvent {
  final int companyId;
  final bool reation;

  CompaniesReactionEvent(this.companyId, this.reation);
}
