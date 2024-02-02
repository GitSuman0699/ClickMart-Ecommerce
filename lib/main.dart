import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_project/utils/constants/app_routes.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter_riverpod/flutter_riverpod.dart';
=======
>>>>>>> ba7a797 (suman)
import 'app.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  AppRoutes.setSystemStyling();
  runApp(const ProviderScope(child: MyApp()));
}
