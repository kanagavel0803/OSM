import 'package:flutter/material.dart';
import 'choice_page.dart'; // Ensure this import is correct based on your project structure

void main() {
  runApp(OsmApp());
}

class OsmApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => ChoicePage()),
          );
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loading...'),
        backgroundColor: Color.fromARGB(255, 31, 157, 161),
      ),
      body: Container(
        color: Color.fromARGB(255, 31, 157, 161),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              Image.asset(
                'images/logo_clr.png',
                height: 250,
              ),
              SizedBox(height: 90),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Dot(size: 15),
                  Dot(size: 12),
                  Dot(size: 9),
                  Dot(size: 6),
                  Dot(size: 3),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Dot extends StatelessWidget {
  final double size;

  const Dot({required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      margin: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
    );
  }
}