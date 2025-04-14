import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dio_crud/view_models/auth_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final avm = Provider.of<AuthViewModel>(context, listen: false);
    // Debugging check
    log('HomeScreen ViewModel hash: ${avm.hashCode}');
    log('HomeScreen user: ${avm.user?.toJson()}');

    if (avm.user == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: const Center(child: Text('Please login again')),
      );
    }
    return Scaffold(
      appBar: AppBar(title: const Text('User Profile')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text('Username: ${avm.user?.username}'),
            Text('Email: ${avm.user?.email}'),
            // Add other fields
          ],
        ),
      ),
    );
  }
}
