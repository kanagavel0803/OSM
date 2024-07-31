import 'package:flutter/material.dart';
import 'mech_duty.dart';
import 'mech_login.dart'; // Assuming this is where your login page is defined

class MechSignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mechanic Sign Up'),
        backgroundColor: Color.fromARGB(255, 31, 157, 161),
      ),
      body: Container(
        color: Color.fromARGB(255, 31, 157, 161),
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Create an Account',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 40),
                // Username Input
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter your username',
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 20),
                // Email Input
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter your email',
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 20),
                // Phone Number Input
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter your phone number',
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
                    labelText: 'Enter your password',
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 20),
                // Sign Up Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 200, 162, 146),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MechDutyPage()), 
                    );
                  },
                  child: Text('Sign Up', style: TextStyle(color: Colors.black)),
                ),
                SizedBox(height: 20),
                // OR Text
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
                // Already have an account? Login Text
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage3(role: 'Mechanic')), // Navigate to login page
                    );
                  },
                  child: Text(
                    "Already have an account? Login",
                    style: TextStyle(color: Color.fromARGB(164, 114, 117, 119)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}