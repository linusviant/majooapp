import 'dart:io';

import 'package:majooapp/domain/repositories/user_repository.dart';
import 'package:majooapp/utils/result.dart';

class UploadImageUseCase {
  final UserRepository _userRepository;

  const UploadImageUseCase(this._userRepository);

  UnitResultSingle call(File image) => _userRepository.uploadImage(image);
}
