// auth_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/auth_model.dart';

class AuthNotifier extends StateNotifier<AuthModel> {
  AuthNotifier() : super(AuthModel());

  void signIn() {
    state = AuthModel(auth: true);
  }

  void signOut() {
    state = AuthModel(auth: false);
  }
}

// The provider to access AuthNotifier
final authProvider = StateNotifierProvider<AuthNotifier, AuthModel>((ref) {
  return AuthNotifier();
});
