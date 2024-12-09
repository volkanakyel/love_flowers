import 'package:flutter_bloc/flutter_bloc.dart';

enum AuthStatus { authenticated }

class AuthState {
  final AuthStatus status;
  final String userId;

  AuthState({required this.status, required this.userId});
}

class AuthBloc extends Cubit<AuthState> {
  AuthBloc()
      : super(AuthState(
            status: AuthStatus.authenticated, userId: 'simulated_user_id')) {
    // No need to check initial auth state as we're simulating an authenticated state
  }

  // We'll keep this method in case we need to implement sign out functionality later
  Future<void> signOut() async {
    // In a real app, we would clear the auth state here
    // For now, we'll just emit the same authenticated state
    emit(AuthState(
        status: AuthStatus.authenticated, userId: 'simulated_user_id'));
  }
}
