import 'package:flutter/material.dart';
import 'package:frontend/pages/user/user_dashboard/Drawer/inbox/user_inbox.dart';
import 'package:frontend/pages/user/user_dashboard/Drawer/user_loc_history/user_location_history.dart';
import 'package:frontend/pages/user/user_dashboard/Drawer/user_preventive.dart';
import 'package:frontend/pages/user/user_dashboard/Drawer/user_profile.dart';

class UserDashboard extends StatefulWidget {
  @override
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 25, 117, 192),
        elevation: 0, foregroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.white, size: 30),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Container(
                decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/assets/pinpointme.png'),
                  fit: BoxFit.fitWidth,
                ),
              ),
              ), // Empty container as child, the image is the background
            ),
            ListTile(
              leading: Icon(Icons.inbox),
              title: Text('Inbox'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InboxPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.security),
              title: Text('Preventive Measures'),
              onTap: () {
                Navigator.pop(context);
                // Navigate to Preventive Measures page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PreventiveMeasuresPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: Text('Location History'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserLocationHistory()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserProfile()), // Navigate to Profile page
                 );
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
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