import 'package:flutter_bloc/flutter_bloc.dart';

class UserConnectionState {
  final String? connectedUserId;

  UserConnectionState({this.connectedUserId});
}

class ConnectionBloc extends Cubit<UserConnectionState> {
  ConnectionBloc() : super(UserConnectionState());

  Future<void> connectWithUser(
      String currentUserId, String targetUserId) async {
    // Simulate immediate connection
    emit(UserConnectionState(connectedUserId: targetUserId));
  }
}
