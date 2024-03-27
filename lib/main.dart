import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_project/firebase_options.dart';
import 'package:firebase_project/utils/constants/app_routes.dart';
import 'package:firebase_project/utils/local_storage/storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Prefs.instance.init();
  AppRoutes.setSystemStyling();
  getBatteryLevel();
  runApp(const ProviderScope(child: MyApp()));
}

// Define the channel name
const String batteryLevelChannel = 'dev.myapp.battery';

// Create a MethodChannel instance
final MethodChannel _batteryChannel = MethodChannel(batteryLevelChannel);

Future<int> getBatteryLevel() async {
  try {
    final result = await _batteryChannel.invokeMethod('getBatteryLevel');
    return result;
  } on PlatformException catch (e) {
    // Handle platform exceptions (e.g., missing functionality)
    return 0;
  }
}
