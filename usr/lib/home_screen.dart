import 'package:flutter/material.dart';
import 'package:couldai_user_app/create_app_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DEEPEN Hub'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome to DEEPEN Hub!',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 8),
            Text(
              'Publish your apps for free!',
              style: TextStyle(fontSize: 18, color: Colors.grey[400]),
            ),
            const SizedBox(height: 20),
            const Text(
              'Your published apps will appear here.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateAppScreen()),
          );
        },
        tooltip: 'Publish App',
        child: const Icon(Icons.publish),
      ),
    );
  }
}
