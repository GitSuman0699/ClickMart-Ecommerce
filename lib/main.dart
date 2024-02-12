import 'package:firebase_project/utils/local_storage/storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  loadStorage();
  runApp(const ProviderScope(child: MyApp()));
}

void loadStorage() async {
  await Prefs.instance.init();
}
