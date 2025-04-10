import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task/models/auth_model.dart';
import '../services/auth_api.dart';

class AuthState {
  final bool auth;
  final String? token;
  final AuthModel? model;
  AuthState({required this.auth, this.token, this.model});
}

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthService _authService = AuthService();

  AuthNotifier() : super(AuthState(auth: false));

  Future<void> login(String username, String password) async {
    final token = await _authService.login(username, password);

    if (token != null) {
      state = AuthState(auth: true, token: token);
    } else {
      state = AuthState(auth: false);
    }
  }

  Future<void> signup(
    int id,
    String username,
    String email,
    String password,
  ) async {
    final token = await _authService.signup(id, email, username, password);

    if (token != null) {
      state = AuthState(auth: true, token: token);
    } else {
      state = AuthState(auth: false);
    }
  }

  void logout() {
    state = AuthState(auth: false, token: null);
  }

  void toggleAuth() {
    state = AuthState(
      auth: !state.auth,
      token: state.token,
      model: state.model,
    );
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier();
});
