import 'package:majooapp/domain/repositories/user_repository.dart';
import 'package:majooapp/utils/result.dart';

class LogoutUseCase {
  final UserRepository _userRepository;

  const LogoutUseCase(this._userRepository);

  UnitResultSingle call() => _userRepository.logout();
}
