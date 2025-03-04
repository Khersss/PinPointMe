import 'package:flutter/material.dart';

class PreventiveMeasuresPage extends StatefulWidget {
  @override
  _PreventiveMeasuresPageState createState() => _PreventiveMeasuresPageState();
}

class _PreventiveMeasuresPageState extends State<PreventiveMeasuresPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 25, 117, 192),
        title: Text("What To Do"),
        elevation: 0, foregroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          // Image Section (Always Visible)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(
              'lib/assets/earthquake_safety_image.png',
              height: 200,
              fit: BoxFit.contain,
            ),
          ),

          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: <Widget>[
                // Text Section (Scrollable)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "During an earthquake:",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 30),
                          Text("1. Drop to the ground to prevent being knocked over."),
                          Text("2. Take cover under something sturdy, like a table, to protect yourself from falling objects."),
                          Text("3. Hold on to that cover until the shaking stops. If there's no cover, shield your head and neck with your arms."),
                          Text("4. Stay indoors if you're inside, and away from windows or doors."),
                          Text("5. If you're outside, stay in an open area, away from buildings, trees, and power lines."),
                          Text("6. If you're driving, pull over safely and stay in the car until the shaking stops."),
                          Text("7. Just stay calm and follow these steps to stay safe!"),
                        ],
                      ),
                    ),
                  ),
                ),

                // Second Page with Text
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "This is the second page. You can add more content here.",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Pagination Dots
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                for (int i = 0; i < 2; i++)
                  Container(
                    width: 8.0,
                    height: 8.0,
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentPage == i ? Colors.blue : Colors.grey,
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