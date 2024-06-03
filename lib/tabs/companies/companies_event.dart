abstract class CompaniesEvent {}

class CompaniesFetchEvent extends CompaniesEvent {}

class CompaniesReactionEvent extends CompaniesEvent {
  final int companyId;
  final bool reaction;

  CompaniesReactionEvent(this.companyId, this.reaction);
}

class CompaniesRemoveReactionEvent extends CompaniesEvent {
  final int reactionId;

  CompaniesRemoveReactionEvent(this.reactionId);
}
