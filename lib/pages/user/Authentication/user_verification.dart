import 'package:flutter/material.dart';
import 'package:frontend/pages/user/Authentication/user_verified.dart';


class userverification extends StatefulWidget {
  @override
  _userverificationState createState() => _userverificationState();
}

class _userverificationState extends State<userverification> {
  List<TextEditingController> _controllers =
      List.generate(6, (index) => TextEditingController());
  List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());

  @override
  void dispose() {
    _controllers.forEach((controller) => controller.dispose());
    _focusNodes.forEach((node) => node.dispose());
    super.dispose();
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
                'Verify via email',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Enter the verification code we sent to user.name@sdca.edu.ph',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(6, (index) => 
                Container(
                  width: 40,
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  child: TextField(
                    controller: _controllers[index],
                    focusNode: _focusNodes[index],
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    decoration: InputDecoration(
                      counterText: '',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      if (value.isNotEmpty && index < 5) {
                        FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
                      }
                    },
                  ),
                ),
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Implement resend code logic
                  },
                  child: Text('Resend code', style: TextStyle(color: Colors.blue)),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  String code = _controllers.map((c) => c.text).join();
                  print('Verification Code: $code');

                   // Navigate to UserAuth page after successful verification
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => userverified()),
                    );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text('Verify', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ],
    ),
  );
  }
}