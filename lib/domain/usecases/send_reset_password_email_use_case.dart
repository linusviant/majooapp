import 'package:majooapp/domain/repositories/user_repository.dart';
import 'package:majooapp/utils/result.dart';

class SendResetPasswordEmailUseCase {
  final UserRepository _userRepository;

  const SendResetPasswordEmailUseCase(this._userRepository);

  UnitResultSingle call(String email) =>
      _userRepository.sendResetPasswordEmail(email);
}
