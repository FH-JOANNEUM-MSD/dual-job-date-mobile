import 'package:dual_job_date_mobile/static_helpers/strings.dart';
import 'package:dual_job_date_mobile/tabs/companies/companies_event.dart';
import 'package:dual_job_date_mobile/widgets/swipe_ui/custom_animated_swipe_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'companies_bloc.dart';
import 'companies_state.dart';

class Companies extends StatefulWidget {
  const Companies({super.key});

  @override
  State<Companies> createState() => _CompaniesState();
}

fetchCompanies() async {
  // List<Company> r = await CompanyService.getActiveCompanies();

  // r.forEach((element) {
  //   print(element.name);
  // });
}

class _CompaniesState extends State<Companies> {
  @override
  void initState() {
    fetchCompanies();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          scrolledUnderElevation: 0,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    CompaniesScreenStrings.title,
                    style: TextStyle(fontSize: 30.0),
                  ),
                ]),
          ),
        ),
        body: BlocProvider(
          create: (context) => CompaniesBloc(),
          child: BlocBuilder<CompaniesBloc, CompaniesState>(
            builder: (context, state) {
              if (state.status == CompaniesStatus.LOADING) {
                return const Center(
                  // todo: change loading indicator
                  child: CircularProgressIndicator(),
                );
              } else if (state.status == CompaniesStatus.LOADED) {
                return ListView.builder(
                  itemCount: state.companies.length,
                  itemBuilder: (context, index) {
                    return CustomAnimatedSwipeCard(
                      company: state.companies[index],
                    );
                  },
                );
              } else if (state.status == CompaniesStatus.INITIAL) {
                BlocProvider.of<CompaniesBloc>(context)
                    .add(CompaniesFetchEvent());
                return const Center(
                  // todo: change loading indicator
                  child: CircularProgressIndicator(),
                );
              } else {
                return const Center(
                  child: Text('Error loading companies'),
                  // todo: reload button, triggern.
                  // onclick ->
                  //   BlocProvider.of<CompaniesBloc>(context)
                  //       .add(CompaniesFetchEvent());
                );
              }
            },
          ),
        ));
  }
}
