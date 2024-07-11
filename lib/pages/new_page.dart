import 'package:experimental_app/config/app_routes.dart';
import 'package:flutter/material.dart';

class NewPage extends StatelessWidget {
  const NewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Page xd'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(AppRoutes.home);
          }, 
          child: const Text('Comeback')),
      ),
    );
  }
}