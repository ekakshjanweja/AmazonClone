import 'package:amazon_clone/models/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProvider = StateNotifierProvider<UserNotifier, User>((ref) {
  return UserNotifier(
    User(
      id: '',
      name: '',
      email: '',
      password: '',
      type: '',
      token: '',
    ),
  );
});

class UserNotifier extends StateNotifier<User> {
  UserNotifier(super.state);

  User _user = User(
    id: '',
    name: '',
    email: '',
    password: '',
    type: '',
    token: '',
  );

  User get user => _user;

  void setUser(String user) {
    _user = User.fromJson(user);
  }
}
