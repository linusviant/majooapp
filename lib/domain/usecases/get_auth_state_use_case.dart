import 'package:majooapp/domain/models/auth_state.dart';
import 'package:majooapp/domain/repositories/user_repository.dart';

class GetAuthStateUseCase {
  final UserRepository _userRepository;

  const GetAuthStateUseCase(this._userRepository);

  Future<AuthenticationState> call() => _userRepository.authenticationState;
}
