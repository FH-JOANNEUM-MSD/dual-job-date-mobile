import 'package:dual_job_date_mobile/models/company.dart';
import 'package:dual_job_date_mobile/widgets/swipe_ui/custom_swipe_card.dart';
import 'package:flutter/material.dart';

class CustomAnimatedSwipeCard extends StatelessWidget {
  const CustomAnimatedSwipeCard({super.key, required this.company});

  final Company company;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      background: Container(
        color: Colors.green,
        child: const Center(child: Icon(Icons.add)),
      ),
      secondaryBackground: Container(
        color: Colors.red,
        child: const Center(child: Icon(Icons.cancel)),
      ),
      // Assuming `name` is a unique identifier for each company
      key: ValueKey(company.name),
      confirmDismiss: (direction) {
        // TODO: send a like/dislike to the backend
        // TODO: Update UI
        if(direction == DismissDirection.startToEnd){
          print("like");
        } else if(direction == DismissDirection.endToStart) {
          print("dislike");
        }
        return Future(() => false);
      },
      child: CustomSwipeCard(
        company: company,
      ),
    );
  }
}
