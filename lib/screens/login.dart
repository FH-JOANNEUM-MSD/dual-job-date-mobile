import 'package:dual_job_date_mobile/screens/home.dart';
import 'package:dual_job_date_mobile/screens/set_password.dart';
import 'package:flutter/material.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Center(
        child: OutlinedButton(
          child: const Text("Login"),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const SetPassword()),
            );
          },
        ),
      ),
    );
  }
}
