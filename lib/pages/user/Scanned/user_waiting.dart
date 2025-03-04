import 'package:flutter/material.dart';
import 'package:frontend/pages/user/Scanned/user_markedsafe.dart';
import 'package:frontend/pages/user/user_dashboard.dart';
import 'package:frontend/pages/user/user_messages.dart';  // Import the UserDashboard screen

class WaitingPage extends StatefulWidget {
  @override
  _WaitingPageState createState() => _WaitingPageState();
}

class _WaitingPageState extends State<WaitingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image container
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          
          // Positioned back icon on the upper left
          Positioned(
            top: 40,
            left: 20,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.pop(context); // Navigate back when the icon is tapped
              },
            ),
          ),
          
          // Positioned message icon on the upper right
          Positioned(
            top: 40,
            right: 20,
            child: IconButton(
              icon: Icon(Icons.message, color: Colors.black),
              onPressed: () {
                // Navigate to User Messages 
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserMessagesPage()),
                );
              },
            ),
          ),
          
          // Main content section (Image and Text) inside a Column
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 80), // Adjusted space to move image higher
                // Image placed a little higher
                Image.asset('lib/assets/waiting.png', height: 250),
                SizedBox(height: 30),
                // Text message centered
                Text(
                  'Help is on the way, wait for the rescuer to arrive...',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                
                // Button placed higher with smaller Spacer
                SizedBox(height: 50),  // This gives space above the button
                Container(
                  width: double.infinity,  // Makes the button fill the width
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to Marked Safe when "I am safe" button is pressed
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => UserMarkedsafe()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Colors.green,  // Green color for the button
                    ),
                    child: Text('I am safe', style: TextStyle(color: Colors.white)),
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
