import 'package:flutter/material.dart';
import 'package:frontend/pages/user/user_dashboard.dart';
import 'package:frontend/pages/user/waiting_page.dart'; // Import UserDashboard page

class userverified extends StatefulWidget {
  @override
  _userverifiedState createState() => _userverifiedState();
}

class _userverifiedState extends State<userverified> {
  @override
  void initState() {
    super.initState();

    // Add a delay of 2 seconds before navigating to the UserDashboard page
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WaitingPage()), // Navigate to UserDashboard
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 120),
                Center(
                  child: Image.asset('lib/assets/verify.png', height: 100),
                ),
                SizedBox(height: 20),
                Text(
                  'Verification Complete.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
