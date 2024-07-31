import 'package:flutter/material.dart';
import 'package:osm/mech_signup.dart';
import 'mech_duty.dart'; // Import the MechDutyPage here

class LoginPage3 extends StatelessWidget {
  final String role;

  const LoginPage3({required this.role});

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
                'MECHANIC',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(29, 29, 29, 1),
                ),
              ),
              SizedBox(height: 10),
              Image.asset(
                'images/mech_icon.png', // Add the path to your image
                height: 200,
                width: 200,
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MechDutyPage()), // Navigate to MechDutyPage
                  );
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
                    MaterialPageRoute(builder: (context) => MechSignUpPage()),
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
}