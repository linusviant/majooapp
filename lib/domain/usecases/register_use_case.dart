import 'package:majooapp/domain/repositories/user_repository.dart';
import 'package:majooapp/utils/result.dart';

class RegisterUseCase {
  final UserRepository _userRepository;

  const RegisterUseCase(this._userRepository);

  UnitResultSingle call({
    required String name,
    required String email,
    required String password,
  }) =>
      _userRepository.registerUser(
        name: name,
        email: email,
        password: password,
      );
}
