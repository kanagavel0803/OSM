import 'package:flutter/material.dart';
import 'google_map.dart';
import 'user_signin.dart';
// Import the GoogleMapPage

class LoginPage2 extends StatelessWidget {
  final String role;

  LoginPage2({required this.role});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$role Login'),
        backgroundColor: Color.fromARGB(255, 31, 157, 161),
      ),
      body: Container(
        color: Color.fromARGB(255, 31, 157, 161),
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'USER',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF000000),
                ),
              ),
              SizedBox(height: 10),
              Icon(
                Icons.person,
                color: Color(0xFFFFFFFF),
                size: 200,
              ),
              SizedBox(height: 20),
              // Username Input
              TextField(
                decoration: InputDecoration(
                  labelText: 'Username',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                ),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 20),
              // Password Input
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                ),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 20),
              // Login Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 200, 162, 146),
                ),
                onPressed: () {
                  _showPermissionPopup(context);
                },
                child: Text('Login', style: TextStyle(color: Colors.black)),
              ),
              SizedBox(height: 20),

              Text(
                'OR',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),

              // Login with Google Button
              ElevatedButton.icon(
                icon: Image.asset(
                  'images/google_icon.png', // Add a Google icon image in your assets
                  height: 24,
                  width: 24,
                ),
                label: Text('Login with Google', style: TextStyle(color: Colors.black)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 200, 162, 146), // Button color
                  foregroundColor: Colors.black, // Text color
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  side: BorderSide(color: Colors.black), // Border color
                ),
                onPressed: () {
                  // Add your Google login logic here!
                  print('Login with Google button pressed');
                },
              ),
              SizedBox(height: 20),
              // Sign Up Text
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserSignUpPage()),
                  );
                },
                child: Text(
                  "Don’t have an account? Sign Up",
                  style: TextStyle(color: Color.fromARGB(164, 114, 117, 119)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
// popup notification
  void _showPermissionPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Allow this " Maps " to access your location?'),
          content: Text('Your current location will be displayed on the map and used for locate the  near "Mechanic Garages"'),
          actions: <Widget>[
            TextButton(
              child: Text("Don't Allow"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Allow"),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GoogleMapPage()),
                );
              },
            ),
          ],
        );
      },
    );
  }
}