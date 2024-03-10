import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {

    // Get screen size
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(// Set the primary background color
      body: Stack(
        children: [
          // color gradient for background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFF2FFE4), // Transparent color at the top
                  Color(0xFFE7FFCD), // 50% opacity black color at the bottom
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          // start of content
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.1,
              vertical: screenHeight * 0.1,
            ),
            child: Center(

              // container for logic content (title > input > button)
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: screenWidth * 0.25,
                  ),
                  Container(
                    child: const Text(
                        'Login',
                        style: TextStyle(
                          fontFamily: 'Parka',
                          fontSize: 42, // Adjust the font size as needed
                        ),
                      ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: screenHeight * .005),
                    child: TextField(
                      textAlign: TextAlign.center, // Center align text
                      decoration: InputDecoration(
                        hintText: 'E-Mail-Adresse',
                        filled: true, // Set to true to fill the background
                        fillColor: Colors.white, // Set the background color to white
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14.0), // Rounded corners
                          borderSide: BorderSide.none, // Remove border
                        ),
                        contentPadding: EdgeInsets.zero,
                      ),
                      style: const TextStyle(fontSize: 18.0), // Set the text height
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: screenHeight * .005),
                    child: TextField(
                      textAlign: TextAlign.center, // Center align text
                      decoration: InputDecoration(
                        hintText: 'Passwort',
                        filled: true, // Set to true to fill the background
                        fillColor: Colors.white, // Set the background color to white
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14.0), // Rounded corners
                          borderSide: BorderSide.none, // Remove border
                        ),
                        contentPadding: EdgeInsets.zero,
                      ),
                      style: const TextStyle(fontSize: 18.0), // Set the text height
                    ),
                  ),
                  Container(
                    height: screenHeight * 0.1,
                    padding: EdgeInsets.symmetric(vertical: screenHeight * .02),
                    child: ElevatedButton(
                        onPressed: () {
                          // Action for login button
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                          backgroundColor: const Color(0xFF53851E),
                          textStyle: const TextStyle(color: Colors.white),
                          minimumSize: const Size(double.infinity, 40),
                        ),
                        child: const Text(
                          'LOGIN',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                  ),
                  Container(
                    height: screenHeight * 0.05,
                    child:  TextButton(
                          onPressed: () {
                            // Action for forgotten password
                          },
                          child: Text("Passwort Vergessen?",
                              style: TextStyle(color: Colors.grey.shade800,
                                  fontSize: screenHeight * .022)),
                        ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
