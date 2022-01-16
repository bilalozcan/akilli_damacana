import '../core/constants/enum/network_enum.dart';
import '../core/extensions/network_extension.dart';
import '../core/init/network/network_manager.dart';
import '../model/auth_response.dart';
import '../model/profile.dart';
import '../model/user.dart';

class AuthService {
  static AuthService? _instance;

  static AuthService? get instance {
    _instance ??= AuthService._init();
    return _instance;
  }

  AuthService._init();

  final NetworkManager _networkManager = NetworkManager.instance!;

  Future<AuthResponse> login(String email, String password) async =>
      await _networkManager.post(Network.LOGIN.value,
          {'email': email, 'password': password}, AuthResponse());

  Future<Profile> getProfile() async =>
      await _networkManager.get(Network.PROFILE.value, Profile());
}
