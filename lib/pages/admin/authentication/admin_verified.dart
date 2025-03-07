import 'package:flutter/material.dart';

class AdminVerified extends StatefulWidget {
  @override
  _AdminVerifiedState createState() => _AdminVerifiedState();
}

class _AdminVerifiedState extends State<AdminVerified> {
  List<TextEditingController> _controllers = List.generate(6, (index) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/admin_background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'lib/assets/verify.png', // Replace with your image path
                  width: 120, // Adjust size as needed 
                  height: 120,
                ),
                SizedBox(height: 20),
                Text(
                  'Verification Complete!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
          ),
          ),
      ),
    );
  }
}