import 'package:meta/meta.dart';

@immutable
class UserState {
  final bool isLoading;
  final String? username;

  const UserState({
    this.isLoading = false,
    this.username,
  });

  UserState copyWith({
    bool? isLoading,
    String? username,
  }) {
    return UserState(
      isLoading: isLoading ?? this.isLoading,
      username: username ?? this.username,
    );
  }
}

class UserSuccess extends UserState {
  final UserSuccessType type;

  const UserSuccess(this.type);
}

enum UserSuccessType { logined }

class UserFailure extends UserState {
  final String error;

  const UserFailure(this.error);
}