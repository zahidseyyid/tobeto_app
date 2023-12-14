import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/drawer.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      drawer: const MyDrawer(),
      body: Container(
        // Add your content here
      ),
    );
  }
}
