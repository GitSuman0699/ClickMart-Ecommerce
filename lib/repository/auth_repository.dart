import 'package:firebase_project/auth/auth_query.dart';
import 'package:firebase_project/services/hasura_service.dart';

class AuthRepository {
  AuthRepository._();
  static final instance = AuthRepository._();

  Future postUserAuthData({required Map<String, dynamic> userData}) async {
    try {
      final response = await hasuraConnect.mutation(AuthQuery.addUser);
      return response['data'];
    } catch (e) {
      rethrow;
    }
  }
}
