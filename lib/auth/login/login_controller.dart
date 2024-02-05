import 'package:firebase_project/auth/authentication_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final resigterUser = FutureProvider.autoDispose
    .family((ref, Map<String, dynamic> userData) async {
  return await AuthenticationService.instance
      .signUpWithEmailAndPassword(userData['email'], userData['password']);
});
