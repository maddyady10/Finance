import 'package:pigeon/pigeon.dart';

class UserDetails {
  String? email;
  String? name;
}

@HostApi()
abstract class UserApi {
  UserDetails getUserDetails();
  void saveUserDetails(UserDetails details);
}
