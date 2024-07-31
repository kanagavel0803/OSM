import 'package:flutter/material.dart';

import 'user_login.dart';
import 'mech_login.dart';

class ChoicePage extends StatelessWidget {
  // Method to get a greeting message based on the time of day
  String getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning!';
    } else if (hour < 17) {
      return 'Good Afternoon!';
    } else {
      return 'Good Evening!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getGreeting()),
        backgroundColor: Color.fromARGB(255, 31, 157, 161),
      ),
      body: Container(
        color: Color.fromARGB(255, 31, 157, 161),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Insert your image here
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'images/ads.png',
                  width: 450, // Increased width
                  height: 200, // Increased height
                  fit: BoxFit.contain, // Ensure the image is not cropped
                ),
              ),
              SizedBox(height: 50), // Adjusted height for spacing

              // User button with icon
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.person, color: Colors.black, size: 40),
                    SizedBox(width: 20), // Adjusted width for spacing
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 207, 204, 203),
                          padding: EdgeInsets.symmetric(vertical: 25),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage2(role: 'User')),
                          );
                        },
                        child: Text('User', style: TextStyle(color: Colors.black)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Mechanic button with icon
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.build, color: Colors.black, size: 40),
                    SizedBox(width: 20), // Adjusted width for spacing
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 207, 204, 203),
                          padding: EdgeInsets.symmetric(vertical: 25),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage3(role: 'Mechanic')),
                          );
                        },
                        child: Text('Mechanic', style: TextStyle(color: Colors.black)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}