import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_provider.g.dart';

enum AuthStatus {
  initial,
  authenticated,
  unauthenticated,
}

@riverpod
class Auth extends _$Auth {
  @override
  Future<AuthStatus> build() async {
    final prefs = await SharedPreferences.getInstance();
    final isFirstTime = prefs.getBool('is_first_time') ?? true;
    final isAuthenticated = prefs.getBool('is_authenticated') ?? false;

    if (isFirstTime) {
      return AuthStatus.initial;
    }

    return isAuthenticated
        ? AuthStatus.authenticated
        : AuthStatus.unauthenticated;
  }

  Future<void> skipAuthentication() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('is_first_time', false);
    state = const AsyncValue.data(AuthStatus.unauthenticated);
  }

  Future<void> signIn() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('is_first_time', false);
    await prefs.setBool('is_authenticated', true);
    state = const AsyncValue.data(AuthStatus.authenticated);
  }

  Future<void> signOut() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('is_authenticated', false);
    state = const AsyncValue.data(AuthStatus.unauthenticated);
  }
}
