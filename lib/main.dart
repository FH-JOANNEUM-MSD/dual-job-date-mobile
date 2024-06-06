import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:dual_job_date_mobile/screens/home.dart';
import 'package:dual_job_date_mobile/screens/login/authentication_bloc.dart';
import 'package:dual_job_date_mobile/screens/login/authentication_event.dart';
import 'package:dual_job_date_mobile/screens/login/authentication_state.dart';
import 'package:dual_job_date_mobile/screens/login/login.dart';
import 'package:dual_job_date_mobile/screens/splash.dart';
import 'package:dual_job_date_mobile/static_helpers/colors.dart';
import 'package:dual_job_date_mobile/static_helpers/strings.dart';
import 'package:dual_job_date_mobile/static_helpers/values.dart';
import 'package:dual_job_date_mobile/tabs/appointments/appointments_bloc.dart';
import 'package:dual_job_date_mobile/tabs/companies/companies_bloc.dart';
import 'package:dual_job_date_mobile/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    Values.setScreenWidth(MediaQuery.of(context).size.width);
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(create: (context)=> AuthenticationBloc()),
        BlocProvider<CompaniesBloc>(create: (context)=> CompaniesBloc()),
        BlocProvider<AppointmentsBloc>(create: (context)=> AppointmentsBloc()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: StaticStrings.font,
          ),
          home: AnimatedSplashScreen(
              splashIconSize: MediaQuery.of(context).size.height,
              splash: const Splash(),
              nextScreen: BlocBuilder<AuthenticationBloc, AuthenticationState>(
                  builder: (context, state) {
                   // FlutterSecureStorage().deleteAll();
                if (state.status == AuthenticationStatus.UNKNOWN) {
                  BlocProvider.of<AuthenticationBloc>(context)
                      .add(RefreshBearerEvent());
                  return Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          StaticColors.topBackgroundScreen,
                          StaticColors.bottomBackgroundScreen,
                        ],
                      ),
                    ),
                    child: const Center(
                      child: CustomLoadingIndicator(),
                    ),
                  );
                } else if (state.status == AuthenticationStatus.AUTHENTICATED) {
                  return const Home();
                } else {
                  return const Login();
                }
              }))),
    );
  }
}
