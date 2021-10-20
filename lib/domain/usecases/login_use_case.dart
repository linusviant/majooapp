import 'package:majooapp/domain/repositories/user_repository.dart';
import 'package:majooapp/utils/result.dart';

class LoginUseCase {
  final UserRepository _userRepository;

  const LoginUseCase(this._userRepository);

  UnitResultSingle call({
    required String email,
    required String password,
  }) =>
      _userRepository.login(email: email, password: password);
}
