import 'package:majooapp/domain/models/auth_state.dart';
import 'package:majooapp/domain/repositories/user_repository.dart';

class GetAuthStateStreamUseCase {
  final UserRepository _userRepository;

  const GetAuthStateStreamUseCase(this._userRepository);

  Stream<AuthenticationState> call() => _userRepository.authenticationState$;
}
