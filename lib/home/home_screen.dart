import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/auth/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  User? user;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("HOME SCREEN"),
          actions: [
            IconButton(
              onPressed: () async {
                await AuthenticationService.instance.signOut();
              },
              icon: const Icon(
                Icons.logout_outlined,
              ),
            )
          ],
        ),
        body: const Column(
          children: [
            // Text(user!.uid),
          ],
        ),
      ),
    );
  }
}
