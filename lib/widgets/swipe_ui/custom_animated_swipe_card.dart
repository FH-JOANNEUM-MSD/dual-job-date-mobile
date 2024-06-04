import 'package:dual_job_date_mobile/tabs/companies/companies_bloc.dart';
import 'package:dual_job_date_mobile/tabs/companies/companies_event.dart';
import 'package:dual_job_date_mobile/widgets/swipe_ui/custom_swipe_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../services/companies/company.dart';

class CustomAnimatedSwipeCard extends StatefulWidget {
  const CustomAnimatedSwipeCard({super.key, required this.company});

  final Company company;

  @override
  State<CustomAnimatedSwipeCard> createState() =>
      _CustomAnimatedSwipeCardState();
}

class _CustomAnimatedSwipeCardState extends State<CustomAnimatedSwipeCard> {
  late bool? reaction;

  @override
  void initState() {
    super.initState();
    initializeReaction();
  }

  void initializeReaction() {
    if (widget.company.studentCompanies != null &&
        widget.company.studentCompanies!.isNotEmpty) {
      reaction = widget.company.studentCompanies!.first.like;
    } else {
      reaction = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      background: Container(
        color: Colors.green,
        child: const Center(child: Icon(Icons.thumb_up)),
      ),
      secondaryBackground: Container(
        color: Colors.red,
        child: const Center(child: Icon(Icons.thumb_down)),
      ),
      // Assuming `name` is a unique identifier for each company
      key: ValueKey(widget.company.name),
      confirmDismiss: (direction) {
        if (direction == DismissDirection.startToEnd) {
          swipeStartToEnd(context);
        } else if (direction == DismissDirection.endToStart) {
          swipeEndToStart(context);
        }
        return Future(() => false);
      },
      child: CustomSwipeCard(
        company: widget.company,
        reaction: reaction,
      ),
    );
  }

  void swipeStartToEnd(BuildContext context) {
    if (reaction == null) {
      BlocProvider.of<CompaniesBloc>(context)
          .add(CompaniesReactionEvent(widget.company.id, true));
      setState(() {
        reaction = true;
      });
    } else if (!reaction!) {
      BlocProvider.of<CompaniesBloc>(context)
          .add(CompaniesReactionEvent(widget.company.id, true));
      setState(() {
        reaction = true;
      });
    } else {
      BlocProvider.of<CompaniesBloc>(context).add(CompaniesRemoveReactionEvent(
          widget.company.id));
      setState(() {
        reaction = null;
      });
    }
  }

  void swipeEndToStart(BuildContext context) {
    if (reaction == null) {
      BlocProvider.of<CompaniesBloc>(context)
          .add(CompaniesReactionEvent(widget.company.id, false));
      setState(() {
        reaction = false;
      });
    } else if (reaction!) {
      BlocProvider.of<CompaniesBloc>(context)
          .add(CompaniesReactionEvent(widget.company.id, false));
      setState(() {
        reaction = false;
      });
    } else {
      BlocProvider.of<CompaniesBloc>(context).add(CompaniesRemoveReactionEvent(
          widget.company.id));
      setState(() {
        reaction = null;
      });
    }
  }
}
