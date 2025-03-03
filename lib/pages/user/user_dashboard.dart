import 'package:flutter/material.dart';
import 'package:frontend/pages/user/waiting_page.dart';
import 'package:frontend/pages/user/user_messages.dart';

class UserDashboard extends StatefulWidget {
  @override
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  List<TextEditingController> _controllers =
      List.generate(6, (index) => TextEditingController());
  List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());

  // Define a GlobalKey for the Scaffold
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _controllers.forEach((controller) => controller.dispose());
    _focusNodes.forEach((node) => node.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,  // Set the key here
      // App bar
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Makes the app bar transparent
        elevation: 0, // Removes the shadow from app bar
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.black, size: 30),
          onPressed: () {
            // Open the Drawer when hamburger menu is clicked
            _scaffoldKey.currentState?.openDrawer();  // Use the GlobalKey to open the drawer
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.black, size: 30),
            onPressed: () {
              // Add functionality for notification bell
            },
          ),
        ],
      ),
      
      // Drawer (hamburger menu options)
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // Drawer Header
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white, // You can customize this
              ),
              child: Image.asset(
                'lib/assets/pinpointme.png',  // Adjust this asset path if necessary
                height: 100,  // Increased height for logo visibility
              ),
            ),
            // Drawer Menu Items
            ListTile(
              leading: Icon(Icons.inbox),
              title: Text('Inbox'),
              onTap: () {
                // Navigate to Messages page and close the drawer
                Navigator.pop(context); // Close the drawer first
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserMessagesPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.security),
              title: Text('Preventive Measures'),
              onTap: () {
                // Navigate to Preventive Measures page and close the drawer
                Navigator.pop(context); // Close the drawer first
                // You can add navigation logic for Preventive Measures here
                // For example:
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => PreventiveMeasuresPage()),
                // );
              },
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: Text('Location History'),
              onTap: () {
                // Navigate to Location History page and close the drawer
                Navigator.pop(context); // Close the drawer first
                // You can add navigation logic for Location History here
                // For example:
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => LocationHistoryPage()),
                // );
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
              onTap: () {
                // Navigate to Profile page and close the drawer
                Navigator.pop(context); // Close the drawer first
                // You can add navigation logic for Profile here
                // For example:
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => ProfilePage()),
                // );
              },
            ),
          ],
        ),
      ),
      
      // Body content
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Main content (You can add the main content of your dashboard here)
        ],
      ),
    );
  }
}
