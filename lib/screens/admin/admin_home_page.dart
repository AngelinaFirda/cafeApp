import 'package:flutter/material.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Home'),
        backgroundColor: const Color(0xff8E3200), // Warna coklat
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome, Admin!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to User Management Page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserManagementPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff8E3200), // Warna coklat
                padding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 20.0),
              ),
              child: const Text('Manage Users'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to Food & Drink Management Page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FoodDrinkManagementPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff8E3200), // Warna coklat
                padding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 20.0),
              ),
              child: const Text('Manage Food & Drinks'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to Table Management Page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TableManagementPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff8E3200), // Warna coklat
                padding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 20.0),
              ),
              child: const Text('Manage Tables'),
            ),
          ],
        ),
      ),
    );
  }
}

// Dummy placeholder for User Management Page
class UserManagementPage extends StatelessWidget {
  const UserManagementPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Users'),
        backgroundColor: const Color(0xff8E3200),
      ),
      body: Center(child: const Text('User Management Page')),
    );
  }
}

// Dummy placeholder for Food & Drink Management Page
class FoodDrinkManagementPage extends StatelessWidget {
  const FoodDrinkManagementPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Food & Drinks'),
        backgroundColor: const Color(0xff8E3200),
      ),
      body: Center(child: const Text('Food & Drink Management Page')),
    );
  }
}

// Dummy placeholder for Table Management Page
class TableManagementPage extends StatelessWidget {
  const TableManagementPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Tables'),
        backgroundColor: const Color(0xff8E3200),
      ),
      body: Center(child: const Text('Table Management Page')),
    );
  }
}
