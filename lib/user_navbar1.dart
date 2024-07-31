import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Navbar1 extends StatelessWidget {
  const Navbar1({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Kanagavel'),
            accountEmail: Text('Rohit@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: Image.network(
                'https://thumbs.dreamstime.com/b/anime-boy-avatar-ai-generative-art-man-273239994.jpg',
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                image: NetworkImage(
                  'https://tse1.mm.bing.net/th/id/OIP.0wL9NJJzsFl_ej_cnXqbKgHaEE?rs=1&pid=ImgDetMain',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: ListTile(
              leading: Icon(Icons.car_repair),
              title: Text('Your Services'),
              onTap: () {
                // Add your navigation or onTap logic here
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: ListTile(
              leading: Icon(Icons.payment),
              title: Text('Payments'),
              onTap: () {
                // Add your navigation or onTap logic here
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notifications'),
              onTap: () {
                // Add your navigation or onTap logic here
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: ListTile(
              leading: Icon(Icons.redeem),
              title: Text('Rewards'),
              onTap: () {
                // Add your navigation or onTap logic here
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: ListTile(
              leading: Icon(Icons.help),
              title: Text('Help'),
              onTap: () {
                // Add your navigation or onTap logic here
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // Add your navigation or onTap logic here
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                // Add your navigation or onTap logic here
              },
            ),
          ),
        ],
      ),
    );
  }
}
