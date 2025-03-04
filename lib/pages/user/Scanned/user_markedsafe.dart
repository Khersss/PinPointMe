import 'package:flutter/material.dart';
import 'package:frontend/pages/user/user_dashboard.dart';
import 'package:frontend/pages/user/Scanned/user_waiting.dart'; // Import UserDashboard page

class UserMarkedsafe extends StatefulWidget {
  @override
  _UserMarkedsafeState createState() => _UserMarkedsafeState();
}

class _UserMarkedsafeState extends State<UserMarkedsafe> {
  @override
  void initState() {
    super.initState();

    // Add a delay of 2 seconds before navigating to the UserDashboard page
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => UserDashboard()), // Navigate to UserDashboard
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
                  child: Image.asset('lib/assets/markedsafe.png', height: 180),
                ),
                SizedBox(height: 20),
                Text(
                  'You are marked as safe.',
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
